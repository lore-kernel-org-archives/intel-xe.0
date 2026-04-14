Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBE3F531F1
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 06:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B3110E56B;
	Tue, 14 Apr 2026 06:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdi9+7ec";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4421A10E11D
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 06:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776147921; x=1807683921;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=m6/dhSEioqxN1/EC3bLilczvt6GEPyPZdn0vP06ex3w=;
 b=mdi9+7ecXswytbJh+MQ/9IL9DmCxktE6+7wBRBkW6frNITPm2jcsxea6
 CmCXtCDY916oK4CMrkY60cMv2+OTQiNY6sFcs4AFrVj1/zInBYHXo2paF
 eLJSE1TT7g+/kihCkV42jQQE/LrmNSeWOg5RkNLe6gEbTFXJZeBxj6Dxs
 lY1SFYXNjyXAqIgX47F1LfBtEWtelJqaA0Zqs6MDesxBPJ9NtR+vT9zyT
 nbdDjRjgNZHgk8hnudGEK0GhdBoOoYasTB663BGJBtVQr6WgZ4WzIoNdN
 zMQWbjLt+z/0Aou3NRQeH2SbXbOqZ0lKUcOTewaG3pt40GWPu/iBUhr// g==;
X-CSE-ConnectionGUID: g9y7piIeSLGUZxJbaUp89w==
X-CSE-MsgGUID: 4vNH2nwSSYutTJ3LJIsYHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77060691"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208,217";a="77060691"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 23:25:20 -0700
X-CSE-ConnectionGUID: sbidC3iGQf2KYw005I4Tlw==
X-CSE-MsgGUID: zqi9ilAlQK+zLCpzO8wnoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
 d="scan'208,217";a="225700223"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 23:25:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 23:25:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 23:25:18 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 23:25:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIqaXTCNzR80EM6etl3ID39SxzLzfwrNeD7ZBKwjCgTkIfroQgjndiM4zaWEM/AudJmgKg5XFGMYzTgahPljByrAaH5wWmWOMTOMN/58ybZo/bUEDv+joioHM0k4qGWbVZ8FOjX+JP1MGYpvdE2y0a79UfebkwIKpiA3TtkYk7II8LyKbHMRda+FAOSxTlR2+YUbkO7CN59WcAru71gt3SD1ZFIUHU5BSTt4Mqmh46jcvK7j50bUvYj7/6ny5eU4Uti83Gvu9UnbVlFdOYHJhElwCliFiVFuhUc8Uh5NN1oBVGMB2MaU2dZEhN97gHBYuBVGQhkTjPiIACmTNVUJEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mC3LoAosymDZU1sidlMGXcmOt1HDORtzWi5p8kbvvU=;
 b=UKP89L8hDLwMJP5dcpeV1KYzgZmLzCbnDQ6Hi8j0Te/4nLIkORHzGEd6lPRfd+ry8vikLMwu2kGGxqXjKI4YyMbeOJ3v9MGj3iNj3Aq68ly5B5+lWrIZqkqyy9g4NcFdL+LVInZAz0qT+/qjOIYMiDstzK7cDBoKZ9BJ6YQ4w9y+d7EASADj0b69/0eUSZ2ZNtarYRp7DHH/zDD8d8UZGFHj1ailsEHuqiywl8OE5mYL+E5dVMnNy09aa/zWOWdrZqNBAW33caCj5Zey3rgq+CyFVMqIm8tnnl7VugR94r/4BmSHkUVLcjZiiv3QmuI6m3sbjGvN5x5ahIFxedCZ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SN7PR11MB7066.namprd11.prod.outlook.com (2603:10b6:806:299::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.17; Tue, 14 Apr
 2026 06:25:13 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%3]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 06:25:13 +0000
Content-Type: multipart/alternative;
 boundary="------------WxCJ0t0l33AcgUn9sS0Bpdbc"
Message-ID: <1448f863-ca73-4e81-8fee-45b510e7ec62@intel.com>
Date: Tue, 14 Apr 2026 11:55:06 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Do_not_crea?=
 =?UTF-8?Q?te_drm_device_for_PF_only_admin_mode_=28rev12=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260409154423.2499340-4-satyanarayana.k.v.p@intel.com>
 <177609444305.457299.1518862245801625586@a3b018990fe9>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <177609444305.457299.1518862245801625586@a3b018990fe9>
X-ClientProxiedBy: MA5P287CA0134.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::17) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SN7PR11MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 16535a1a-72a5-47e0-d466-08de99ee95d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|18002099003|22082099003|56012099003|18092099006|8096899003;
X-Microsoft-Antispam-Message-Info: DEpKL4mSUXnaPKAJHD439G5pH5i558MIgxRJRMzVVuPfebW1A1fl8cwlfEct7yVUgfQp17MUMQzTK1ZeGV83wmedI7ETxpqRPWZQhTS0izug6fznMG4w5Fl791k0VBW2P1d7dkzj1sZD6VmrfToPrz0W26LAZOASDT/Qdpv1B22wv8vx1GOSiBcec82Kq47iQPezdPBl21OGAsM+mkDflrmww4G5erR3UlBHdnW6weQo0XJNECCMp6SwsXGqtwLVtrl3/YVmowegwbcM70zriSjqlQyU++X8Vp9eQFiIn2sp6E8DoYb06RPfPU3MqLK8Q6IxNe+gMB61Gorj2dVBEVOb1kM4CMClYs301F6MwdtrdnkrGlQJvp1rHNZzd5qGucGcn37W+WLej0jSjtI1UEvj//teWBQAPhviYvZ6SwblLH3+1hvbwzlXXrHLwZxE0AVu7OwoqrkCeULN7K1g2qmsjt2Hk+4MVeOcAnH5+BjOTrldnGxDkbZb8x7hksioeDwwsH8iYVZf69vkB/6ZwfeGI90yuFhtDuM+8u4QfiAeajNF+pxOuX6im/32zhoiR7xGsvBX+ThkohbOH1snj8g/8+tjZiftZMg6+Olu6IBUl+R8rCY87q2CxkVzM7IsZ1R2SPr6h/JIholNPNaYB0/rPp7ry8Kg/KwLKYrOpGHPxtwG828lAMXMnzME0vaJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(18002099003)(22082099003)(56012099003)(18092099006)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?by9yMmVXVnc1MTQ4ZytKa1lDUnAyVUMydlplMlF6WGVreXRtU0twUnpDSVBY?=
 =?utf-8?B?T0ZIR2pqbkF5YkJDUlU0clo4MnpUV01QZ0VRaGxMaEFSNVZZRFJwWnVSSzFw?=
 =?utf-8?B?YkJQblNoTWJ1bFlxOUh0OWVYOGdQditBRHVhbVdydHZLbGs3NG0vN1pxekZv?=
 =?utf-8?B?czNmL3BaaHNlZVlZczhrVGhjOXJUQWErSU5SU29ZTGdScjZ6YllpZ3pzTDlM?=
 =?utf-8?B?ZG9wQytyczhWRFRpaVdWTFVzQ0U0SXdhSW9ZMHFEUWtFUzZGK0owMWtHeWt4?=
 =?utf-8?B?SEpHTHdpbUkvTnNrWGVRVkJ5eDEzMkpLNHZ5VWVHTjNwcW5NNHM0clJnUEhl?=
 =?utf-8?B?MDZQNzhNTnhQVlNPRzVqVkIwamx4RUhqQ2JwVVFXQXB2Nll2SzBid0E4aVVq?=
 =?utf-8?B?T1ErVXZENDFVMUFXRFBmUlhGWjR1czc3VUJEVEFqNEEvQ3BLN01lSnNaN3Bt?=
 =?utf-8?B?MlBzRXFTMUF6a2FGWS91VDcrM0V0ckNobThudnlTV2s3OGlUamFRMnZOVjBH?=
 =?utf-8?B?VXQvbENtOVRtR3BXb0doc0I3R3NlenAvMzFaRXlzdmRoakwrSXZXVXZGVE92?=
 =?utf-8?B?U3dtVXo2cWk3by9xa2FYdnlsK1dNblZTcjRHWFBYU0ZhN2JkYzJ5WVZWNEdt?=
 =?utf-8?B?K3U4MktDd3lGUUw4cGZDNlRBSVdpSE1uZE9ZcnA5bnlKYlEzb1p4NEthd1dh?=
 =?utf-8?B?ZEJHZTc1TFkvN2lEN2djY0p5elVmQkYrQU9lMFZObTVLcXJEb0NEei9uTkw1?=
 =?utf-8?B?b2drb1JZR1RIZ2xxaG84R2VsYW1aMXRUWTBLRFhTOHB2aHBGSC9CaUJqZ0Ey?=
 =?utf-8?B?NEp5dkgyaU82OW5CcUhmTWJuVjBGemVENVdtSjZhcllFUWREbWZVSUJnSE5n?=
 =?utf-8?B?aXF0YW92UVpEd3VjOUZjMmg2cFVvenFuQnEwVzUwVGJnWktwdzZvRFdOSWFZ?=
 =?utf-8?B?bUsxelZGd1MzdHd5cHpmeXBTcUZPTG4vWHg0WGM2cTVYbEx3TC9waVJoRC90?=
 =?utf-8?B?L1c2MUxzRzRPdmVqV0JxeGRzTlRFZ3JkY2o2MXhIbkNhOFRXWFpNNE5oZkVC?=
 =?utf-8?B?a1NIaDFNMEJmVjRwVVhHWEg4RFFEclNHNTJtSTBKZWhsOG1WWmgzWnFOZkU0?=
 =?utf-8?B?bGFhVzZ3Ry9pc01SOXJqanVzMkFLcU5EN2Nvb2ZhRDZ4OUN4c3RNNjRacUh5?=
 =?utf-8?B?OVczaU4vZW5aYTJIbW9BUEY1TjF0enBEZEoxdHpNSlRTRERoMUJ5ZWhDZVhi?=
 =?utf-8?B?QWlrY010dHorQnB6TlgzbDBhQzZQN1diUGxEZHJ6cjVyNjB6R2lvcWV3MDlC?=
 =?utf-8?B?anJZcWE0Y2tMbUxhK1NXRmhrSTNtbEZacVRtYWNORnFPQmpFeFc3ZlkzTWhj?=
 =?utf-8?B?V0k3emw1dUV1ZDM1Z2cyMFVzRmdtb2ptMWFEbU9KTWxPVTVUanFHUW1SblhO?=
 =?utf-8?B?Y3B1OGtEMjZXQVlZUHE5VWlURFEzK0xESE9SbjF1VFhwQTdKSXRVbmZpMk1E?=
 =?utf-8?B?eWZGeHFUYVpEN29VL2U5enJTTHRkRW9wN1pXTSs3ZWIwKys2VVprLzVtMHBQ?=
 =?utf-8?B?SHBuTFB0emViajVLc2JmejhlRXhXdEdXL1pEU3laMnZaOStJb3MwbmVRdDF3?=
 =?utf-8?B?Y28xYTM5SmNOUEZNcXVJNjhuWnVBa2p2QmhvOWNxamM3L2tjd2tpT2xMand6?=
 =?utf-8?B?SVlmUTFhWXJkOElaU0FjMzFNY3B5WGdmMnVjdS9hK1BrVm1DaWNRa0VheUdu?=
 =?utf-8?B?ZkNPMkJ3SVVFcEFYMnViTFNnVktBOGM2TE9uam4zUXMwekpsWnI0NXZNcmZY?=
 =?utf-8?B?WUlDeG5OcGdIeTdnZkZkV1pLRGt4dEd3L05sa3VqdmJHV0xsMTErMGVKSTg1?=
 =?utf-8?B?eGNodXZ5aUxsVlFSZkhGckdJMi9DMVY3cDI5a1RjN0hnSVVvM2NUMzY2S1Zp?=
 =?utf-8?B?cGJpSVRpL1N1NUFxSU9HZ2Voa1lSTHZlQVBJejhlemZ1SVJpV0tvY1hRVHdv?=
 =?utf-8?B?RjAyQ0xtYU9ucVdWeDZFayszdzVuc21FSy9DWUZBQ0JqbzdUazBGeUFmQ1hz?=
 =?utf-8?B?UVFkOUhLZGNsYTFVTjdySDdxbXJldmhMQXVjcW5yS2ttMG9EMDV5dnVjd2Jr?=
 =?utf-8?B?dG40djA2anVZWm9QclpSUDNrVEpUT1g1Tmlqc1VLbnlsWGREaE5OVDNZTWFF?=
 =?utf-8?B?cW5rM2N6S3E1bFRpRkNJdytyWFBLVnVVaDVJLzdrVmMya2R5VDhIUkpsYWww?=
 =?utf-8?B?ekxlcExSbDdwUTE0WkNwYkRMRFMwanZsd3duZmIwd29KS1IyelJ4cEczUEtt?=
 =?utf-8?B?b0F3TldIdU5SS3d3R25HVFVMUWdaZDYwdlY5WVQySzJZd05WMFhRcEV6TnNH?=
 =?utf-8?Q?RmzBL91nskTRoPOE=3D?=
X-Exchange-RoutingPolicyChecked: TzB+RX4S/187ynShOtnk0bIYA3kEVlSB9XlbRiiRL2B3if9Of/DXW+Kyjyv2CbITffUMI7/VomYbOCeUo7JwSYOHYJ/vFzkV/QUgO5xNJoOh8Xhn4ir8QwdCxSKWrGX117kslrHGf2+CT2rArKEDWD2khKa4ez2pTEdAFkp/+eU3nNeYe7lt6auV0DeR1EtZ+IRE2lSfGVr5/yh0IqZq3WYjP0YArTaB9EqNg5htIjOZps8rAk0Idxoit3e8un9vfeLGcw1hnRmcv4tQFz/gMTmK6gmfz38lWyu0Y35notVjpPP44knpzCMzLU1Daym6mcLBTaFUaxFrp+th8p68eQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 16535a1a-72a5-47e0-d466-08de99ee95d4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:25:13.6060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpMleJBCzWgm/8POdRGlH5TvEPh4IM2Axahw1wTs5O2x97R9aDWqjnZXrSar3Et3PQSBwNxHYARwr1/IWyESo3Rky6tG57HkibQmde6ITto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7066
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

--------------WxCJ0t0l33AcgUn9sS0Bpdbc
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 13-Apr-26 9:04 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	Do not create drm device for PF only admin mode (rev12)
> *URL:* 	https://patchwork.freedesktop.org/series/160349/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/index.html
>
>
>   CI Bug Log - changes from
>   xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e_FULL ->
>   xe-pw-160349v12_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-160349v12_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-160349v12_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-160349v12_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html>
>
I have checked this failing test on BMG system and it works fine. 
Moreover between Rev11 and Rev12, only kunit changes are present and 
CI-FULL is successful on rev11.

Please help to merge this series.

-Satya.

>  *
>
>
>     Known issues
>
> Here are the changes found in xe-pw-160349v12_FULL that come from 
> known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#3658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658> /
>         Intel XE#7360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360>)
>  *
>
>     igt@kms_big_fb@y-tiled-16bpp-rotate-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#7675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7675> /
>         Intel XE#7679
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#7676
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7676>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367> /
>         Intel XE#7354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354>)
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652>) +8
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-green-to-red:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_chamelium_color@ctm-green-to-red.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306> /
>         Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>)
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0.html>
>         (Intel XE#2390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390> /
>         Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321> /
>         Intel XE#7355
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-64x21:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-64x21.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309> /
>         Intel XE#7343
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (Intel XE#2286
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286> /
>         Intel XE#6035
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035>)
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>  *
>
>     igt@kms_display_modes@extended-mode-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html>
>         (Intel XE#4302
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302>)
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703> /
>         Intel XE#7448
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448>)
>  *
>
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +1
>         other test skip
>  *
>
>     igt@kms_flip@2x-dpms-vs-vblank-race:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-10/igt@kms_flip@2x-dpms-vs-vblank-race.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-3/igt@kms_flip@2x-dpms-vs-vblank-race.html>
>         (Intel XE#5208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208> /
>         Intel XE#7725
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html>
>         (Intel XE#7179
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +10
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>)
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#6901
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901>)
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#6900
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900> /
>         Intel XE#7362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362>) +1
>         other test skip
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#7591
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +1
>         other test skip
>  *
>
>     igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html>
>         (Intel XE#7130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130>) +3
>         other tests skip
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-none.html>
>         (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596> /
>         Intel XE#5854
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) +3
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) +4
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc5-dpms:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html>
>         (Intel XE#7340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340> /
>         Intel XE#7504
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141> /
>         Intel XE#7383
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608> /
>         Intel XE#7304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html>
>         (Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1.html>
>         (Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608> /
>         Intel XE#7304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>)
>  *
>
>     igt@kms_psr@pr-primary-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_psr@pr-primary-render.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +1
>         other test skip
>  *
>
>     igt@kms_psr@pr-sprite-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_psr@pr-sprite-render.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414>)
>  *
>
>     igt@kms_rotation_crc@bad-tiling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904> /
>         Intel XE#7342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> /
>         Intel XE#5813
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904> /
>         Intel XE#7342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342>)
>  *
>
>     igt@xe_compute@ccs-mode-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_compute@ccs-mode-basic.html>
>         (Intel XE#1447
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447> /
>         Intel XE#7471
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7471>)
>  *
>
>     igt@xe_eudebug_online@pagefault-write:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_eudebug_online@pagefault-write.html>
>         (Intel XE#7636
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636>) +1
>         other test skip
>  *
>
>     igt@xe_evict@evict-beng-cm-threads-small:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_evict@evict-beng-cm-threads-small.html>
>         (Intel XE#6540
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind.html>
>         (Intel XE#7482
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482>) +3
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
>         Intel XE#7372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) +1
>         other test skip
>  *
>
>     igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) +8
>         other tests skip
>  *
>
>     igt@xe_exec_sip_eudebug@breakpoint-writesip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_exec_sip_eudebug@breakpoint-writesip.html>
>         (Intel XE#7636
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636>) +1
>         other test skip
>  *
>
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html>
>         (Intel XE#5625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625>)
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-hang-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-hang-basic.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>)
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +3
>         other tests skip
>  *
>
>     igt@xe_pm@s3-vm-bind-userptr:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@xe_pm@s3-vm-bind-userptr.html>
>         (Intel XE#584
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584> /
>         Intel XE#7369
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369>)
>  *
>
>     igt@xe_prefetch_fault@prefetch-fault-svm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@xe_prefetch_fault@prefetch-fault-svm.html>
>         (Intel XE#7599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599>)
>  *
>
>     igt@xe_pxp@display-pxp-fb:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_pxp@display-pxp-fb.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733> /
>         Intel XE#7417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417>)
>  *
>
>     igt@xe_query@multigpu-query-topology-l3-bank-mask:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_query@multigpu-query-topology-l3-bank-mask.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-huc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_query@multigpu-query-uc-fw-version-huc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130> /
>         Intel XE#7366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366>)
>  *
>
>     igt@xe_sriov_vram@vf-access-after-resize-up:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@xe_sriov_vram@vf-access-after-resize-up.html>
>         (Intel XE#6376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376> /
>         Intel XE#7330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330> /
>         Intel XE#7422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-3/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#7621
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-9/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         (Intel XE#7571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>  *
>
>     igt@xe_evict@evict-beng-threads-small-multi-vm:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-6/igt@xe_evict@evict-beng-threads-small-multi-vm.html>
>         (Intel XE#7725
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-3/igt@xe_evict@evict-beng-threads-small-multi-vm.html>
>  *
>
>     igt@xe_module_load@reload-no-display:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-9/igt@xe_module_load@reload-no-display.html>
>         (Intel XE#7578
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_module_load@reload-no-display.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509> /
>         Intel XE#7437
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#5848
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848>)
>
>
>     Build changes
>
>   * Linux: xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e ->
>     xe-pw-160349v12
>
> IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e: 
> 677cbe5bf50a5de31ce771528f249a7531a2ae9e
> xe-pw-160349v12: 160349v12
>
--------------WxCJ0t0l33AcgUn9sS0Bpdbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 13-Apr-26 9:04 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:177609444305.457299.1518862245801625586@a3b018990fe9">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>Do not create drm device for PF only admin mode (rev12)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/160349/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/160349/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e_FULL -&gt;
        xe-pw-160349v12_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-160349v12_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-160349v12_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-160349v12_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>I have checked this failing test on BMG system and it works fine.
      Moreover between Rev11 and Rev12, only kunit changes are present
      and CI-FULL is successful on rev11.</p>
    <p>Please help to merge this series.</p>
    <p>-Satya.</p>
    <blockquote type="cite" cite="mid:177609444305.457299.1518862245801625586@a3b018990fe9">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-160349v12_FULL that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send="true">Intel XE#1407</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658" moz-do-not-send="true">Intel XE#3658</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360" moz-do-not-send="true">Intel XE#7360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7675" moz-do-not-send="true">Intel XE#7675</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679" moz-do-not-send="true">Intel XE#7679</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7676" moz-do-not-send="true">Intel XE#7676</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354" moz-do-not-send="true">Intel XE#7354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-do-not-send="true">Intel XE#2652</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send="true">Intel XE#3432</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send="true">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-green-to-red:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_chamelium_color@ctm-green-to-red.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358" moz-do-not-send="true">Intel XE#7358</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390" moz-do-not-send="true">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974" moz-do-not-send="true">Intel XE#6974</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send="true">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355" moz-do-not-send="true">Intel XE#7355</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-64x21.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send="true">Intel XE#1424</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343" moz-do-not-send="true">Intel XE#7343</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286" moz-do-not-send="true">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035" moz-do-not-send="true">Intel XE#6035</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508" moz-do-not-send="true">Intel XE#1508</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@extended-mode-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302" moz-do-not-send="true">Intel XE#4302</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_feature_discovery@display-3x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703" moz-do-not-send="true">Intel XE#703</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448" moz-do-not-send="true">Intel XE#7448</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-10/igt@kms_flip@2x-dpms-vs-vblank-race.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-3/igt@kms_flip@2x-dpms-vs-vblank-race.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208" moz-do-not-send="true">Intel XE#5208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725" moz-do-not-send="true">Intel XE#7725</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179" moz-do-not-send="true">Intel XE#7179</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312" moz-do-not-send="true">Intel XE#6312</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312" moz-do-not-send="true">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-send="true">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356" moz-do-not-send="true">Intel XE#7356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901" moz-do-not-send="true">Intel XE#6901</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-ultra-joiner:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_joiner@basic-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900" moz-do-not-send="true">Intel XE#6900</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362" moz-do-not-send="true">Intel XE#7362</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591" moz-do-not-send="true">Intel XE#7591</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283" moz-do-not-send="true">Intel XE#7283</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130" moz-do-not-send="true">Intel XE#7130</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-none.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596" moz-do-not-send="true">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854" moz-do-not-send="true">Intel XE#5854</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886" moz-do-not-send="true">Intel XE#6886</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886" moz-do-not-send="true">Intel XE#6886</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340" moz-do-not-send="true">Intel XE#7340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504" moz-do-not-send="true">Intel XE#7504</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439" moz-do-not-send="true">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141" moz-do-not-send="true">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383" moz-do-not-send="true">Intel XE#7383</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-send="true">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608" moz-do-not-send="true">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304" moz-do-not-send="true">Intel XE#7304</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608" moz-do-not-send="true">Intel XE#4608</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608" moz-do-not-send="true">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304" moz-do-not-send="true">Intel XE#7304</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-primary-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_psr@pr-primary-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-sprite-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_psr@pr-sprite-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414" moz-do-not-send="true">Intel XE#2414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-tiling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send="true">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904" moz-do-not-send="true">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342" moz-do-not-send="true">Intel XE#7342</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send="true">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813" moz-do-not-send="true">Intel XE#5813</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904" moz-do-not-send="true">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342" moz-do-not-send="true">Intel XE#7342</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute@ccs-mode-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_compute@ccs-mode-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447" moz-do-not-send="true">Intel XE#1447</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7471" moz-do-not-send="true">Intel XE#7471</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@pagefault-write:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_eudebug_online@pagefault-write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636" moz-do-not-send="true">Intel XE#7636</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-cm-threads-small:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_evict@evict-beng-cm-threads-small.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540" moz-do-not-send="true">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482" moz-do-not-send="true">Intel XE#7482</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372" moz-do-not-send="true">Intel XE#7372</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136" moz-do-not-send="true">Intel XE#7136</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136" moz-do-not-send="true">Intel XE#7136</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send="true">Intel XE#6874</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send="true">Intel XE#6874</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_exec_sip_eudebug@breakpoint-writesip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636" moz-do-not-send="true">Intel XE#7636</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625" moz-do-not-send="true">Intel XE#5625</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-hang-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-hang-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138" moz-do-not-send="true">Intel XE#7138</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138" moz-do-not-send="true">Intel XE#7138</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-userptr:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@xe_pm@s3-vm-bind-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584" moz-do-not-send="true">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369" moz-do-not-send="true">Intel XE#7369</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@xe_prefetch_fault@prefetch-fault-svm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599" moz-do-not-send="true">Intel XE#7599</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@display-pxp-fb:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_pxp@display-pxp-fb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send="true">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417" moz-do-not-send="true">Intel XE#7417</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_query@multigpu-query-topology-l3-bank-mask.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_query@multigpu-query-uc-fw-version-huc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz-do-not-send="true">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366" moz-do-not-send="true">Intel XE#7366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-lnl-8/igt@xe_sriov_vram@vf-access-after-resize-up.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376" moz-do-not-send="true">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330" moz-do-not-send="true">Intel XE#7330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422" moz-do-not-send="true">Intel XE#7422</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-3/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621" moz-do-not-send="true">Intel XE#7621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-9/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571" moz-do-not-send="true">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-6/igt@xe_evict@evict-beng-threads-small-multi-vm.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725" moz-do-not-send="true">Intel XE#7725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-3/igt@xe_evict@evict-beng-threads-small-multi-vm.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload-no-display:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-9/igt@xe_module_load@reload-no-display.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578" moz-do-not-send="true">Intel XE#7578</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-10/igt@xe_module_load@reload-no-display.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374" moz-do-not-send="true">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544" moz-do-not-send="true">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544" moz-do-not-send="true">Intel XE#3544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509" moz-do-not-send="true">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437" moz-do-not-send="true">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v12/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send="true">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848" moz-do-not-send="true">Intel XE#5848</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e
          -&gt; xe-pw-160349v12</li>
      </ul>
      <p>IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-4890-677cbe5bf50a5de31ce771528f249a7531a2ae9e:
        677cbe5bf50a5de31ce771528f249a7531a2ae9e<br>
        xe-pw-160349v12: 160349v12</p>
    </blockquote>
  </body>
</html>

--------------WxCJ0t0l33AcgUn9sS0Bpdbc--
