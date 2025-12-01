Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCF4D116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 23:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8FA10E4D8;
	Mon,  1 Dec 2025 23:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMs6fMEY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30B910E4D8
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 23:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764632002; x=1796168002;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KpAf/nuk8NNT3BUkVxFSmVTqezc7TDSTlAGNUoiBKH4=;
 b=nMs6fMEYYXYGxWK5t0IVLCG8CqRstiAqu1stiQa2IAlA4WyZS3aAnyUv
 EEZKJQoJsek+EQqfE7/MrOcU6THpPH5TXQEsayrpUQt44yswoR3cLs/2e
 tblwzr/rl5rLCkxs3WTI6Vl69zd4m/7GarFMqn/BFdEZ2wXR3AM9h0N8C
 f1PfXX7yf0ny3rA0HlH7/6ajgkIO6VvZr5sgZBMlgNC/iZiuezOQeYG0b
 cBi08AxDOMFV22SZb+Mm8JzkniH6LXe2/6XGJ/N7GDKNrYo7tvO2IUW7y
 jy163q6JdxMim/U1I7AicDpKBQE+6suNrOXSareUVNkZAXala2zwKiJSX A==;
X-CSE-ConnectionGUID: yDSSwkBjThaxyyf4TfXkZw==
X-CSE-MsgGUID: pX1XjV7+TPeW8P+UpTUHug==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77934959"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="77934959"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 15:33:21 -0800
X-CSE-ConnectionGUID: grJ6JKmtT2a45UKSHFmf0A==
X-CSE-MsgGUID: zSu2GeSWSGCZd/m2Te912Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="198407609"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 15:33:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 15:33:06 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 15:33:06 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 15:33:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FO/iJ3SeYQ4eKz/TkZGk8e80TiW6hCJRcGJ/jlRYCLa4LEAPrB/olLRFWXiv3nPf3exdmCHIfO+a3qlu8qWp8GK+Zer45ynq5LhlK67ls+KkkOLU68EUEow1NxRwqvzqGKQxQcnUSYXwDuDNVYRKTERdnmWbpFH87GJ0X4ItjZn/9clX3FH7ckIGZ+x1lkIjpl3ION5JwPkZDk0BnqdP4MPFN4Do3aCD6mujOZ9U3cCSYeCqspVx8g4Xv29WnGmoCeq4zGjCnMmvStm4x4EjrykSNWY1tp/V76FL3++iN5KnRdpNo28M4sl8dEFWh6fYRbmSpLp1xl0XY/dAZxd1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBxIRDhmp1MdeO2h09FFdT/XwgY3nrRlpxp7ZBKkpCQ=;
 b=O2smtJl79PFEo+2IEQw7uQ+XzCzErABYd48ZzvpiUIgP9kTX9l9n8hjkJknqvlTGZ1wiCmPpJq7Q03DNq5almQkNevFDzIvVeygsix2bEt0YHZoUl566uIZhNs5HWTF1JTGT5A3OH4lQreE2VZd5wp0G5gVljVniicTxFNCySOM07vyAxW67oRcHb3RTetLH15Dc+B3F5AMWqXmD4OWhiMqgwzatFAidZXdUwfRusXbPzA5fXCtrE3Mjjqqbq9ITsstz64tLqRo4lh1DoC/oTAGQZOxVLOVVeH4RR2i2RpXqeEIX+bvQYmN0ToCfMi0qFnQRFq/mYI/kckJGpQ6x7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by LV3PR11MB8484.namprd11.prod.outlook.com (2603:10b6:408:1b4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:33:03 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 23:33:03 +0000
Message-ID: <fca9ea53-f64c-43de-8348-a3ba350689c0@intel.com>
Date: Mon, 1 Dec 2025 15:33:01 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drm/xe/sriov: Initialize scheduler groups
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-14-daniele.ceraolospurio@intel.com>
 <0254302e-35cf-4721-84d8-d0c95c2e6d62@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <0254302e-35cf-4721-84d8-d0c95c2e6d62@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::37) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|LV3PR11MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 167decf4-0346-4f72-aadd-08de3131f8b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1U0akZKVnNlM2dWSEUxUGc5cjJ6WmpLZDhYNU9MdUZUSURHUnNPZUp4czNC?=
 =?utf-8?B?REhPUWFuUTZEMytQZlE1c0t4TjVzM3ExRjZ1V0E5TDNWbGRmWmVwOWFaeEpx?=
 =?utf-8?B?QmkwbW9FSDU1Wk5VRU1meEJVaXFEWE0xNWwybm56SGpkQXNhdnUrMitpUkht?=
 =?utf-8?B?OE8yKzdIQ3U1bmtOYmh1QTM0U3dpeUs1TFRJcS9LdlVNWlU0L2xnMWdSeTZF?=
 =?utf-8?B?V2IvL0d1QlZONDNCNTRDS3AyNGkySnRlSjdoS2x1YVdMbEFzSmMxVWxFTGd3?=
 =?utf-8?B?c3pLci9LM2FrVi8rQUMyVjhVdG5PRFZJTWYxRUxpdzQzd2x1UjZwa2dPK000?=
 =?utf-8?B?VFlSVU0zYkd0MmlESStGcmU3eVpPR0ZhSXdWRlVZd2FVVEt1UXJWNjQ2c0R5?=
 =?utf-8?B?c3lhcWsyMmpKZU90WC9mODNlQVZwdU5aRnFOU0EyY3JJMU9laUxKZU5VNXJE?=
 =?utf-8?B?UnhrL3krenE2NWd4My9vL3pueVU0VjFuTmJoWGRJcjYrQnF3MnZvSkVUck1W?=
 =?utf-8?B?SFhBN2ExNUg0ZWNaeXIwNjFtWUw5ZWZSaEE1SlNaSHRGZEx2M1RVa2hmMjQw?=
 =?utf-8?B?ek8vNGtsS1YrSDJDOGdzTzBiREpmNzJDM092U3czNjhjTTJZdUppSlMxc0hP?=
 =?utf-8?B?WHQ1YXR6UTlVdTJTVmswaTBNL2pjb2Zlam85cW1JM0k2NTZkU1JTV0tIaGZJ?=
 =?utf-8?B?aDlHMDRKZk40UGE1NlB2cmxQR0ZrMUVSSnBmYXpRYURnMldaNjVvRWRBNHg0?=
 =?utf-8?B?SUk0LzVJSHA2UklacmRFbnd4dEx2cUhNL1BZblJnSFJ2RDRZTGxjbWxpU1Z0?=
 =?utf-8?B?MlBmeWtMKytOS0haYzJXQzFUeE5mMWlzNkJCZEt2eHlxdGMyS1BQQVJQSUJE?=
 =?utf-8?B?YVdrbEZlUndSRzV0MkxNMjJLYXBTK1dxeG91L3Y4OTNrZDhMUkpkRzBwNWZu?=
 =?utf-8?B?QkxpemYyM29CTVk3NXVrYzNkbUFlemsySjVYdVJBRk85cjJ5eGwrL1dpbFls?=
 =?utf-8?B?ZUtzQlhCbHgzMU8zRmhla2ZYdU4xVms1TlZjWVlWd2NhVmR1VktXdXl4MmZh?=
 =?utf-8?B?NjFrTzFyL1B2R3pxUkdpUjNPMnlId2dZTW9rcTUxdWVnS09sUEQyWEFZejJT?=
 =?utf-8?B?ZHZ6MHgrM0YzR2Vwb1BnL3BZSVEvT0NpeW5SeUxqeTZTMGQrenBEK2ljUEI1?=
 =?utf-8?B?cTNNTk5DN0lsOUxObUQwenJFejUyUHpPdzc3a2ZvaWNIc1lTYjgrbDYrUkhU?=
 =?utf-8?B?U0pzZGpmeEIwR3hTdSt4OVFxcWY5dHppZUZSUU1IdEJvZkZJMTVBWG1RclYz?=
 =?utf-8?B?OEhkbUpuNlIxeWJrYXp1VHg5bGlkYlFNY3RFMG5iVWNEbXhQMHZMUHBXNC9r?=
 =?utf-8?B?TGNuOFFQQitqbUZ2R3NESStTeGc4dGpPaFV0QXNxeEMzV2g5MWxkTzVQMXVz?=
 =?utf-8?B?U1E0RmZRUllQMXJxU1NKOHU4SFdYc0FKdkdpUXljTXFNVE1udGEwR3pYa2Mv?=
 =?utf-8?B?QjJsMktud1NsRE80dS8yV0lqMU5jYy9kdnVYcCs4UjI5OHBkZDRQNnVzSHJO?=
 =?utf-8?B?Y0JWZ0lkdmtheGdyVm9Zd3pKaDNWSnZOTGs3cWJheWNlWlNtcGZRcE9DUGk4?=
 =?utf-8?B?NEwwWEk4V0F4REF0QzFSSW9kZmhTdXRDVzFKbzM3WUZ5dFJSdDBoR2UvSmtY?=
 =?utf-8?B?alN0N0hGeHRnY25sMmpBa00xOU9XS3NFSnNLcWZ1VXNETDBERmFVaVlkRnly?=
 =?utf-8?B?dnFkbTJGaGd6Mm1Db3ZkcGY3dTNNeFZXWi9vcDhxaEFRTUhwMFhTQXR1TkRa?=
 =?utf-8?B?N2QyaFZ5NlhRUmpVVG1OTnJnNWpzMmN4VzdwS3hCK2k4SXVLVzBWcmVleWdz?=
 =?utf-8?B?bFk4WDVRcWo0OHZ0ejE3enM0Umd4ZFZRSUJuVnY3UEsyakxmMlNSMVhkT05L?=
 =?utf-8?Q?K34DsLj12PsBnB/fZKBakfPjZoW8Qpx0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2lxSHF4T2Nrc3lSdlc5UlluWVR5bnVPclFHU0wzUU52REVpWFVHL01kY2Jx?=
 =?utf-8?B?Sm9HYS9oV0x4VkdGN2NQcnpSVXZvMDJZbXZGR1ZPUlF2KzR3SHluYUhZYm1t?=
 =?utf-8?B?QW1za1BGaGpIc254dUVNOSt0K1VuZ1U5dHJvV3N6WU9BTnBTVWY3em5yVHQy?=
 =?utf-8?B?T0tKVUNObEtVU1gyT1BRbUJWUDFhRkxmOWw0cUpnMTEyZUgxbDdMQmM2K3pL?=
 =?utf-8?B?dHhiQWVJQWM1N2VhNWNXRnRVaTVibVMzVDkrcVA1U3N0eWtNMTZkalhXdG55?=
 =?utf-8?B?YVMxUzJtWTZpN0phZFBZTVdIV2x5WnVGSXVveGh2dmsyV25ZaHQrWGlCZkhp?=
 =?utf-8?B?ZFpNUHhlYktrS2svVGRuVTRjSytDeDRTNGZiQStTb3lpSFpGWXZ3SHFPY3hr?=
 =?utf-8?B?MVFwQ0hmQWcvQlh2ajNkQ1dxeDVoT0JTYXlXWFB1RFArYzNyZ21nRmdxWXBw?=
 =?utf-8?B?YWJLQUhQUUxCL2ZwSTYvOFBzME5PamJVd3ovbm82Z3gxdkxOdmVHSG43NHhW?=
 =?utf-8?B?RVlRb0Q5VThNdXN2ZTFkdDVkd3NWZWRBcEg3cTBISnoybkNsWHlpYTVQa0hW?=
 =?utf-8?B?WXB2MGxqYTI2aEg2YWdPdGI4aWdodUZvUmZ1NDg1dW5RODRCZ0ozSXlXSTRV?=
 =?utf-8?B?U2ZOTjZqV053RHhKdXVYUVI3THRsNlFmOTlWelkvME9CMm1zUkNNSlgzQ2VC?=
 =?utf-8?B?WDRKS0xjTkdFb0xVbjltMjdsSWNpVDlvS3c2bWJxb0V5eWJiOGdwLzZ3dENp?=
 =?utf-8?B?ZGdya3M4MGlxSEwrVEFKNXFkNXJPMHpVS3B2eHZWTWRVNTFyb2hPd0RsTU1j?=
 =?utf-8?B?Y21CY01hd1pxTk1sNGNLY2FhMFZwWXhUMHo0Zm9YZjZGNWZvOS9vQjBmWm9Y?=
 =?utf-8?B?SzU2U054M0FPWFV6bGRLSjMvcFBQTUtFTTJoV01FY2ZaM3FoYmp4WVRrRTVr?=
 =?utf-8?B?T2tManp2amNSV2xkbDRJMlJwSDZoRTRHdkxBYkRCYWlTU3hJWWtreFNZYnlU?=
 =?utf-8?B?b0dCTXFLZHhMZjFhVlc3YWwrUms4T3hQVTllVFZ4cGNUOHFkTXVrSng3TEV5?=
 =?utf-8?B?Tm9wMkVjODdTUkhhMEFWcHdSaDd2VEsxRVBKOXdtczJnSWtxVGFNanRKNURI?=
 =?utf-8?B?WDBDbjJCQVRmR0U5aDU3UTRLSGZjdURTR2IreTlSdE9HS05JTU1HYzZPQVBS?=
 =?utf-8?B?dUVVRC9ZWUhHMEZ2MGFGNVE5TDM1dWxvUDdpVWxuTWdoRkMzK0FSZGFHZjhU?=
 =?utf-8?B?aTQ3WmMwdTBoRmRqSFV0bS9oV0tDQVVlZE9lM0NMRS8zb0ZXakVNS3hZd24w?=
 =?utf-8?B?VU4vRC82SUxTdmpkMi96VE55ZWd5RU1kdzd6bzA0YTgrUGtJcGVrL2NvcFpD?=
 =?utf-8?B?aWw2NDRqUlVqdXJiVUpKTDlNSWYxV1FreEU3SUNNY081UmJwL3VrT0lUb0F4?=
 =?utf-8?B?WGNhRXNhMktQTEpKTVo5azdpdklLaUlvR09KVFVPV2lUQmFZU2U3Vi8vZVJX?=
 =?utf-8?B?SW5yZHdGTVcxKys3aitqUWFabWVxaTdLckwwRk5pR2Jjc3ZzbFJiREdoYk96?=
 =?utf-8?B?ZjZNYkVxRDNaNWhLTFJyam1HUUtZWmd5Q1RXRy9MUUhyQXBibVdNbURPMUE1?=
 =?utf-8?B?OVQvb1hudXprbVBnT0NSeW1tZWRIUGFFMkZHYlMvRDROV2FBanJFK054WnRm?=
 =?utf-8?B?K2Jrdmc2MnBvcTlaUmxmZEd0dlFQM2tIekFWTlZ5dzhHS1VQa3lnNHdOSTlm?=
 =?utf-8?B?Mzk0Y0RPd0hzVjZIY3BvNmVpdzNUdnluMTFPMkh5NVNTZE9FeGtDZnpjVDNG?=
 =?utf-8?B?c1JCMnJneUJmVkg3N2hKYUJITkFMamduUGNMb2Q3OW8vRGo0SVc4eVRiOUFn?=
 =?utf-8?B?aE5tVGQ5bGNDQ21tMFkzYkgraUlIbk1tM2gxWHRGSVRHTGRWV3BJWDZWTjVk?=
 =?utf-8?B?VlpSVGxML0tWcWN1b3hPL3FpRHpMTUxUYkVpei9vQ0lzVTRXd3lYQ1Budmc3?=
 =?utf-8?B?OEVDVXgrOFhLNDliZHVuU21KaW56S0hWcThlK053KzlRdjBBVXBVdjJpck5E?=
 =?utf-8?B?QzE1VC91cWhXZmdBbFNtUDJoZXZZZno2UzdDZmZOVlkxdm14V0Y3b3hYOTEy?=
 =?utf-8?B?dWIwWm9UMTdzcDd4blNMQmVlbFE2VkpuRkZNd3lLWjhJbDFuRjVhdmtVM2lU?=
 =?utf-8?Q?0Yq4N3A67HMjOcMMoSLVj+o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 167decf4-0346-4f72-aadd-08de3131f8b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:33:03.0391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3h3yKkkT+E1jCvvd8tK8DNtWvULM1pPPibO7FEpi7v9Y6aOeYLolbF5qWPbfsmdgtmHgDcSU6I4iRjqjgBaMncQ3gHIKY2YSXo8Ov9fKAuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8484
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



On 12/1/2025 2:37 PM, Michal Wajdeczko wrote:
> Hi Daniele,
>
> some initial comments to keep you busy ;)
>
> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>> Scheduler groups (a.k.a. Engine Groups Scheduling, or EGS) is a GuC
>> feature that allows the driver to define groups of engines that are
>> independently scheduled across VFs, which allows different VFs to be
>> active on the HW at the same time on different groups.
>>
>> This is intended for specific scenarios where the admin knows that the
>> VFs are not going to fully utilize the HW and therefore assigning all of
>> it to a single VF would lead to part of it being permanently idle.
>> We do not allow the admin to decide how to divide the engines across
>> groups, but we instead support specific configurations that are designed
>> for specific use-cases. During PF initialization we detect which
>> configurations are possible on a given GT and create the relevant
>> groups. Since the GuC expect a mask for each class for each group, that
>> is what we save when we init the configs.
>>
>> Right now we only have one use-case on the media GT. If the VFs are
>> running a frame render + encoding at a not-too-high resolution (e.g.
>> 1080@30fps) the render can produce frames faster than the video engine
>> can encode them, which means that the maximum number of parallel VFs is
>> limited by the VCS bandwidth. Since our products can have multiple VCS
>> engines, allowing multiple VFs to be active on the different VCS engines
>> at the same time allows us to run more parallel VFs on the same HW.
>> Given that engines in the same media slice share some resources (e.g.
>> SFC), we assign each media slice to a different scheduling group. We
>> refer to this configuration as "media_slices", given that each slice
>> gets its own group.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   5 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 135 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   1 +
>>   .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  14 ++
>>   4 files changed, 155 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> index 0714c758b9c1..62dda1c24e77 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_gt_sriov_pf_control.h"
>>   #include "xe_gt_sriov_pf_helpers.h"
>>   #include "xe_gt_sriov_pf_migration.h"
>> +#include "xe_gt_sriov_pf_policy.h"
>>   #include "xe_gt_sriov_pf_service.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_guc_submit.h"
>> @@ -123,6 +124,10 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
>>   	if (err)
>>   		return err;
>>   
>> +	err = xe_gt_sriov_pf_policy_init(gt);
>> +	if (err)
>> +		return err;
>> +
>>   	err = xe_gt_sriov_pf_migration_init(gt);
>>   	if (err)
>>   		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> index 4445f660e6d1..9b878578ea90 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> @@ -5,11 +5,14 @@
>>   
>>   #include "abi/guc_actions_sriov_abi.h"
>>   
>> +#include <drm/drm_managed.h>
> system headers shall be included before our local headers

ok

>
>> +
>>   #include "xe_bo.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_pf_helpers.h"
>>   #include "xe_gt_sriov_pf_policy.h"
>>   #include "xe_gt_sriov_printk.h"
>> +#include "xe_guc.h"
>>   #include "xe_guc_buf.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_klv_helpers.h"
>> @@ -351,6 +354,125 @@ u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt)
>>   	return value;
>>   }
>>   
>> +#define MAX_MEDIA_SLICES (hweight32(XE_HW_ENGINE_VECS_MASK))
> redundant ( )
>
> and maybe such macro should be placed in xe_hw_engine_types.h
> with proper comment why it works:
>
> 	/*
> 	 * Each media slice has 1x VECS
> 	 * Max number of VECS instances gives us a max number of slices
> 	 */

ok

>> +static int pf_sched_group_media_slices(struct xe_gt *gt, u32 **masks, u32 *num_masks)
>> +{
>> +	u8 slice_to_group[MAX_MEDIA_SLICES];
>> +	struct xe_hw_engine *hwe = NULL;
> do we need to initialize this here?
> it will be initialized by for_each_hw_engine, no?
>
>> +	enum xe_hw_engine_id id;
>> +	u32 vcs_mask = VCS_MASK(gt);
>> +	u32 vecs_mask = VECS_MASK(gt);
>> +	u32 gsc_mask = GSCCS_MASK(gt);
> we try to define vars in rev-xmas-tree order
>
>> +	u32 *values;
>> +	u8 slice;
>> +	u8 groups;
> I guess for those two generic counters we don't need to use explicitly sized int
>
>> +
>> +	xe_gt_assert(gt, xe_gt_is_media_type(gt));
>> +
>> +	/* A media slice has 2 VCS and a VECS. We bundle the GSC with the first slice */
>> +	for (slice = 0, groups = 0;
>> +	     gsc_mask || vcs_mask || vecs_mask;
>> +	     slice++, gsc_mask = 0, vcs_mask >>= 2, vecs_mask >>= 1) {
>> +		if (unlikely(slice >= MAX_MEDIA_SLICES)) {
> maybe this 'for' loop should be just for 'slice = [0, MAX)'
>
>> +			xe_gt_sriov_err(gt, "Too many media slices (%u) during EGS setup\n",
>> +					slice);
> then after this loop we can have asserts that no engine instances are left behind
>
>> +			return -EINVAL;
>> +		}
>> +
>> +		if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
>> +			slice_to_group[slice] = groups++;
>> +	}
> like this:
>
> 	for (slice = 0; slice < MAX_MEDIA_SLICES; slice++ ) {
>
> 		if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
> 			slice_to_group[slice] = groups++;
>
> 		vcs_mask >>= 2;
> 		vecs_mask >>= 1;
> 		gsc_mask >>= 1;
> 	}
>
> 	xe_gt_assert(gt, !vcs_mask)
> 	xe_gt_assert(gt, !vecs_mask)
> 	xe_gt_assert(gt, !gsc_mask)

sure, will change

>> +
>> +	/* We need at least 2 slices to split them up */
> shouldn't we also check that each group has both VCS and VECS?

It's not really necessary, having a group that only has a VCS or a VECS 
is a valid scenario. For example, the main use-case we have right now 
(remote desktop) only cares about VCS, so not having a VECS in a group 
wouldn't impact it.

>
>> +	if (groups < 2) {
>> +		*masks = NULL;
>> +		*num_masks = 0;
>> +		return 0;
>> +	}
>> +
>> +	/*
>> +	 * The GuC expects and array with GUC_MAX_ENGINE_CLASSES entries for
> typo: an array ?

yup

>> +	 * each group.
>> +	 */
>> +	values = drmm_kzalloc(&gt_to_xe(gt)->drm,
>> +			      GUC_MAX_ENGINE_CLASSES * groups * sizeof(u32),
>> +			      GFP_KERNEL);
>> +	if (!values)
>> +		return -ENOMEM;
>> +
>> +	for_each_hw_engine(hwe, gt, id) {
>> +		u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +		u8 entry;
>> +
>> +		switch (hwe->class) {
>> +		case XE_ENGINE_CLASS_VIDEO_DECODE:
>> +			slice = hwe->instance / 2;
> hmm, this seems to duplicate previous loop where we had:
>
> 			vcs_mask >>= 2;
>
> maybe these two loops can be combined?

The issue is that there is an allocation in the middle, which is 
required in the second loop and sized based on the results of the first 
loop. I could always allocate enough memory for all the possible groups 
(i.e. MAX_MEDIA_SLICES), no matter how many there actually are, but I'm 
not sure if that is better than the double loop. I'm ok with switching 
if you think that's a better solution.

>
>> +			break;
>> +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>> +			slice = hwe->instance;
>> +			break;
>> +		case XE_ENGINE_CLASS_OTHER:
>> +			slice = 0;
>> +			break;
>> +		default:
>> +			xe_gt_sriov_err(gt, "unknown media gt class %u (%s) during EGS setup\n",
>> +					hwe->class, hwe->name);
> this also seems like an attempt to catch our coding error,
> so plain assert should be sufficient

ok

>
>> +			drmm_kfree(&gt_to_xe(gt)->drm, values);
> do we need to bother with this kfree ?
> it's managed allocation and any error from here will lead to abort the probe anyway

will drop

>
>> +			return -EINVAL;
>> +		}
>> +
>> +		entry = (slice_to_group[slice] * GUC_MAX_ENGINE_CLASSES) + guc_class;
> redundant ( )
>
>> +		values[entry] |= BIT(hwe->logical_instance);
>> +	}
>> +
>> +	*masks = values;
>> +	*num_masks = GUC_MAX_ENGINE_CLASSES * groups;
>> +
>> +	return 0;
>> +}
>> +
>> +static int pf_init_sched_groups(struct xe_gt *gt)
>> +{
>> +	int err;
>> +	int m;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +
>> +	if (GUC_SUBMIT_VER(&gt->uc.guc) < MAKE_GUC_VER(1, 26, 0))
>> +		return 0;
>> +
>> +	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
>> +		u32 *masks = NULL;
>> +		u32 num_masks = 0;
>> +
>> +		switch (m) {
>> +		case XE_SRIOV_SCHED_GROUPS_NONE:
>> +			break;
>> +		case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
>> +			/* this mode only has groups on the media GT */
> then having array of all modes on every GT seems non-optimal

My thought here comes from the fact that the sysfs controls are 
per-device, not per-gt, so we need a list of modes that will be usable 
in that interface. My decision was to have a single list of modes that 
applies to both GTs.
To have separate lists of modes per GT we'll then also need to have a 
device-level list of modes that maps to the per-gt lists, which IMO 
makes things more complicated. It's not like we're wasting a huge amount 
of memory anyway.

>
>> +			if (xe_gt_is_media_type(gt)) {
>> +				err = pf_sched_group_media_slices(gt, &masks, &num_masks);
>> +				if (err)
>> +					return err;
>> +			}
>> +			break;
>> +		default:
>> +			xe_gt_sriov_err(gt, "unknown sched group mode %u\n", m);
> this looks more like a coding error, so maybe use just assert?

ok

>
>> +			return -EINVAL;
>> +		}
>> +
>> +		xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
>> +
>> +		if ((m == XE_SRIOV_SCHED_GROUPS_NONE) || num_masks)
>> +			gt->sriov.pf.policy.guc.sched_groups.supported_modes |= BIT(m);
>> +
>> +		gt->sriov.pf.policy.guc.sched_groups.modes[m].masks = masks;
>> +		gt->sriov.pf.policy.guc.sched_groups.modes[m].num_masks = num_masks;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static void pf_sanitize_guc_policies(struct xe_gt *gt)
>>   {
>>   	pf_sanitize_sched_if_idle(gt);
>> @@ -401,6 +523,19 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
>>   	return err ? -ENXIO : 0;
>>   }
>>   
>> +/**
>> + * xe_gt_sriov_pf_policy_init - Initializes the SW state of the PF policies.
>> + * @gt: the &xe_gt
>> + *
>> + * This function can only be called on PF. This function does not touch the HW.
> but must be called after checking HW engine fuses, right?

yes, I'll expand the doc.

>
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_pf_policy_init(struct xe_gt *gt)
>> +{
>> +	return pf_init_sched_groups(gt);
>> +}
>> +
>>   static void print_guc_policies(struct drm_printer *p, struct xe_gt_sriov_guc_policies *policy)
>>   {
>>   	drm_printf(p, "%s:\t%s\n",
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> index 2a5dc33dc6d7..c9c04d1b7f50 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> @@ -18,6 +18,7 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>   int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>   u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>>   
>> +int xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>>   void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>>   int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset);
>>   int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> index 4de532af135e..3b915801c01b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> @@ -8,16 +8,30 @@
>>   
>>   #include <linux/types.h>
>>   
> we expect all enums (and enumerators) to have proper kernel-doc

will add

>
>> +enum xe_sriov_sched_group_modes {
>> +	XE_SRIOV_SCHED_GROUPS_NONE = 0, /* disabled */
> do we really need this?

This makes things much easier in the follow up patches, because we don't 
have to treat the disabling as a special case. If the user want to 
disabled the feature we map it to this enum and then just handle it as 
any other mode.

>
>> +	XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES, /* separate groups for each media slice */
>> +	XE_SRIOV_SCHED_GROUPS_MODES_COUNT
> while it looks handy solution to count enumerators,
> now COUNT pretends to be a valid mode enumerator while it is not
>
> maybe just provide separate #define for it?

IMO this is safer for future enum extensions. Also, we do it this way 
all over the driver, including in SRIOV code (e.g. 
XE_SRIOV_VF_CCS_CTX_COUNT).

>
>> +};
>> +
>>   /**
>>    * struct xe_gt_sriov_guc_policies - GuC SR-IOV policies.
>>    * @sched_if_idle: controls strict scheduling policy.
>>    * @reset_engine: controls engines reset on VF switch policy.
>>    * @sample_period: adverse events sampling period (in milliseconds).
>> + * @sched_groups: available scheduling group configurations and current mode.
> don't forget to describe inner members
>
> and there is no 'current' now

oops, that comes later

>
>>    */
>>   struct xe_gt_sriov_guc_policies {
>>   	bool sched_if_idle;
>>   	bool reset_engine;
>>   	u32 sample_period;
>> +	struct {
>> +		u32 supported_modes;
>> +		struct {
>> +			u32 *masks;
>> +			u32 num_masks;
>> +		} modes[XE_SRIOV_SCHED_GROUPS_MODES_COUNT];
> hmm, for the NONE mode, all groups must be 0, so why bother with .masks/.num fields for it?

Again for follow up. To disable the groups we need to send the KLV with 
no data. The way I've done it is that we just set the mode to 
XE_SRIOV_SCHED_GROUPS_NONE and the underlying code will automatically 
handle it because the mask is null, without having to know that this 
particular setting is actually turning the feature off. See 
__pf_provision_sched_groups in the next patch.
Also, I was thinking that for sysfs we could allow the code to set 
XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES on both GTs and since on GT0 that's 
not a supported mode it will automatically map to empty masks/num_masks, 
which will tell the GuC to keep the feature disabled.

Daniele

>
> maybe all we need is:
>
> 	struct {
> 		const char *name;
> 		u32 *config;
> 	} modes[];
>
> then:
>
> 	supported_modes := iterate over modes array and look for non-null config/name
>
> 	none := supported_modes is empty
>
> 	current := pointer to modes[] or NULL
>
>> +	} sched_groups;
>>   };
>>   
>>   /**

