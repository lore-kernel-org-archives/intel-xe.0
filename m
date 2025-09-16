Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE61CAC598
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 15:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4079910E80E;
	Tue, 16 Sep 2025 15:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkmuYh3Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B4710E80B
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 15:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758035043; x=1789571043;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pg8s23AR44Cruu06uAteuT5dHryGepxKgFpwIDM9RfY=;
 b=OkmuYh3Qz11mlqYkfSKa8rl+OQYuRT7Yob1mlwp4Y5soc2LsT/E+Lr2s
 dxxY+TE2SWDnZPHEBQGnaX5R0VfciinOEF35c+2IbNluASv0LiDEjdF88
 vJFUBVt5hfhZTySUbh52e6Bwz1tIyGq9piUpUiEPJYJBIG463KD3vDRju
 Wt9mo9pX8wDnGYmXnYBZer1odehxvJ+jfvTTYvVHqRdR69Da45QSW8+8C
 39lag852SpP5FMdvls6K2Vqb2DWEwVWsZ4B5lu4lG53F0n5TWlwy8CXcW
 d5YTkFjgWEOxWMIZIpcq+TUyio2nRQ/zlgdsb2hvpDwJBIc95QxNDNo05 w==;
X-CSE-ConnectionGUID: DveN2to1T72rOHM1C84SJA==
X-CSE-MsgGUID: c4fQjJn0SNqzzLzc4UXoCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71685075"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="71685075"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 08:04:02 -0700
X-CSE-ConnectionGUID: rxS1G1M+SeOAS8y5bxeE+A==
X-CSE-MsgGUID: /fxNLmKNSI++DG/WPCAccg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="205920173"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 08:04:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 08:04:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 08:04:01 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 08:04:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8oQgE8n+P8sLldCY05MCRAdSKRAzl9XZa2XIu48YJOUw1Paf6Q9j9vp8viC1YGrtnEKHC1MDDB1WLzadRd6KtcBfh3cfYlRILxJAGS6oJ5h7pbe7fZ2+6Mk7jkAOFCIa9dY4DTWBstmlXUAu4u081NdvSXSLroggwBbzSJrLnE6DWXVqhVH3K5Dq63u5A/pva6QAgX3rSHHhjziPwHsCyIO/8r5vbUfj41yuz84/LhaAYBJgAxohFOnGZJvAI62eLTpsRq1dHi4CkgjUfBXaTDffLJ8INJQ3BwMqQGbRcxcWZ4+ADcW7W32jNjIPhWOWWSRs8vUTi6z9DOqdalr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JowC1qaHUg89uLPgw+VGuUlat60c2Jl49TYyhSNf0II=;
 b=HmHewlnYaigKPEuJ2Y6frAAC8W4DBBlVB5SUR0ANXFCJ3p1X3NtHtfNCTTQkjx4AhLAevon/SVNOPuz54AquUMuFaWCHe4DCgbHdUmfNZrN9NS2IByx7f+alTT2Rmy73SqCRe1ZviAaHXe0Cz7D7iYnFV4FnVuEzPBT41PlrbL7N0a2jyxCrzdCWOR3M3g/tMxuy8fvByx1pzoKlMrkPSIEoksby0rfSFSgnk5hym3W6RhhpEOpHJ1qq4CRBqzT4BgofF4FI8MqtieWH5gr49E1wKfyw/o6IprrvOmOvQ9G8bc4xa7hA4NelJgjGr+yiQkoyU+WRHt38qYVqiCai3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 15:03:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 15:03:58 +0000
Date: Tue, 16 Sep 2025 10:03:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Zongyao Bai <zongyao.bai@intel.com>, <intel-xe@lists.freedesktop.org>,
 Stuart Summers <stuart.summers@intel.com>, Shuicheng Lin
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/xe_device_sysfs: Remove sysfs
 unconditionally while clean sysfs entries
Message-ID: <kwmeinuqz7me3cfnhseakg7jayfopqkbnskvzfjhx73oyvockk@52nv5ogmv2d5>
References: <20250910183233.3971054-1-zongyao.bai@intel.com>
 <20250915214716.1327379-1-zongyao.bai@intel.com>
 <20250915214716.1327379-3-zongyao.bai@intel.com>
 <7cdce3a1-7b03-439d-980c-a47bc542452c@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <7cdce3a1-7b03-439d-980c-a47bc542452c@intel.com>
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: c6bbd441-5568-4d2e-842e-08ddf5324357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NHxSQqbSXElNVIa80hC13gb9wpu1rivJowd3UpCNT+gwhJwjL2khzpagPXrV?=
 =?us-ascii?Q?JLqMFCwW3EfYKnwEAD1+wy3PZWMOXZQNZIp/676juRmpBJ8o7aBlrs7ooCSE?=
 =?us-ascii?Q?OnnRNJBblfaRrzRPxO80uBak6Jn8i9hLMEkT5B2cu6dxdwSeOSP709Eo0eR6?=
 =?us-ascii?Q?ttYXaFK3qHK0aBmnh/TBnXiri//soKummxu+BO7blRZZFTobwhEFZiS2ZBX+?=
 =?us-ascii?Q?0qWSmNLf02rC182ACQOQRQCLtiXtfCf7P/1yyDBPk0PECtjG3sDvj+i/r31j?=
 =?us-ascii?Q?TJWUS5ZhzpzLJwbUkzLX0+eJJnLL+V6NoYcEYGJP06wGvawCSc8Hw+1E9Xcw?=
 =?us-ascii?Q?a6a5VyD31R3TNbG4VF3XSVYupKtJQjA26/3VuPzReojkuv7dGeqh7Wo20J8q?=
 =?us-ascii?Q?hG14ueH2yIXPr+snXOTeSbCZ4AsBdl+aUYM0C2fGfbIuM0NBPcFHyw1nDpvc?=
 =?us-ascii?Q?rlihcqJR7RLqbZyBM6N307pF6Z1koy4Lc0cZu0XUALKyr+c3jdNQrongyT2Y?=
 =?us-ascii?Q?u5IHsmYWZZzE02sO0K6uUxBt+eTRmqD2IIdlklichVtm30y3rwZIBqYX3/+y?=
 =?us-ascii?Q?lUSoE3Ht5IrXWBk4emWAQHm1KdhehVhQ080rqoZlg2Ligev0KInNb2dD2kfx?=
 =?us-ascii?Q?bxw5UGwVK+g9l2QE/v/zutxCuN9uSF+Ry74pPA9wrGe59+nfaYkjgA8PWYOb?=
 =?us-ascii?Q?QkBOkfC6CWPJWihHwjTmLtvbRJJk7CPxKbMhbrUrXrXWBmbiCJMhmLaFtdDq?=
 =?us-ascii?Q?0EtcarScofbcJkEjsDjODoKDiVZr9vz1cgpQRF75CymupFsJCNHPTNI5HFEz?=
 =?us-ascii?Q?28kNYqoYSecQR26LmF4r2abVXF3bdK0ceqofjAAyTdWdjIgsPEnQZyGa/nbb?=
 =?us-ascii?Q?XjtPNFceJu5QR7KH0tDPnAGw8CBZFOd8m+bZhlm25GMULXJwDaGzlpW3YEmi?=
 =?us-ascii?Q?00fLdzUOkiltwHNI9xTlVjT4RH/Kob/Fel2tK/HNpUoZ0vV4J/UleRMKqlGJ?=
 =?us-ascii?Q?9TEtTgP0k2GjwVTB7SMqPgTl3aZFSuBYdl7+Jcjq9JMKH4Ozryft4/cyUf8n?=
 =?us-ascii?Q?a2pxd5JjAmfb5C1R5FZEdbb53iaPWJD8/7chJmLDFyVpZRB4tdqLVbmnoGmn?=
 =?us-ascii?Q?7+s12LOEtx62bHbZDHvEESzLjDPxZaPwrUCzjb4QpIltt4cmNbTHrspgfdhL?=
 =?us-ascii?Q?LBKDz5sB0R1Wf9RrVOSA8n/E/sykbcdFrrXrg/0+NbJ9+qMvZuUnw57pi9kh?=
 =?us-ascii?Q?9astrFA+nx8boYULFaWSuyVXOlbPrJWoRMuCghoE9eeOy131cenUPzP1me9r?=
 =?us-ascii?Q?Ee4yQB8mwXo6FE34UCs3Y+QSWatYDpno8uTRN4u3pWYjroWvc4bhsaBMXQZX?=
 =?us-ascii?Q?a3C2ugyCXtD9rUPrBd155iFzBtY4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5OD/fA12vpL/3ZCIc+3ZWo6PHSBEN96AnhXbNm8s4zy+Z67STJ/yvK4kMMe0?=
 =?us-ascii?Q?7ZVURSJGje/Zbfo85Y1uUPmz4X7bqA5FEfUjmKiBbchH7uoPzEotHLzkfRZe?=
 =?us-ascii?Q?1v2wWKmtgLkVnu1Z0eKPNGmxrUOPxTRF79+Lq1z8hvDxkxZIibo9DeLBk1sx?=
 =?us-ascii?Q?dT9E9B2IVU2UwFr6VehjFjHoBz/F/X1Z/27jP7rb7ZpeSWEdShMFqVnEmRnx?=
 =?us-ascii?Q?s/2tHdGyzmj7pxjJPPsd08vbjR+rmuIixxv5WA0tdQvVo80GGVKhC7Tt4lnr?=
 =?us-ascii?Q?i3vMgCEPpETWAjLdwlUC6DohP2kSU67jRTk62Hjxf8Yv2SKa8RWdhkiriyGf?=
 =?us-ascii?Q?1rh7Lvx/ps75ptOUjGBXM9VhMFtR2cfWhrHdG3oc54pkK4KWfQHRFd+XDuH5?=
 =?us-ascii?Q?38DpN0xSgHNkMDdOHFPJ+7kLzTBvAJT8r4AxuPYINz4UVWpCFTBRq+XqlBI1?=
 =?us-ascii?Q?WsF+Z7/B7pNJvwRB+D78CGM5v2j/zTxeKDgfLG2HJIVrL492hjqkNh+XvnKw?=
 =?us-ascii?Q?OgHEGAX2d5q1CZX/FhV/oVqlBzTFPgG48v1tOS/uWs+WyTP6knnm0UobkuLI?=
 =?us-ascii?Q?Ol7b91JhjzMJ8z4OFFaQ/ip83OGzDBNpBOOyR1BwGg2i4NDyrYsAY5E7836p?=
 =?us-ascii?Q?MY0EEagVrHZCepX5LIyzcZcqCbNIS5iQtRBFwb96JezhPAMG145mIRG3OXq9?=
 =?us-ascii?Q?NO6KdPH9bbYML4ZV0JEwTYalL+LGqnRtMNNZQQLkWHuLNenRrhQromyMzuWu?=
 =?us-ascii?Q?Te9ep5ajDSh7dW3ZJSIPAtuF0vLdx8S6ElntF/ItaI/sEKRegzr2HhGaUU3J?=
 =?us-ascii?Q?YPxI2GEAO4j/4ai9F/edhNOkYK9XkLexVeTnjCp2eKFbPQft9LYBuBXTnoTv?=
 =?us-ascii?Q?YdcLCKx3PYr+wqmW9DLsvueZUB2+f/CCovogCHu23tuOBjcLNChS1XlH1MfZ?=
 =?us-ascii?Q?gcZ+IGlX6SnVJCngnfFnXeobbieGLntguHPP9mKvzSlPW4e40GtSCS6/nE1t?=
 =?us-ascii?Q?n4g6EGX3g8kYamPVwPBmsDzriCt5Jzm1WIiw0rx16UOJ8EEQt80SYfiR7G/p?=
 =?us-ascii?Q?aXN8FNQpHvA569bWJdquXq9huoxRb/+rRoci03zGDF+0jvs8nEKjvvvwpftT?=
 =?us-ascii?Q?iTlMdUUd/IKs+YGpFG4ASjrrXMqBkFJ2SYFUPl706D6OpxXvHF56Zx1556xO?=
 =?us-ascii?Q?s9HU2Z17Q6C2VAmu34glm2Y9PoowycuW+wQh4RlZP/FHo5J9ODyaHblc1Xx6?=
 =?us-ascii?Q?bla8ckDdjKl+MRq5Jrm1q/pz/P1kgLRZDIsdg8rCaD1k5iBgU9wwilI+SLOE?=
 =?us-ascii?Q?5I4sDdAmRSYXMbAt5DgYQiMQUoJAbCyPG+m0SA1C5Zq9LHJMgngKi+iOEAJB?=
 =?us-ascii?Q?PlGIgFbYNHjRq2DQzvLFYHY5qIQu0EEbWmqK0/uPrXM8q7JJOlCXQcoB6rer?=
 =?us-ascii?Q?kNEk5gWsluvmsRVKgVkjjYUkLEARgRhat9lwOmyqNdeUdIDD0wwTwUklzv8f?=
 =?us-ascii?Q?cWjU5KKmGKBq54k680kEbGVSjSf4IujirxOOOX4REDWkdLZQnn4GlnaHLE87?=
 =?us-ascii?Q?VsM/MMwdSFBCQLzyhVmhkdV7BovIPkDCTpgY/N3kWq3YPvjRTFXAT7X3w/OT?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6bbd441-5568-4d2e-842e-08ddf5324357
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 15:03:58.5284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQdTtLq0Td3ZCWTI0yJadnsCOQnuAwTZvBZN0swp3jlsDO8P95fvLxBcX1MVn7vr4Uf6n6yRX+2YPugdzuoz2S1fn+XZhs1C0BNmfKKxDuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8508
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

On Tue, Sep 16, 2025 at 04:39:06PM +0200, Michal Wajdeczko wrote:
>
>please use correct subject prefix
>
>On 9/15/2025 11:47 PM, Zongyao Bai wrote:
>> xe_device_sysfs_fini() and late_bind_remove_files():
>
>above line could be dropped,
>below lines don't need to be indented
>>   Adjust the remove order of sysfs entries to follow LIFO.
>>   Remove configuration and status checking,
>>   call the sysfs removal unconditionally.
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>

FWIW, with the first patch applied and bug fixed, we can
leave the improvement to be done by the other series by Michal
(https://lore.kernel.org/intel-xe/20250915140614.2076-1-michal.wajdeczko@intel.com/T/#me67e87de8efb34a980cd65be3d79c93bc5422230)
IMO the end result is nicer there. So I don't think this second patch
will be needed, let's just drop it.

Zongyao, thanks for following up with the feedback and Michal's feedback
here is also good for next patches.

Lucas De Marchi
