Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52229CAC581
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 14:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DD410E525;
	Mon,  8 Sep 2025 14:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oENCFLXM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E73010E525
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 14:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757340573; x=1788876573;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=8UCv1cH9vJhDXIo4tnnj5RbzmFRThr8TGm3EuCYLNdk=;
 b=oENCFLXMxiXs93ZkoGWYMBPmWLJgo0LHB5YjD0N0kg7gs7JTm/W2BetI
 uZ/Da2C4f8bkbKyKFhTgszfe7EGzpAxxV28LHqjcSQVBeSSoCkvU36c2i
 rq2ySmj1FL3go7cQ5g9yGASrg/vTBpahOo9a2m5EGHWoGKgQPmahj5Vqb
 cf7EpFLEzuOZ8dM0MTICavu+G8iWcM4QSk9wO3bzL/YbkQF/CpuHk+dRA
 aIM8dZFfsobMd1Mfcilb4oIjiFL8uzIzKRHdBGpTNEW5KkHHVg5zMSVeW
 9NjDljCoLPJVcsWjhpIA4GmO9bgisSVDn10rOohyy91DYZ36pTYz1PJSE w==;
X-CSE-ConnectionGUID: oVw1GVb9TIqlcle1HHiTHw==
X-CSE-MsgGUID: KDlCLio6RCal/U7JfBGJbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70218448"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="70218448"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 07:09:00 -0700
X-CSE-ConnectionGUID: EsZXbq4URZ+RZWUrzaN/kA==
X-CSE-MsgGUID: ScSjCs6ZRF6sy7u9DdHtxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="178019618"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 07:09:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 07:08:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 07:08:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 07:08:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYM9pXPBZDctnl/j/w2Mr6zVgCmS1FF2mwN+C8D5HREi5Jn5JPQ5IVjqVeR8sa7lbw69TTvvBedVguTdfgzftp/fVnQAys4DzZhUxP9cllL9WjI3mKub5GwO3g3DZZ/+XJPqA247uAqZGRUsgHC8qe/7gy84/CBdt+OpOZeDMIkJ54Sul2XpSU6u57MvatKUZhHD58EboHENWlcBUsUAFENXX4Ou59AmP9UQzejfcIx9GprCdLKAIfKRK8Acqh3itKCxK7CttF+lH2hjSJmmRlnGuYCglpflQuH/Yo8yNuCFatLC7y+K4Xz2cngc74FHxny+/hVcnvK2qXl80e4edA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54E85T6xEUe6y+BQ6/tsX+E+f5KvawzrEHYcdnSp77I=;
 b=AZVF/huRnwn+F+fzbAqeK34nS0ZwptJDGV1AtFx9KU5HW3GTx/7QZT1m10X+CwM9VtvNdBBap6P4O2Kpxh2TdReEXjU2pq7mmGiogJviWVbdt+EkWi7Fwr7IRy2flqzzItIRnm8zVf+U/pb9OhpUrL5l3fcBuX1/95s0TlJQ3P2hs6QwziI21Pj5CZ5wW4agxNzF1GLUafS1RASODbEyJRr80h3VLqf6reuP2QzYCM+UQ4j0lYEcVJSrdrZSOcYAKa65PYIpVOGMW8QXJ3gmwKgbIoYrdG1o63lkFUIZw5744tBEM3/5pAv7NLNJ3mstF+wWOZGTMHFt89U1B6iw7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by SJ5PPF8225D2149.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 14:08:56 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88%4]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 14:08:56 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <y2dhkx3yplrpesqlx63d46y7w5zjv7w2cj5h262p3jq5vjgp2f@dz2bjsfce3qp>
References: <20250905162236.578117-2-lucas.demarchi@intel.com>
 <175710134539.5916.1325336923027423466@intel.com>
 <y2dhkx3yplrpesqlx63d46y7w5zjv7w2cj5h262p3jq5vjgp2f@dz2bjsfce3qp>
Subject: Re: [PATCH] drm/xe/configfs: Use config_group_put()
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Mon, 8 Sep 2025 11:08:52 -0300
Message-ID: <175734053228.1838.4745774366865518571@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|SJ5PPF8225D2149:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1ec30f-2131-4bb4-823f-08ddeee13fd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlZxeHV0WndZLys2YmtIYmFqMWNjcW1wdFN1N3FqWDltc0ZncFQ2QkhWamZi?=
 =?utf-8?B?dHE4dksrS3dIRmJsUUZLWDU1Q2g5Rldpb0JBSHhPZjNaQWFZR1QzcXpxOGRL?=
 =?utf-8?B?dGRCcEZIZG1OcUthZ0JKKy9RdnlzeHZxc0lLOFh0TDNtYzZQRzI0K3ZpUUJG?=
 =?utf-8?B?ZzhMK3g3UHYwRXRhT1VKYUY2K1BkR1FiT1VQV2NlR25oUFlXVkowNXBCeUFp?=
 =?utf-8?B?d2pBMjRqK25ZTUJFQUp4a0VwaFFQVGt5YjNLTGxsbFRCY2ZuTnNnUCtrckVo?=
 =?utf-8?B?N3NUSUxjM3gzSFhEZG1iakdNNXE5am5zRFhwTTNmQ3owWWIvcjc5L1ZqYzVK?=
 =?utf-8?B?NStrS2Z5aHhVSUorb3BNZVcwTVZoUWF3aHk2RXJjei9QYnUvRktHOEZNZ2d5?=
 =?utf-8?B?OVl5YnJqK0MzMDVWaGpwa0VaanhzcTF5TDJaaUxjQkZoalA5NVY2Q2Rhamsr?=
 =?utf-8?B?anlIYmM3VDcveFU1aDhsWWNuQkVHMDlhMTJ5cnR5OWtPdkEzbndPZlY4NjZL?=
 =?utf-8?B?a05ZaXFHOVZxSW1PNkJrSUQ2QXV6d0xkWjdyUWpORVZlWHNYdnFvQlpLNWxT?=
 =?utf-8?B?WnoveGMyS20rZ2NtcTNxZCs2Zm9yRXk0UlZFc1ZndDYwSUFjMGFqRS9tM0d4?=
 =?utf-8?B?OFV5R2hTbUR6UGNidnVmd3NicExPRnBSekFhUHE0alRmOERmcTlzZjZlMUY1?=
 =?utf-8?B?eENsZW9NbnR2RWFTMXBScklnd3lSbkVuZzlFb2dNZGIzSGIzbUlHd2c1akky?=
 =?utf-8?B?cUZxazdyT0V5K1c2dEpPZ2NQRjg0SFNITFNnczBDQll0Mnl3U3ppVUpRc0s0?=
 =?utf-8?B?Q1dVSktGV0JDSkJobzdOc0tZWWJTSGM1UmxZSkpsRkRaaGh1TGM3YWpIWVZz?=
 =?utf-8?B?NWZPVVlvb1VKelA3dGYvZzYwKzNCcHYrajI0RW5mQTh1MGVtdnJzYTQ4dGdQ?=
 =?utf-8?B?OTUzMlQ2N0Z0bVY4OG5YNUFXcmJkNjZNNS8rUERQU3MwcExmaUkyb0d4alhF?=
 =?utf-8?B?TXV2YkMxc1ZJM2J3bHJxUUEvVHpHSEoxV0ZSczdUWFI1Z2x4L2VJZDBFVFRm?=
 =?utf-8?B?QzdJM1BiQW1WdlhxQnlHU05veitYdlc2aW43NUQ4WkkrVHdHbk81VXFCaFMz?=
 =?utf-8?B?UHpLVlhBNVpudnBrOUZYbFMvRksya2RSWUpOYW8rYTBLdlNSS0IyaEdLWlZU?=
 =?utf-8?B?QjgwRTAyVXdyeUFnUkZnZ2lZazMzZHRNaVNzM1lXMkFlQitVRjl0RFZORTVT?=
 =?utf-8?B?QlN0Y3pWRjhhQ3U4WndQVnVvd2ZidG9YRGlTZjg0S1pERkw5SlAzdDd5LytR?=
 =?utf-8?B?U1VWUms3UmFTUzNLaDlTczlIOHhOWFlPOHY3Y0drUW9lNEIvSlVxZFI4M0ky?=
 =?utf-8?B?UGdXVko2UmdIOVdDSkZ5OTd5Ly8xeDFkVDJnWlVqNmt0cDl3bnpIcjJ1SFh6?=
 =?utf-8?B?NUNiOWxIUHhiNEhRSzNUT0t0UnRYWWwyTUlXSExOU3NPWDVuN3JIeUhMeHMy?=
 =?utf-8?B?K2pXTUhLdGU2VkNmZTBLdkc2UjJleE8rYktncFlVc1ZveEFHZEZiK0ZzUlRo?=
 =?utf-8?B?OVNSSm9qVGMvdmFVUWhmQW00Rk1LYUtCU2FPM2thUWNWb3o5Wnl3NHhpRkdO?=
 =?utf-8?B?VmJmUVh5a2YwdzRYUlJTZ3BxcnNMU0hLMiswL2haNHdLWXpzNEF6R08vRWFP?=
 =?utf-8?B?Q3Jzc2FqUVI2QjRtU1pDUlVYNmg1N2R3MGdFUG9wL1plclBXd1NIUlNlZzBs?=
 =?utf-8?B?SVE0bFNkeTFXeVFYNElwb2dlZUpDZG9QeHZMMVh4ZjFLMjArSWM3UHZSMHEw?=
 =?utf-8?B?cjhrQVVWbE9mL1RTSHdnSnlQeEZMQ2VnOGZ6NjFCekx1cGFnZmFjK1JBbzA2?=
 =?utf-8?B?aEczTjIwd3Jham14V0FaaGdSRU8wbjVGaHRKcEpUR21mdmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmNOUXRFSGxIVXBRZDdxL0FLenZ2UHZQd0NZVCtpZ2orV1hVVWpLM3B6bXlJ?=
 =?utf-8?B?RytoTEpFSG9wL3N0dmRGSTZUdlRhTEF3T0ZZOVdLQ3lFZFYvbTJjWUFLQmI5?=
 =?utf-8?B?YnYyQWhUZTBrU2pUZG4rQ1FvcE9EUkxXRnlWK0hDMkJQMTVRUFBuby9qUmYw?=
 =?utf-8?B?WDM1SHd5MVB1eEE2UFdZd1Zod1FDRG41UzNKR2hzdTZDbGMwMWs5Vzg2VzBs?=
 =?utf-8?B?TCtDODdoSGprNVJwYmJ4dGExL2t5TkdVVGh1a3FEZjVzN21QN0JwZGJHVFdK?=
 =?utf-8?B?YXg5YVhhdmtEUFhwc0h2ajVRZHprRTRkOER0LzZWb0JTU1hvbFBZVFkxUDI1?=
 =?utf-8?B?aitpOG1Gd1RhbnpXdEExZlNLVFBXQVEwdVcvKzcxeXlLbzdhQXV4akdpTXo4?=
 =?utf-8?B?Unc0Ym9PYXdaaXNFS3phajhWbVZOMjRHMkp2NDBaTEJMVkc4THVWVk13UTVB?=
 =?utf-8?B?V0x6dTJtaktDWnoweTVhM3NoSzIyaWxYRDVIZjJLMWVDaTBHSjY2aDVxZkR6?=
 =?utf-8?B?cEN1Y0szZmNwRHZLWm5ZSjhTbXZCZVdJZS9ud2NaUkRVU3VXMUNLQWV5UWxB?=
 =?utf-8?B?N0FCRjQ5QTNORmJsUTUzOXd4dEFNdjM5NEFhVVdIYXQzazE0MEFnWEJHYk90?=
 =?utf-8?B?OEZMK0U5aDlKaXZYVmIrVks1R3hmODV5RlROZWJ4ZVdGcjhtSWFOVEdmdWJn?=
 =?utf-8?B?cTJ4SDlyUTBaeDR6MElNWGlBWncydUJ1V3lrYnV6aGx0RUFBMzJxNEo0VW42?=
 =?utf-8?B?b25YZFhlZkdvQTlHTllIclVkSEFRZnBtR3BETHMwRy80RW00ODRMN01ZcU5Q?=
 =?utf-8?B?dDJSVjRmbTh1VUZlWGVzb0R0dlRMcFlDUFdLWG16R2NQUnFJTWMrcHJ3Rmpm?=
 =?utf-8?B?RkljYWdaZ25tTXBQTFcvZU5DbW1oS25zM1JweHV2M3c3Y0NnQnI5Y1QzbHpk?=
 =?utf-8?B?Uk1xTVRmdExFanY3dk0wOTVRWTBuU0lYa3NiQVdNTjNXVmdGaGN6Sk9wTFE1?=
 =?utf-8?B?YVRrSXBkdE9QRnlIajE3NGtFYlV0Y0pMUVZFK0hOOXJYWXFTREN6REhVRmFM?=
 =?utf-8?B?SnRlTnI4aUxhQ2R4UGgrTWIwd1RoY3VOZW81eEFnd1kyRjluK29Oc0U4ZVY1?=
 =?utf-8?B?VVhzTTdQVytIS0pKZTZzQUNTb0hHYlpWdGU0Z0VVVzJ0SkRndFVGNnBhU1RH?=
 =?utf-8?B?MHVtSTNGUGZVRmUxZ3pxTGdYTytIVjI4bm1BSmVtbVBZdHRHVWZKWjZSejh5?=
 =?utf-8?B?eDBHNGtLQlY3MkROVXZRTWtUTEhVaHBneXVMTi9sOWxEWENheGNHOFNOK3Uz?=
 =?utf-8?B?RFM2N2hEZUhTUE5FS1ozSnIrSnNtUldHQlBIL1FQdXY1RnlhYTZzdUxBOE1U?=
 =?utf-8?B?VXJkdTVJaHAxTVIrb2pueTl2bFAycm5HSVVGek5yK29JaXFhcDJURjJScXRN?=
 =?utf-8?B?Slh5OHM3SmNGVjJGUzYyNEUwaCtSNU1aRFZXUUhla3FmNmFQc252L2tqYnhG?=
 =?utf-8?B?V0JNMktSQU1lMlM5R1NhT3RqckVzSkFrM3JNYlhKZCtmR3pQSG51ejN4Z3FS?=
 =?utf-8?B?WWUvK2hDRlZPS1NCRDNNcG9teXZicUZCY2p5eWU3WHBXdkpkbDBRMVpuZE14?=
 =?utf-8?B?dlU1alJrckltR3JCWnVnQUVtOWZoTytFVDRLV0NtK3dyNFQ1MCtJVTdoa2s5?=
 =?utf-8?B?SGpBMnFoMklXMlVIVXArMDV5MnA0YlkrWHVDWld3TS9zaStsNjZXNVk5b21G?=
 =?utf-8?B?R1NQSkdKZVh6OE1pcm0yQ3YvQlZtaXlIdlRjbXFYcjJQeXBGVHQzUXJDWU9m?=
 =?utf-8?B?cUtURlJZcWtzbGFWTmpyT0FGLzF3SEU4dSs4bXo5MklQN3oycXlYVmxpaHJk?=
 =?utf-8?B?TU96S1YrUjBzWmRuNmhxQkVhUDZXTll3QUVtbmJCOUorU0pMQ2ZLeGcycTI5?=
 =?utf-8?B?cEducnZaZE16MmZuUVMzVENvZGVRaDNBTHl4SlkvZVNJbitkTFVrelVXdGJp?=
 =?utf-8?B?UFVPNTZXWTVnK0tCUDRzOW9qQ2lSSGNDcUZHQll3a2V2SlByT2hqZUZyOCtr?=
 =?utf-8?B?SmUvdEUxSUJvYUNvaEg4dTBDdFpRS0lYcEM3MEk4RnE3OFZXaEhmSXVBQWIw?=
 =?utf-8?B?QmNxcnFlVFh0VWJFYkJuNWtDUU5ZSWwwTHpYUzJFYzdQaW1zankvWXJveTho?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1ec30f-2131-4bb4-823f-08ddeee13fd0
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 14:08:56.3607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSuqseF3F19GmL/9Vz5PcVCbUYfkAyOIvNzJSMyhB/hg0l3X2IlMSoKoCCsRz9R8k3UvJB7qOntY7YTAALnbJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8225D2149
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2025-09-05 18:38:28-03:00)
>On Fri, Sep 05, 2025 at 04:42:25PM -0300, Gustavo Sousa wrote:
>>Quoting Lucas De Marchi (2025-09-05 13:22:37-03:00)
>>>configfs has a config_group_put() helper that was adopted by
>>>commit 88df7939d728 ("drm/xe/configfs: Rename struct xe_config_device").
>>>Another pending work to add psmi later landed in commit
>>>afe902848b41 ("drm/xe/configfs: Allow to enable PSMI") and didn't use
>>>the helper.
>>>
>>>Use config_group_put() consistently to hide the inner workings of
>>>configfs. No change in behavior since it does exactly the same thing
>>>as currently being done.
>>>
>>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>
>>By the way, after taking a look at how we are using configfs, I wonder
>>why we are defining each "device" as a config group instead of a config
>>item. Shouldn't defining them as config items suffice?
>
>The xe_device maps 1:1 to a group, i.e. the <configfs>/xe/<bdf>
>directory. When setting/getting a file (aka item, create from the
>attributes), we find the group they belong to and use that single
>lock to synchronize:
>
>                  1:1                                1:n
>        xe_device ---> configfs_group (xe/bdf) <---> configfs_item
>                                `->lock

Unless I missed something in the documentation for configfs, the
attributes themselves are not config_items, but they are rather part of
a config_item.

I believe our current hierarchy is as follows:

    xe (the root config_group for the "xe" subsystem)
    |
    |-> <device0> (the config_group for the "device")
    |    |
    |    |-> enable_psmi (attribute)
    |    |-> engines_allowed (attribute)
    |    |-> survivability_mode (attribute)
    |
    |-> <device1> (the config_group for the "device")
    |    |
    |    |-> enable_psmi (attribute)
    |    |-> engines_allowed (attribute)
    |    |-> survivability_mode (attribute)
    |
    |-> (...) (and so on)

The way I see it, we are defining each "device" as a config_group, but
we are not using it to create child config_items; and we are using the
group itself only as a config_item.

I don't see much need for us to use config_group to represent the
device, at least not today, since we don't create child config_items for
it.

So, I believe defining the device as a config_item (which would contain
the attributes) would be enough, no?

--
Gustavo Sousa
