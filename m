Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E741CA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 16:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BEA10E49C;
	Mon, 18 Aug 2025 16:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOsj0Bnh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6C510E49E
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 16:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755533170; x=1787069170;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+Nlj+ow9t0abjEhHpbQqcFVX0iJf0TwcI/6WKyGxL44=;
 b=TOsj0BnhwxcbUKda2b1C5MiiKoROjCjEj3A8cu7JCtcS3TSv7ikeTAhY
 1jXgHMAbpDRPradJrrlOHA2i2CaizPxNG5tubopowBR2J9gfzIYzBQykr
 GwIFcSKkx/AFxfluL6/sJb+l6IIYYF4QHaYdDLV2m0WURkri8uiMe0epV
 orbawiknr59oK6QQForzLu8cNH3N7xpkLCd6CyCXAgg0Yk6WVtJf4XdJv
 5B1EyLJZMq5pug71I+CK/l8F3PxOjKsYhVHTaW2sGJ05XQBEY04adEvsy
 easkqU4QEdEK/PztJRD6BqpEHMa9wvH2O9f6gPM8hLvu7fta23ddti1S+ w==;
X-CSE-ConnectionGUID: VyDcRXLkRk2hfJ0VoqVbHA==
X-CSE-MsgGUID: /ufFEQLFRmWotiSn6urN/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57689954"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57689954"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:06:09 -0700
X-CSE-ConnectionGUID: nwrS4bCnQS2m8Cc5917BOg==
X-CSE-MsgGUID: y813Xh+NT9iitDggEyUMaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172816104"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:06:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:06:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 09:06:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.76)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:06:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8B21XGGnGPvYXIeOmXQeiFLQpSxtdM8lacOtgzBzA/CcOEiOFL75HmGzlHOoTjyoh+cxJaxjOcTJYWiMuwxTvt97cRFgrFwmb4Wwx5vUw+hWYX3u4xA7ZkQOoPNMuJOY5ly9kj4LsN6PA+7RuY28GAmeWhHYm9Hd94nglTnF16YKAX0YK+7fmpcgsp/9JKDvQq6H/ciwFLkzLR7yaba4Rnq5XhcqTf+4b9l4kE2O6uBvZYt/FY0nSCuRshal7Q+PkCNqG2tPCnn/h0nyXN1wLTM046RUzl74exdXuuuUQr+OKZ3PZNam0oweky1YP6fKy8RwKwTh6xLDiM47OlyuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hoagSc5j6FyI39DRj2rr2pEScvdPNcwe/ZHwooFrZc=;
 b=g42YZGoiYban4hhv3cHHor5cftyd9jKITiIoTSmdtCK/afhmEIEGGPnroqSpwOCrPgP214bWhbBtJyJBztuSqVKAsoDq/yJXUl0iz7DL6jhVWUumuNEVw/0V2zvFBStKbhfDjVUG7fsxzoFjPzRmHxO6gpSjvRzIjVO+k/NDGbCg24BK3gcZj9pJVlm8HKEgz5V0K6mjH01oh3rkGCV1YIaPSkGFkf2w0diZe5FiHFZ4MfP5wYnxPcaS7TjeXo7sJO95pKuGjenG56fgjkGFGc8q217kLgsNT19LFAsUCNFeU5ZwA9fJCrU3u8FBOcqOTcpAF/ghouuW8hXKvKLteQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7316.namprd11.prod.outlook.com (2603:10b6:930:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 16:06:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 16:06:06 +0000
Date: Mon, 18 Aug 2025 09:06:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, <intel-xe@lists.freedesktop.org>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v6] drm/xe/pm: Disable RPM for SR-IOV VFs
Message-ID: <aKNPa42rL1LF+gLw@lstrano-desk.jf.intel.com>
References: <20250812163613.9954-1-satyanarayana.k.v.p@intel.com>
 <aKIGF3wKoK3U6bVu@intel.com>
 <aKKMLn7becx6s4Gh@lstrano-desk.jf.intel.com>
 <02a896d2-f992-4814-95b4-316d10425fc8@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02a896d2-f992-4814-95b4-316d10425fc8@intel.com>
X-ClientProxiedBy: MW4PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:303:16d::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f970be-4322-49d1-4d29-08ddde712388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHJFSTdzcmpJUkVUQ01lYUlWaXJaKzI3Q05TVmFqZzFTYlJmZGYxVk4zeDBU?=
 =?utf-8?B?SlZvWkRscDFqSTJVelZwbEowZ1huZXYxZTFkODNUakNWNlVWUmh0OHlOdjF6?=
 =?utf-8?B?Q1B0NFYzOHBhYTdKUjBWLzRtTWZPWWRkRXpxRC9mVndGaWVoVlFxV0FBZmEx?=
 =?utf-8?B?aDNWdjIxVHpqYXNVU0tDYUQvVlRvYXgzZEpNbW8raEhFM0pjN2oraS9YL2Fr?=
 =?utf-8?B?Ky9vWHlVNC9TdXI1VjMwM0hvMWFvUUh1eGVsR011OWZIUGJRanRFN2RDaDY4?=
 =?utf-8?B?SUxxdGhnVzNPQWZNbDZ1NnRyMzFKOTVYVFFGV0F4YXpreVRlK0QvRFBkNGF5?=
 =?utf-8?B?VFBxTGlIMytHSnd2ZTQ5Q3ZwZUhSQ2FMV0VnVGxJNm12MHUxTks0d01TTUVz?=
 =?utf-8?B?RXIvMEprRGp6VHZ0MVlwNVdwWWtvNzRjanFzbTNIM1RWZTRpbVI5ekVVQ1Np?=
 =?utf-8?B?dE54K2xpWXM2RWQ3dHNpdGRFdENBTkcwN3NGcEhmdjVGS2RPRXd4a0xYcFdY?=
 =?utf-8?B?TGdtQURjUlViRFEzMFZSRGJZV1BPTE5ReElOQkRYR1Q2c3hvUEZnQ0dJY3ho?=
 =?utf-8?B?LzJDSlp5WEFlcXRCODhZdE1yOUtUejlCbFVyZmUrLzlXeFBqT3lJc1FyR0xs?=
 =?utf-8?B?NmxRRS9tb0M3a3Zld3VmdmJiOERXVFFia2UvbnBnK2xvZFh0R0pWT1FNL212?=
 =?utf-8?B?Y3JxSGszTzNVc1Q3NWpUSGhXRi9TemUycnBwTm0yWU5ZV2J4R0ZhWC9WSWxu?=
 =?utf-8?B?WXpOd0pXM2piVzNrVFdmQlc4bkFFSGs2RUJiU1B3dk1sYTZSNXNTVXdGVVdv?=
 =?utf-8?B?L3EwTGErVEpORWxLRm0zekduazFvOS94YnBnNm9RUHVpOW9hc1czWGRITzB3?=
 =?utf-8?B?QnUxTGpaMG5yN2lPZFZIUXV4NWJoN0h1SkdUWTBydjBwc3FhbFZXWkg5NUY5?=
 =?utf-8?B?T00rcklYUDhiTnQvNHptRm5lYjVudGxOYnFoQ1RtazRtRnFKNnJlKzlSRVpQ?=
 =?utf-8?B?WU84S3NIY1FLT1FpU0pNdGNHRG9QMWJZSlV3bXM2V1Y5NlBReVRyWi9maFFl?=
 =?utf-8?B?TFB6WkhxZXgvcEFWeU1zb1BpSzZCbjVsODJxdmRySnJpVkxjZDFrVmR1UG0x?=
 =?utf-8?B?N1c4cEtRbFY5ZEZzN1owanA0djExMEMyeDlpMUFlSkpuU0hseWx2TDMzaC9k?=
 =?utf-8?B?TEp4MHp6aEkwSjcxd3NjaUVYVGdMb1ZXd282bG13RW0rT2EyK05ZK0UzbU1B?=
 =?utf-8?B?eVhUaFVoSjEyY2hEdk1yV044UW8rRGFVM2NCaFN0MlpFdTlDSEkzN1hLdTVQ?=
 =?utf-8?B?UXhEUVBFdEpzbWgvSW9teExVaXNyYnVrVFdKTWpocjJSSUw3SkNsT05mT2dz?=
 =?utf-8?B?N3ZVc3VDNit0cWJQN0hmMUh0ekp1MmpwSzNIa3dqakw3alVDTFE2U1hkYzVG?=
 =?utf-8?B?b29MV3E5VVJLNVJmT1YvT2tLRTh2YmppUTlXUzA5ck5kd0FuMVZZWkc0Rjc4?=
 =?utf-8?B?T2Q0QnJLQVl4ZFpXbHVNcU1xMXQ1NG9Da0UxS0M4UVFmc2d4T0U0THRtdEVS?=
 =?utf-8?B?RWNHYjZER0xIS1JESThRUWpUTzEyRmx5WlJlWXdyTXJsZW1mU2psZ1ZBN0tI?=
 =?utf-8?B?VnRXbStOM1JPbFluZERka3pWUHhFR0JsUlo3eHlHT0Q3ZHFIQXMxZkwyWnRT?=
 =?utf-8?B?MlVvendDK2g3Qm5XQjZUS1dIRGI5cXFNb1VQR2FNOEJVSTlpWDBDckNVMkxQ?=
 =?utf-8?B?Z3hrK29Bc2V0UGxYTmJMVHpSYXpSUFhvS21uODFXbTlUNDdhQjRLWDhhMW5z?=
 =?utf-8?B?MDlwUGJsWDRoRG5NaTFBeTlOUWI0TE9pbXB4d2tEMzNtQWpzUGNVVGMxbitJ?=
 =?utf-8?B?WlU3TVRiVzcwZTJhZUdzU2N6anVmL0hldDZ2V2ZaUmlvTW1HM2RrNnJMdkw5?=
 =?utf-8?Q?BGOhVuykAIw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVkvM3RvQWtqNGlWNUZIanhpVjB3d0NvMmZXUTkxR3dLNmlKRXRZUjhvOVZT?=
 =?utf-8?B?UGxLMG1Yc2JQVzV1WFlGRHphb294LzdiQU5idmxYVytLRmV1WTRwb1VmZnFa?=
 =?utf-8?B?Sy9UbjZydERab2N3dHMrNVN5MllDaWs1VnFrVG9wNUJ3bzBidzlPbzRUN2FJ?=
 =?utf-8?B?SXNkUTdDMnh6RnJSTDBOMjVkMWEvWUN1Mldqb2F0aWlLeDU2eGJITjk3MWdX?=
 =?utf-8?B?VUE2dDJIU21jeDNmTFRVYXoyYkNMdCtRYysxWUFGZEpmZGdWeFc0anNHc0VM?=
 =?utf-8?B?MFlmclFkWTIwenNuSnlhTFlhZUk1ZVY4NXJJd2UxbmFScXJwZlVic2IvcjhD?=
 =?utf-8?B?RnZuSnd3NDgxZkxidFpPT3p3L2d4WDgyZC8xY1IxNXo3NTFJZEs3c2psaVli?=
 =?utf-8?B?Z0tKMEZJZWwycUlTODU5Y1dBaXFsK09Jdk9iSGNlQy9wNVc0V0dWbm5XRGxs?=
 =?utf-8?B?RnA0cU5YZjVUZFI0a0pRanVzeDlONVlqZWtzVDJOUFFJNlVGeE85dnpOSjc5?=
 =?utf-8?B?S3RIU1RWMmdnSWk2NHlDQmI5akRiR0o1UnlKeFdOOVF4cm9ESGttUGo4L0F5?=
 =?utf-8?B?SGcyL0luYmVDWDd1TzB5cmhCUUJaaWZocGhZU1NneXJEcENWc09qTElMaFc2?=
 =?utf-8?B?VGsvaWROS2ZqaU1odzc4Q0E5VjhtUUxSeitQY2FzbkZoK2kvbFZ3dktJcngw?=
 =?utf-8?B?cnlERWNCdHRqSmpzdm1oN1dpdnNDdFgwRGk3TTBhQUVYQ0MvZm9hUlAwVitH?=
 =?utf-8?B?SVR3UzFuV2dxUm1wQ1NUZmFzTW45Zk5VTVF4U0l0cFhWa0V3bWR2RUdmRTNI?=
 =?utf-8?B?dktUS0F5VXVqSkV6YkFncmhBdktwRUUxTjl1TVc0alRzSzZ0c2hWbUFIeEZy?=
 =?utf-8?B?ZGpSWHExZTczcGRJUWpqSmxlVlJvdi93blFORHhGYzhEd2lxUWF6ZGZPRkdy?=
 =?utf-8?B?S1pPV1lQQVFqUU9TT0I5ZGxwQVpqZGI5N3F3WFk3R2MvUEh1dEZTTEY4UkxE?=
 =?utf-8?B?UVV2ZzkyNnlUcldxRkNrSE9Vckc4NHpVdGNaRCtBeW12cEM2RGx6cmlVOXQ2?=
 =?utf-8?B?TmtNVENqd1FCOTdOWDVRbWovQWlmZnZCVTRtdFQrZDh3b1ZxMVNVMTV1VHlR?=
 =?utf-8?B?ellCc0ZaUnZZTUljbWFDdHY4SU5QT09CTytOeklBdis5NzlKZ1hNbEhiYXVE?=
 =?utf-8?B?b3VBdEsyU2V5QWxlaWFVWGhwY1d3R1I5SFMrMEdKQnlCMEszOUc3UVZTUmxM?=
 =?utf-8?B?TWgxN2ZNOHBDNUd0U0xJM0x6OVJmSEdwbFlSdFpjMzBsTTR0NXNtTWZvZ2tV?=
 =?utf-8?B?VnUwOVcrV0NqZll5Mm5FbGFwaEMzN2tZU1NrRjdycVlHajlONllyT052SGJx?=
 =?utf-8?B?b1FVTTJla2RGYVo2aTFtSFMrVlNEVUp1UmNCdjhWTWNsa0pRWHdGNmdaWFZk?=
 =?utf-8?B?UVhzYlk2K1Z4UDNvTGVFdE9TaEh5NmNaMkczdXoxd2twMHFYbjVsWUN4cGFq?=
 =?utf-8?B?RExabGo0WUJHUFJuajBFVEtrOE11VVlwNEJzTTNlRDZyL2hPazN5NXpPSUdL?=
 =?utf-8?B?RHJPNDVVTmIzeEg4OFlEa0trU2ZTTDJyRVZ5Y2JhM1o5WVhISWFJSTJzdERI?=
 =?utf-8?B?S2dkTW8xZDlBWFVrbDRrRThWME5qMkdNSWJSYU8xZlg3anIvOG9uNFpBVnk0?=
 =?utf-8?B?KzVWVi9ZWDdoZnVvZHlVQWZyVW1BbEJNS2I3SVVpd3dLaStuY3h4ZmtSMmlt?=
 =?utf-8?B?aldjTDYxRlBHYTg4eldtT0YwbWduUEU0akVtY1Y0RkE5SEpiTnlRRk5RZ1JW?=
 =?utf-8?B?azBlS1gvV3BoVkt0enJXbGc4TnBuVFd0Q0VzOHN1ck9TOHo3ci84SENYZ2sz?=
 =?utf-8?B?MktNNzZ6VExkSEhlK3BHUVdJd1NIOEp4aUgyTFhVN05iakxmOVdSSDUxSFdO?=
 =?utf-8?B?SVVhQmJiMzBveTBrYUZRckFmK1h2Yy9DWlNhRVBob1BtMS8rOTB5dXVzY1hW?=
 =?utf-8?B?NVkxeUN4RmNZeml5YVFlbXVDSFhkSHVtU216YXllQmJ3WFBhNlJaemFDK1py?=
 =?utf-8?B?SDdhbFg1RHdSUXNnS2FJSmxFbTVySU9hSnFTNHhFOG9aaHUveXREdkk1MVdN?=
 =?utf-8?B?MmIrR0hOa01yYWFLRkMraGNGYlMwVHY5OEtZdmhvcThJamhLKzREY0VNVnJ1?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f970be-4322-49d1-4d29-08ddde712388
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 16:06:06.7239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mkf9uBLBgtSlr0v2WsV8FsXiRLaDRxXT+LqZ7o9zKKv3cmtYTQqEVak+geWtUYUJbBfhvr+s0CPq+FGL+f/Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7316
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

On Mon, Aug 18, 2025 at 11:13:32AM +0100, Matthew Auld wrote:
> On 18/08/2025 03:13, Matthew Brost wrote:
> > On Sun, Aug 17, 2025 at 12:40:55PM -0400, Rodrigo Vivi wrote:
> > > On Tue, Aug 12, 2025 at 10:06:13PM +0530, Satyanarayana K V P wrote:
> > > > VFs without native PCIe Power Management (PM) capabilities inherit their
> > > > PF's power state as per PCIe specifications(§5.10.1 PCIe Base Spec 7.0).
> > > > Enabling Runtime Power Management (RPM) for these VFs trigger unnecessary
> > > > driver suspend/resume operations that ultimately perform no PCI-level power
> > > > transition.
> > > > 
> > > > Since VFs without PM capabilities cannot independently enter low-power
> > > > states, the existing RPM workflow becomes redundant:
> > > > 1. Driver executes full suspend/resume sequence
> > > > 2. PCI PM transition step becomes no-op
> > > > 3. VF power state remains tied to PF's status
> > > > 
> > > > Disabling RPM for VFs eliminates this redundant processing while
> > > > maintaining proper power management through PF dependency. This
> > > > optimization ensures VFs follow their PF's power state without superfluous
> > > > runtime handling.
> > > > 
> > > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > > > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Maarten Lankhorst <dev@lankhorst.se>
> > > 
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > 
> > > and pushing
> > > 
> > 
> > This might need a little more thought(?). What are the full consequences
> > of this patch? For example, will xe_pm_suspend()/xe_pm_resume() never be
> > called on a VF? I think that’s correct and desirable, but consider code
> > paths like:
> > 
> > if (xe_pm_runtime_get_if_active())
> >          /* Take action assuming GPU state is valid */
> > else
> >          /* Take action assuming GPU state has been lost */
> > 
> > 
> > On a VF, this is now broken, since we don’t lose GPU state—unless I’m
> > missing something, or xe_pm_runtime_get_if_active() always returns true
> > on a VF which in that case we should be good.
> 
> It should behave as though the system is always RPM_ACTIVE with an elevated
> refcount (since driver is no longer dropping the refcount to turn on RPM)
> which will make it always return true for if_active() and others.
> 

Thanks for the explaination. I see patches out there to remove the GuC
reload from Dc3 hot path too, so maybe the case I raised isn't even
valid.

Matt 

> > 
> > Matt
> > 
> > > > 
> > > > ---
> > > > V5 -> V6:
> > > > - Updated comment (Rodrigo).
> > > > 
> > > > V4 -> V5:
> > > > - Disable RPM for VFs without checking pm_cap (Rodrigo).
> > > > - Updated commit title.
> > > > 
> > > > V3 -> V4:
> > > > - Fixed review comments (Rodrigo & Maarten)
> > > > 
> > > > V2 -> V3:
> > > > - Fixed review comments (Michal Wajdeczko).
> > > > 
> > > > V1 -> V2:
> > > > - Disable RPM only for VF devices when PM cap is not implemented.
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_pm.c | 8 ++++++++
> > > >   1 file changed, 8 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > index 5e8126ca8e27..51934d5dc44f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -247,6 +247,10 @@ static void xe_pm_runtime_init(struct xe_device *xe)
> > > >   {
> > > >   	struct device *dev = xe->drm.dev;
> > > > +	/* Our current VFs do not support RPM. so, disable it */
> > > > +	if (IS_SRIOV_VF(xe))
> > > > +		return;
> > > > +
> > > >   	/*
> > > >   	 * Disable the system suspend direct complete optimization.
> > > >   	 * We need to ensure that the regular device suspend/resume functions
> > > > @@ -367,6 +371,10 @@ static void xe_pm_runtime_fini(struct xe_device *xe)
> > > >   {
> > > >   	struct device *dev = xe->drm.dev;
> > > > +	/* Our current VFs do not support RPM. so, disable it */
> > > > +	if (IS_SRIOV_VF(xe))
> > > > +		return;
> > > > +
> > > >   	pm_runtime_get_sync(dev);
> > > >   	pm_runtime_forbid(dev);
> > > >   }
> > > > -- 
> > > > 2.43.0
> > > > 
> 
