Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B4BC369C9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 20:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AD610E3BF;
	Thu, 17 Apr 2025 20:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6HxzAlG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A91A10E3BF
 for <Intel-Xe@lists.freedesktop.org>; Thu, 17 Apr 2025 20:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744922738; x=1776458738;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cc75khg7Spjt+rHTJF4sr0QM4HHpRp6MG+jj98P8FMw=;
 b=S6HxzAlGnAieJVRqruJgqvZ8EpX6wYcvXduVXFMfS0xa8Dm6db8il1tT
 RA4e5NblRevWQa4dqxW+fo2N6ylOsEoS6AICitdQfqvQ9GoEIxXUP9VLf
 PwspyqFuGJ06nKhytx/nGhyECJ1m38aUBmH/k9y0FecKrmQULI2vGxANI
 2V4Y3+khUE9jdXwhq+C0LjzqnGsKP8NEV5ilTl2R2lgq98SotWtNT0jEu
 /FVrzSt9ybFS9K4YoTIvMLxjqcowdSfkDr85hJLlapNR6qWSOHxcqssjg
 0pi61NJsEAjLDriq72+wn9w2HB0gCsll+/Qn9DeiPXk1eKpUz73h6/VfZ w==;
X-CSE-ConnectionGUID: aM0QlfW6T1q/lQJiwqYq+Q==
X-CSE-MsgGUID: 4H/IXORyQhiJpEt4a5XHGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46460793"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="46460793"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 13:45:38 -0700
X-CSE-ConnectionGUID: ETXlj5QUSx+tgCqWCKqCDQ==
X-CSE-MsgGUID: FOulGklxTSyL3xNUTQ9RTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="136092356"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 13:45:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 13:45:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 13:45:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 13:45:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+x9oPrf/SsIc2EOkm1rGUZ4opoH/PMckemSmcTXsCd2ik2440x9Z0WwQMljl25Z/YXw94fj/cb8aLHadxCBdaIs8paR5iaCyIDVfxb3CHxHFqwZf8HKKZfKqfAdDsyDF8PkTMRdvRM8nXNR1zkPjO2S4du3d/MXE5IFKHJOufWp9mP7UqmATe5ESEmZe3eI/ITn3raDjEl44E515ts2pU5VvouiZfznv7XbUnEX4buJj32zsJHQuRTR4ozupth+kooKa/NamBJH3qUKOHWp6iuFP1kpSstuQ9AmNPjNOPg6Na7pZV+XE3OtpQ5OBxBSxcZR+AYc8EFuhoVmCPFx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeDiMWyKeP3i6AoTIxxFS1Ou49dd4X9C64HpjEydWXM=;
 b=tSY0vaBqKqoQ6NEUwPb6myjyROoziov5AQl4qCWusn1h76xIhn4Dgxs/sExRuZo96K72vZJ/EfPtfLm0xHE6jissHDhyks70uiEXdXXpjuQcKuy5/BYFJZbhiPF3AWBxGmHdNe8/Gjm5cg4jc9Ysw/+uEr/ktPXTVeaQLa56fWBOC91eFudLBVmo8TkBMGU22AYZcrpSTqYmn7OLsjrHDVyrduOHctdYfeEpKFGTVFJ9r42zL/52ao3MezMJRdL/lgN8OUrNphnwCCVnbjR4kisEx5ywo7jO28BBdPdg9I3JFyhvrS/PWn5X8+ZywBYVN0lSXMl8x5RQq0w0kIx56g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB7524.namprd11.prod.outlook.com (2603:10b6:510:281::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 20:45:35 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 20:45:35 +0000
Message-ID: <c6da8d02-a770-4730-a8d7-48562d1f40fd@intel.com>
Date: Thu, 17 Apr 2025 13:45:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/guc: Use the steering flag when printing
 registers
To: Matt Roper <matthew.d.roper@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
 <20250417195215.3002210-3-John.C.Harrison@Intel.com>
 <20250417201752.GD6239@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250417201752.GD6239@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:303:b4::16) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: 5087c545-2c94-44f0-aa2f-08dd7df0cda7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkZlRWt1MG5DU2ZQZUZLRHV3bVQ0YU1jTnhKOFFNZ1BhT21CK1lCcnQ4bUpt?=
 =?utf-8?B?KzFDeWVaWkg0VDBFbHRJQit5THNrdzA5L0xqNFdKVncxYW9aajV4bnU4QnFr?=
 =?utf-8?B?MFhEQVVGZzBRS0s3RTl2SFEwenBuSzRySURlVTZ2ZGFIWU9RVlg5TW9rMklI?=
 =?utf-8?B?VFhZVmJJb3FXeEpKdEJOSjN5N3AyakRiU3JodXhEdCtoeTI2dW1CVFJkT0lD?=
 =?utf-8?B?NDBBa0RkUFZCTVM1UFJJY3NDcEY4V3ZhSjJPZU0wc1R5U0hnZlJWejNwMGZP?=
 =?utf-8?B?YllndE5aMnpZZ3YwWnI5a00wUW82NTdOeG1qRzMrQys0OGF3QnJ4azJJbEpK?=
 =?utf-8?B?UnB2aldVVkJJU2pZQjhHLyszblovNlJJdWNBUFVYaXpUWGJNTGd0SlQrQ012?=
 =?utf-8?B?dTdwNCtKU1Vac0NEaFFCQk1BU0d3OWs0ZHVTSHRGK3BEYTBWUmJtZ1VnR01W?=
 =?utf-8?B?b2Q5MGx3UGEweDQzcHJENnZteGttMlZEL2twNXZCVGN3aU1Gczl3RkNtZ3VT?=
 =?utf-8?B?TXc1dUVlTXpaQnpsTWNMZThXcVcwMXBjNG1YVTlSQXNMS2VSYVNLU3EzbW9Q?=
 =?utf-8?B?UnptTXAvZzA2UWVWWTI1N3o3SC9ZekI2LzM4bzV1U1VtWDlYSU5oZmJDU1J2?=
 =?utf-8?B?YVVYZmhpS2lRczJGYVVBaVVMZzAzNk8yb0c0S29kMFVSa1BlMjMzNGhzMU14?=
 =?utf-8?B?MitoREUvS2RQYzB5Z0FuRVRYSGU0cEFnd3FZdS9HM2EzbTJIcCtlcmljc0dG?=
 =?utf-8?B?eTFFWnprUkpPbGFCaG1aMnFteHhza3dWaWlBSStnYUpGZjdKcHJNM1drOU9k?=
 =?utf-8?B?UjR2djBBdmh4b1Zqb2QwZ2RvSk5hSXJmeTU2MnJRTWxWdmYvRGpYeDh5VUQ5?=
 =?utf-8?B?T3Y4OEhFeVdmUW1IbFFRTGs4a21zM2tjRmVsSlJLYVdpZ0VHRThhaVQzTjRE?=
 =?utf-8?B?TjFFVkZLNmJJdzNQU0JzYndtQ0hia3dmdThvc0pwUHdVcGRCRXFnMlRYNys2?=
 =?utf-8?B?ay9KNHM0VjMrQXlnVFJVRE95cWNTbkpFN1VTZitSSWZRbWxXMFFtc1J3UkJn?=
 =?utf-8?B?OXFLbjB0RmdtS0ZvZ1c4TUp0R1NncU11aVZQRllWcFRsS3ArandZWEZsOGhX?=
 =?utf-8?B?RE1JQmtvTHRudlM4WktkcGJSRFl2ZlFTZjJRM1hlNFBJbFY5bU5DK2RCWGc2?=
 =?utf-8?B?eXM4NWNqRDJHZ0psbm8zdTlEdmloemVzNEErQzk1RDQyUkhBRk5WYXkrWkRr?=
 =?utf-8?B?djVTUjdyQURTb3hwSHNUa0UrbTlsK2llazdhdmRoY2ZZTmxxQXZiVHFYdmRi?=
 =?utf-8?B?UXArNi9XbW83N1NvMFIvNkVlellwVzNuMGl2MnlNZnRIdkFsR28zMElEeWtC?=
 =?utf-8?B?VHpRcEJpYk8zYTZxN2w1aTErQ0YrWkJsOFlqODBnVXFqajkxUXo3ZFZweW9K?=
 =?utf-8?B?NjdkRmV3SlFEcTJCNHVrYW5jQUFIWEtKV3N3Q1NUa05aZFJGZy94aW5aSjZ0?=
 =?utf-8?B?T1pETkdVc2ZUOWRBMzlqTmZudHgzTXpkbFFDNUZQMU0wVllXaEZrbU94NHRT?=
 =?utf-8?B?R1JsWmxBaklMSG8vbWh0UU1QZ3JGd0dUNThoMWlJZWt1bVBCV2doR3VzNzBT?=
 =?utf-8?B?WC9BaGN2dURoM25nM1Uwa0cwaFFhSTFpbi9IR0l3bzdlR0RCSnBQYUp0UDRa?=
 =?utf-8?B?bE01WnJ0ZXN3aG5XMitvM3RWVDJxekFLKzNpbzVFZTMwRStocGxRM2FqYTRz?=
 =?utf-8?B?dmV2MFdjSTk0aVd4V2tmUHdKUS9mOU55bktsdzEwYnZsaHJTUlVZWUpsWW1H?=
 =?utf-8?B?VGJNOVlUb0I1RVYwUTJHbmd2R2JvT3lSYitzRE5Ld1NBUHc1NDRXK21Eai9E?=
 =?utf-8?B?WnhGTThJZXRScDVIY2pkQVA5djJSOUV2MFJwejNsSzM4cE9RU3RHTGFkOTYz?=
 =?utf-8?Q?svzrb2Z8C74=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?allXYW5yYTZMNGZpVXZZUm1lb2dHalVVOFl5UmFTQm5RWUhHUzEyVWl0YWpX?=
 =?utf-8?B?SjUwelU5VHVYZ3poTGp1b3Jxc1gvd1dyOVpaNzI4SjBQKzJPK2tMcFhGZGU2?=
 =?utf-8?B?Q2g3U1BjTWtCNWJlMklSZDNQNmR6RkxHUXoyNW1jL1J0aUlDL0xuRmJ4blRT?=
 =?utf-8?B?OXFEV0lYMXhGRjh4RXRweXR6QzVtUXc2RXE3ZzA4REpVLzRYOTNOVGhtT25k?=
 =?utf-8?B?NWcwbzVhUUhYdmhoU0t6RitwR3Q2MFRVWitqRW9rVVFWQzl4cTQ2ZXZmVnA4?=
 =?utf-8?B?K0F3Ujc2M1BDNmFVRlBwRGZOMVVNYklmRFhWaThWemxqNzRVbVNia2c3OHFY?=
 =?utf-8?B?Ukd0ZklGdlRLUjBHOXExS3hCK09xRmxNY1NCalVrbE11SllUUmgwc0RDZnJK?=
 =?utf-8?B?czBhaGRIcG1RQ05PbkFJdTNHTENnSU9HclRwaWZkK2Fwc1hTd29IZCtQNFRj?=
 =?utf-8?B?OStHNnlJREQxcENKaVFrSVhFSUZndzAwUm1RUVlYYkE1amkvaERhNFJlVFdY?=
 =?utf-8?B?TG1XRUhwMW13emgxejU5Z2V0K2lEOXV0VjdnNk5FMDVmQ3dqOEc4N2lRTC91?=
 =?utf-8?B?NWs3R2IxN3dQVVZWQUIwMk5FeWVWb29EUS9SWlU3WXBWOGhXMC80RmlMcmly?=
 =?utf-8?B?T2JJMkx6Z2pxZUhmL0RTK3F2OVM3QmFsR0pUZXJISWJLc09sZVh4cFpWMURo?=
 =?utf-8?B?TzRTWE5UblpRdmJjUFQ2ZGpWL1pXcjdIcld2VUhpdjRPVU9SbXNtbFp4TDM2?=
 =?utf-8?B?V1dLd0hUR1dlK3Vzc1N2MU5uVGt5bUJrSlJiUDJ1N2ErK3oycGVEZXNMRlFw?=
 =?utf-8?B?SVNhQ0RNMDVwQ3hWRTcrZGQ4Qk1FZ2Z3R1JWTkhFYlV2U21oeVRzTFF6T24x?=
 =?utf-8?B?blFwT3hqZDY0ejVTdEFWVkNCdjFQWUJMMm1vWXpjTFo5dEtsbDlNenhKZ01G?=
 =?utf-8?B?T01ncTF3QklrVThwZ0xxNm94dEhCd3JkTGhaVE5FWk1nbHZlT0lxdElidzhB?=
 =?utf-8?B?cU9Wa1NyVUpJMnhTOVdtZUp2c3ZaakMzaVo3bnpCNXp5UWpkZEQ1TksvbDRO?=
 =?utf-8?B?aVNjNlh3UlRoQU9EWi94TzZMalN5aDdLWTZIWkZ3Z1hYMlhkaE9lRDRpcHRP?=
 =?utf-8?B?bncwWkNVSHQ1enRpeUZBdkptR2xSVXMvczRKVkxVbGEzaktRWmJJNkZreGhN?=
 =?utf-8?B?RWFCVkthTFR4YSsrTmZZbmhENzBPR01rZWlSU01taG9uK1QyeXlsQlZkWGZl?=
 =?utf-8?B?ZEU3SWE4QVNvSHhYWTdVeEppNUczSEF2REtoaG5QNkU0UTNqNWw3TWlPUktK?=
 =?utf-8?B?Z0w4eGNVWWQ1cHdDY2t1TENQNkk5UFdUMFdtNjNQcXFPY2E2Zk1LVmhSdlRt?=
 =?utf-8?B?ZS8vVFFUVitId1lJNWcrcE5iT25UTzgzT2J5eVhsSGZiK25yV3lVL1NtOEFN?=
 =?utf-8?B?NDU4M1V5cVI3UVBVeExVTDZpZzZrc2M2eUZhZ0pNNXUwZCtTbkNJT2l5dWNO?=
 =?utf-8?B?b3daZ1NZdlhrMFU3WDRKRCtkZ3RMVlBkazBVQ216Zmx0bWNCb043TE03S2Fq?=
 =?utf-8?B?STAydWlrWVJtb0Fya2g1Zy9KZkd4cHlOOTRpRFRzelJKeTNGUmd0dGViVUh0?=
 =?utf-8?B?K2lJVWpGNThOUGd2c0YzcGthdWFtRkZrVElxZFMzb0JuY2JWZmlhWnNobHpO?=
 =?utf-8?B?d05GR3RZZDZDYVVzU3hKcEVyRDJTa0hLSXJCZ3Ewa3A0Q1hVUHBUS2U2Z2E5?=
 =?utf-8?B?Yy8xZjVJTkNMQ0IrUmI2UkR6cm14Yks3alpJaSsxQlliMUJwazV0UWU3ejZ1?=
 =?utf-8?B?RmJ0VjE3NW9HQWFWelV2UkNrL1RlRFlWZWVIVGNMMDFZekdLOVZKMFZ3M1JS?=
 =?utf-8?B?anhKQ1hoNEQ5bFlRNWhheVNlTk9CelRCQXRJTFBoU1V0ejlMSmtiV1JYS2I3?=
 =?utf-8?B?Wnd0MFFmM0diUEcwM2F5N2d1NGtaOGdkQXF1cmRhNGFZS0JBQVlGN2FlZS95?=
 =?utf-8?B?Qm9lcXFkcEIreGg1Tjd1UEdtWlFYY0E1TWhna3ZCMnJubmRpL25ULzQxME9j?=
 =?utf-8?B?RFdVOEdsNWllaEV1U2ZhSkR6RmpjSTQ5UUlGZmRIRXhkcElqNUdNUDRqYnE3?=
 =?utf-8?B?bEZFMUxTeGJOQ2xNcnE4MmNONjc3U254akhBTWdrbWdMMkRmVXhZblEzZHVi?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5087c545-2c94-44f0-aa2f-08dd7df0cda7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 20:45:35.4701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4vYogkyKz/fgTzVaeJwKjyNbVzOd4zPVZGJl+LpIpnhlitLdVn6F++ra0SiXURagoEWLsoDHkTRfrOPmZXr7qQ5fZyKieWiT7k3vJmuqUqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7524
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

On 4/17/2025 1:17 PM, Matt Roper wrote:
> On Thu, Apr 17, 2025 at 12:52:13PM -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The printing code was doing a test on which list a register was in to
>> decide whether it is steered or not. That might be valid at this
>> moment but there may be other reasons for extended lists in the
>> future. Plus, there is a flag specifically for identifying steered
>> registers. So, just use that instead - it is simpler and safer.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_capture.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index 9095618648bc..f4b08136e472 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -1672,18 +1672,16 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>>   {
>>   	struct xe_gt *gt = snapshot->hwe->gt;
>>   	struct xe_device *xe = gt_to_xe(gt);
>> -	struct xe_guc *guc = &gt->uc.guc;
>>   	struct xe_devcoredump *devcoredump = &xe->devcoredump;
>>   	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
>>   	struct gcap_reg_list_info *reginfo = NULL;
>>   	u32 i, last_value = 0;
>> -	bool is_ext, low32_ready = false;
>> +	bool low32_ready = false;
>>   
>>   	if (!list || !list->list || list->num_regs == 0)
>>   		return;
>>   	XE_WARN_ON(!devcore_snapshot->matched_node);
>>   
>> -	is_ext = list == guc->capture->extlists;
>>   	reginfo = &devcore_snapshot->matched_node->reginfo[type];
>>   
>>   	/*
>> @@ -1749,7 +1747,7 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>>   			 */
>>   			XE_WARN_ON(low32_ready);
>>   
>> -			if (is_ext) {
>> +			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags)) {
> This is a single-bit flag, so can't we just do a simple '&' rather than
> using FIELD_GET?
I was just being consistent with the other usages. Could convert them 
all to bit ops instead, but having a mix seems wrong.

John.

>
>
> Matt
>
>>   				int dss, group, instance;
>>   
>>   				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
>> -- 
>> 2.49.0
>>
>>

