Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4B8CCFA13
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 20:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F3E10E9C3;
	Thu,  6 Nov 2025 20:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Re6ouRyq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA30810E9C3
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 20:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762460533; x=1793996533;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WNIy9vcEYh1lSrCtcW814Vghp6+JtnFOgGmUDxdjKnU=;
 b=Re6ouRyq9+GXlnIIc0lcuIBSyoFGdcL5MtO5fTzw0wil3CH8l391sbaV
 x9NSvCi8yTexUDI21PZoG1sTFqffeeUPznMCyVLH4RFeRAFp+V4UUgnGA
 KUk2kxcWB5cybyb8aLj+gpqdnE9tq2rZ9sHDaEltt0xBLCVJkOo+AWzG+
 Gj2DgWp5+wosyJuPRqQGRBxshJ3pLurV7urdngy/HyjA1RqWB+lHfflGk
 xha9j1wLmD+0PYL2jaZ95K5QVsdbF2Sqm/A85vOP2uVAtRqGthH6IImXL
 zMOzYlii0RpsoMl5pDPRywZI9iqiPHijknvFNFTWKEjHF8fiEFIOrtONh w==;
X-CSE-ConnectionGUID: r/5mGhmsSdCT8nvH3oJ1eQ==
X-CSE-MsgGUID: 8YsZpOOBQom6Z9ADLV/fnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64647132"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="64647132"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 12:22:13 -0800
X-CSE-ConnectionGUID: IJhyDPVLTTmpiQ0850iSDw==
X-CSE-MsgGUID: S6s/9W8WTMCPhSBQAUa/LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="187150362"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 12:22:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 12:22:12 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 12:22:12 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 12:22:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9Uv56e5UgghLQ8m30oc+GGm1CLDZ1Y0lYqFPgggNPEqjPZmSh1V4YoIUNkMfIS8WiZBNuuagBNAv93qhAOQHiagkVq4e26mqiYnA36lHmSZVKnpcJMhOJxfgKln+PTyUQSxkG2kWLq/QX49JkNlMc0+Tc3XCP5hYSV0ptFLIBg/Hz2LsyWPVfyTl0BDAYg+Y0W+m6VaMhpqFIHEAf+XCYTZIGB/TeeY+rvpNaTl+UfL6wuQ+KFDjUNiq2qYsRBYaJpZaNrDiyi9KPNaV+OcQGTOj/yXd2L5YfHmI/aFr+yVljujWn6G8PUVBln6H8XYX72NOsXor1OEMU43nFrm1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNIy9vcEYh1lSrCtcW814Vghp6+JtnFOgGmUDxdjKnU=;
 b=WHa27SOvibiVsN276usfckcV91/cWYbSqYZA58rzolcdPmDsf2E8iGo7nLpCmdJ8Vt89UgX17dj4sbDuPQL4Fua/XCF0FFJcn8Y5UeE6hseQchWW4B87TVlrlD4dJac1i/n9Zc0Ku76eyAKE2cl2hqpJvwvKwCzJOY0JBm2Bbk1o75rOV9fLH2jaNUfMYdlcf73o0F6hIMIgyGne9EVk47azGk51A6vCjlOi4r6L4o7lqPe8lB5re2zpxIuLA9+Pbh1gq15BjZrU8d4ATURAWCfb/fnXqH5vvcUGbUtbCKy0VcXSZhy2chUPq6cMf8cKS8WWlgyPWcYKO0R4L6nmOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA3PR11MB9488.namprd11.prod.outlook.com (2603:10b6:806:465::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 20:22:10 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 20:22:10 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 07/12] drm/xe: Rename send_tlb_inval_ppgtt to
 send_tlb_inval_asid_ppgtt
Thread-Topic: [PATCH v2 07/12] drm/xe: Rename send_tlb_inval_ppgtt to
 send_tlb_inval_asid_ppgtt
Thread-Index: AQHcTcUfsbtSw233P0qnN3s7psIzKbTmGoOA
Date: Thu, 6 Nov 2025 20:22:10 +0000
Message-ID: <aa0ff35b2ef4256bd63a07891f00a9366e16ef6c.camel@intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
 <20251104195616.3339137-8-matthew.brost@intel.com>
In-Reply-To: <20251104195616.3339137-8-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA3PR11MB9488:EE_
x-ms-office365-filtering-correlation-id: 970ec25d-4aa5-4e83-2701-08de1d722a56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VDNJSE8xSzJnenVqTloxbHRSRDBKWVJ3UWJjQk5vc0NMMWhadlJXZ2R1eUhm?=
 =?utf-8?B?M2JQNW5vaXpvVGVOYncxK3ZuVzd3TjJQN2h0ZlN1M1hXWXl4bC93Z08vV2RS?=
 =?utf-8?B?UGZrQnhOb2x2TUtpN2dleFlPUmhsNHA2R1ZIQzM2bnkrRnEzR2lqS3F1eElU?=
 =?utf-8?B?U1kySDBURnNnYnZzSXhNRUxrVnUrT2s4WmRMS0tSM3ZYVmJ2TzRTSXJKcDc1?=
 =?utf-8?B?UHhQUExPRk0zZE1hbXA1N1ppSjJRdi9VNmlwWE4ybmRXQWJIMTl2cW94M1FE?=
 =?utf-8?B?Z3ZySGc4R0tTUnRpK2puelNmaWVGZ0lSZ0kyVUcrOVdQa3QvQm04bU9vZUk2?=
 =?utf-8?B?aHl5SGh4MXJIZGc1MnVtU0MvM3lzMHZUUTlnMmErcENHanhJTkt2RnY3Tldi?=
 =?utf-8?B?UmtZUHVKRmE2cXJsYkFwQjNEQkJ6S01PdzFtOER1OTdoZjhwR3JFeFJ5Tzhy?=
 =?utf-8?B?VkFrYjM2aFl3cmRFcmh6SWpXbGpJb0JKT09tOWYvV2FyNlJoV1hwdENZTWtY?=
 =?utf-8?B?d2lob2hjdFpzZVNwR2U1bWJnNmJOcTVmb1NEMjc2dTM2S1RVd2pBaEdKNkox?=
 =?utf-8?B?V3RjYUhWQXFxVW1qNUJOWlk5UkFQdUVEOVd5Njh3aGlXcnFUZ1B2ZHI4bGhp?=
 =?utf-8?B?ZWRsTi92V21iR3hwWWxLRGdpaGZMcG94ODNNQnhSeGpCaUdBdWVLYkE3TElG?=
 =?utf-8?B?aDhBYXZsOXYzZTFsNGxuSE9IYVd5b2V1V3FubEdIZUFHMEMyU200VUlHVXJB?=
 =?utf-8?B?cHRvWmw3QjBiM2JkNFN3VXlXT29XNE4wRnRXdWdQSDk5UmNHRUdoVUFqZnpx?=
 =?utf-8?B?L2xkdmF1ejVrd0NPc3htTEpzcG14SWUwOUxaTWc4QVlXNDREWWhJZVZDVTVl?=
 =?utf-8?B?RnBQdGsya1RQcythZTc4aTJhMWxNOXZpUUhoWEcyb0VBZ1VFRHZaT085OWZo?=
 =?utf-8?B?ZTNyT0IvYXpoTkZEUE84RXFmUlF6S3NKbUhGMXE4dXd2ZXRrUENibWM2RWlE?=
 =?utf-8?B?Nk9WYkIveFgvbC9nTU5RUm1obWFraEdPaTJYcDMySWN5Vm1vVnBsQlplUU9Z?=
 =?utf-8?B?cXgwcXM0ODhjRkVXVTBQOU5NUTcraWhOR3BZVG5sMTdrR1FyRjNFdWM5bWV3?=
 =?utf-8?B?Qkw2b0tDQmV1bk0yZVZCVW0wSHhQVVh6MVBLTHcxUWFMM2M0akh4YWxtM093?=
 =?utf-8?B?NEt4eVlXTjBvb2lLN1pzQzVMeEJrTUZqWkVyTVpFYUprc2tYOHdPR3Jtc29a?=
 =?utf-8?B?aExtMXg3YWI3M3NmdHkyamVDQVRaTUd4RnFjUDBDRjZRWXBNUWE1ZDNsVjFv?=
 =?utf-8?B?VmxqU3hUNnZibktMRVgrUlkvOHFJbEZ0cFlDZW1KdWFXbnJyOWFnZkhVVnhH?=
 =?utf-8?B?SmxwU24xRWQ5UVRObDRETEQ0Wi9MKzhGYmVxZ0FFWG1lRVVBOHdmYjgrN3ps?=
 =?utf-8?B?dG1pRmxqOEQwQnpiYVM3MFpRMkZYMDZTbVQ2OXdNSEJvZkRDaVhBQVJZcGlt?=
 =?utf-8?B?WmVkNlZ0TlRIOGIybUppVHdzNVIyWnMyaFFEdTZsNWdVbjZQeUZrRnVIN3Br?=
 =?utf-8?B?WTBSWkFLbmx0a3ljb3loZmZ6c2VnVkoxWUliazBqOU93dVRQOFZJRnpISWtE?=
 =?utf-8?B?ZGJOMTJMWGdVQVh4RUV5TDFldzlKM3phK2dPOEJHcWhXcVV0dlVTZGR2VjJR?=
 =?utf-8?B?VUpqbXRpNXpLd1F2N0RERUtZdzBoOG9KbTBOZjVZUy9xaXdYVERqRG5SdmpV?=
 =?utf-8?B?QXEzWGlzT3dEbloxcjFNbmE0SW1YRjlQdWJ6VndWZG1hMU5EalFDOU5Md0JB?=
 =?utf-8?B?NTBCRGxtVEtjOGJ4cUQwbWNDMVJiei8yNFc1Y01JbFFIckZmQkd2dnRuSmpJ?=
 =?utf-8?B?aCtrL0YvNjNHWFVIaVIyMy9qanNHcVBVa3h3VkhQMXc0N1RLYXhJNXlycWtv?=
 =?utf-8?B?OXdlQlhiallmZUJTZXQ0ck44czdqV3BLTHdJVzRPV3dxbDlyVVk4NlFwSkxM?=
 =?utf-8?B?YktpRE9NRTM4NzJrZExyQUtzSzI1WGtmUVhydStLaFNFL2dySllLSnJxdHFp?=
 =?utf-8?Q?8HvNQY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmZUZmZraGpOZG91ZlZXcStkcHBWaW51OXRCY01ZL1hPS3lPYm9CRG5zbEhG?=
 =?utf-8?B?M2tXZmlDZHl5cUllUjRtaWdTUElOWW5qeU1OaE1EZS8yWDlBdnhtNTNSeUVj?=
 =?utf-8?B?dkxGNWlHMGh6Sld1eGRpNk85RWFnZlg3eGt5SmNJcFlZMEJhRDQwajkwOVBO?=
 =?utf-8?B?dTZvOGhnZEhXS2Z2SFNqS2VaVCt5MXcxeWFtdXhHRm9PL3kvdzFWWEU2MjNP?=
 =?utf-8?B?RHVLbFlFVjRZWGdmalZONjNEV0pzMDkwRDVHS0l4UkRQQ0pTL01rNTJYV29G?=
 =?utf-8?B?RFlkSDF4Myt3NDBEQUpXVFJHY1hQT0ZhcVNMd2pKaHFYdkJsb2Y2USthSTNu?=
 =?utf-8?B?VFhxOHBlNWhxUnBickJXZUt1bEJ5SnVmb3NoeDBKNGVYZDZJbTNJWlA3WG8y?=
 =?utf-8?B?RmVBSzJka0VrdzNuR0E2RUVhR1N3ekt1aXpZQmpmR01XOElTWnlOUFl2UVVG?=
 =?utf-8?B?bVJFR05wUDJJVWpsS0x6aDdVcnRpbHplSDVPQU9KZXg2Z0dlWkxzN2JUOU1U?=
 =?utf-8?B?c3d3ejVpbG5EMnBZd0NNL2lNRHJ2bllRZG1YL3B6cmhOSE4xYTRaYU1JT3Mw?=
 =?utf-8?B?QXU4Q2xUZTlXdmMrQVFtbk9JMHhRbGo3RWFDcldlOW5ESlB6cEhnblgrUUJX?=
 =?utf-8?B?Wjg5aDQvZGxraitLY2x6THJLdTlGMFpTK2VwdVNDcExpbTlRaG12Yk1NNitD?=
 =?utf-8?B?ajZGUDF6N0w2L1p0OGVYcFJkSXgxODhwaVlEZXFrOHlDYXVXalRuTVRKZVJ3?=
 =?utf-8?B?Z0YzOEF4MUhJODgrdVFWTVZROXIydUt6MnM0ckwwTTFsb0VkZHRUTlV3aExl?=
 =?utf-8?B?UDNTYmhmSWgvRnZWODgwN0dTRHEyQmdjUXl6c2RnYjBHSnhXcFZReTEyVHd2?=
 =?utf-8?B?VFJ5SythZnBYU0l0YlR3M2drNFdJbHN3Zm5odjhqOE1BY1ExWmlMcTNsUXpU?=
 =?utf-8?B?dzIxNjV0c3BLQUJVMWtqMlRaeG52WDFmVWJ6TnFhRnpQUzVlOFFmNVhLeG1y?=
 =?utf-8?B?UHZ6bVlJY2k0bk9iUlpzVmNpUldLQk5DRW9TcE9iOERkUUs0aWZacFIrd0hO?=
 =?utf-8?B?ZEphMWlBaWNsczY1TDd3aWNNb0NjY2VwUCtMT3hmZnVHeFRjZ0lXeGFqUXdj?=
 =?utf-8?B?RmhGL3BPRURGaVhhUUR4WElpSnNNWGk4VXo4d0puSExobVdpNHhZSDUxRzF0?=
 =?utf-8?B?d21RdHl2UENyOUxENUJONlVlK1I5QlIzTHoyN3prKzFLZWZBTEREb0Vtais1?=
 =?utf-8?B?WXF0aUgyVTNGd3lpMm1mdks0RnJGZ3drRUpGeTJjNVpUS2YrOUNhQ25jTDRL?=
 =?utf-8?B?S1plZ3VkS05nbmhZWFFQclQ4RGE2QkpJOG81cGJZUlpsb0N1azdHM1JyNXVm?=
 =?utf-8?B?UVl2dncrK2FuVU9DQXpJQmxoZEFac2U5S0d0cHpjSUpEdkpWUlRuS3hVZEFN?=
 =?utf-8?B?blRua1VZNytLR01BOWhETldZRS9pZ3F3YlJJQ1RzdkQ1amNzNFk1VzdKeVVJ?=
 =?utf-8?B?bFh5NFgzbnFBQmljSlF0WC9tdEVnbHRjVzNoRkpVbTdUTnZNU0d4MzJscnJH?=
 =?utf-8?B?Q0RlYjZjR2F1Z0U1WVlsM1Izc3ZhS2R2b1QvK09JV2FaWkp0a1BJZkVzaFNR?=
 =?utf-8?B?VGtXS0h2MWdPb2UyU1hIUjVSZGFBdFNqZ1NlU3BrZGQvRHp0WDY4MXVvSjNj?=
 =?utf-8?B?bzR4eHBrSDBRY3VHQUVDdFdLeDVIR0ljTlNtZXUyWklEa2FVZHhkNnk0aTBR?=
 =?utf-8?B?TFlDd3lXVE84RnAwQ2k3aDZqRHU3N1N4ZVlKSnNPRG13Rjdaa1dDWHFQWEcw?=
 =?utf-8?B?MDMrWVptS1pvbXQ1eGF2bUF3a2c4Q2pTS3U0UDM5ZzVsa2N6c3JyeTFoQ1FG?=
 =?utf-8?B?aHhlbm5rQXI0V2FjU085K1pHS3BmYk1mZEtVcmVoQUg5TGpqeHNaTFU3ak5p?=
 =?utf-8?B?MW1IbXhDQURIUnNDVEtKMlJjZnhvNGhiVThzZjBSYzE1dkRROUdXNk9qSEI0?=
 =?utf-8?B?NTZtM1JDZ081RHNTSlhhRjIzVTVxb2FxcmJGRzU4RElZZnVzVFVPZGtsQVBl?=
 =?utf-8?B?U1ltWU9PZEdSNXFIRDFVSVFNSFZ0Qjd3R0hLTUxtVEpjS3d3aWQxaElIMWVD?=
 =?utf-8?B?dFBTUjZabFhLWnREY3ZCb1N3UTBSdWpsMTFXa3IwMDdGSzRNY3lWMURtVzdN?=
 =?utf-8?B?V0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6EF78F1A467EB4B82042DA651907053@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970ec25d-4aa5-4e83-2701-08de1d722a56
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 20:22:10.6792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P6so3+7gL5pFc7Z27J1QPkSqmUR0mlZ92PyP/kdLaAl+2l/nLn6WZqq4lYapKd6m9cFg+03hRfVBDxCblYEoP0KcHszA49VYURBYiBEk7O4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9488
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

T24gVHVlLCAyMDI1LTExLTA0IGF0IDExOjU2IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBDb250ZXh0LWJhc2VkIFRMQiBpbnZhbGlkYXRpb25zIGhhdmUgdGhlaXIgb3duIHNldCBvZiBH
dUMgVExCDQo+IGludmFsaWRhdGlvbiBvcGVyYXRpb25zLiBSZW5hbWUgdGhlIGN1cnJlbnQgUFBH
VFQgaW52YWxpZGF0aW9uDQo+IGZ1bmN0aW9uLA0KPiB3aGljaCBvcGVyYXRlcyBvbiBBU0lEcywg
dG8gYSBtb3JlIGRlc2NyaXB0aXZlIG5hbWUgdGhhdCByZWZsZWN0cyBpdHMNCj4gcHVycG9zZS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwu
Y29tPg0KDQpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVs
LmNvbT4NCg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3RsYl9pbnZhbC5j
IHwgNiArKystLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxi
X2ludmFsLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3RsYl9pbnZhbC5jDQo+IGlu
ZGV4IDk5NTc4OWYwZDMxZi4uNDJlOWZiZDA2MmJhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX3RsYl9pbnZhbC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfdGxiX2ludmFsLmMNCj4gQEAgLTEzMSw4ICsxMzEsOCBAQCBzdGF0aWMgdTY0IG5vcm1h
bGl6ZV9pbnZhbGlkYXRpb25fcmFuZ2Uoc3RydWN0DQo+IHhlX2d0ICpndCwgdTY0ICpzdGFydCwg
dTY0ICplbmQpDQo+IMKgICovDQo+IMKgI2RlZmluZSBNQVhfUkFOR0VfVExCX0lOVkFMSURBVElP
Tl9MRU5HVEgNCj4gKHJvdW5kZG93bl9wb3dfb2ZfdHdvKFVMT05HX01BWCkpDQo+IMKgDQo+IC1z
dGF0aWMgaW50IHNlbmRfdGxiX2ludmFsX3BwZ3R0KHN0cnVjdCB4ZV90bGJfaW52YWwgKnRsYl9p
bnZhbCwgdTMyDQo+IHNlcW5vLA0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1NjQgc3RhcnQsIHU2NCBlbmQsIHUzMiBhc2lk
KQ0KPiArc3RhdGljIGludCBzZW5kX3RsYl9pbnZhbF9hc2lkX3BwZ3R0KHN0cnVjdCB4ZV90bGJf
aW52YWwgKnRsYl9pbnZhbCwNCj4gdTMyIHNlcW5vLA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1NjQgc3Rh
cnQsIHU2NCBlbmQsIHUzMiBhc2lkKQ0KPiDCoHsNCj4gwqAjZGVmaW5lIE1BWF9UTEJfSU5WQUxJ
REFUSU9OX0xFTsKgwqDCoMKgwqDCoMKgNw0KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d1
YyAqZ3VjID0gdGxiX2ludmFsLT5wcml2YXRlOw0KPiBAQCAtMTk1LDcgKzE5NSw3IEBAIHN0YXRp
YyBsb25nIHRsYl9pbnZhbF90aW1lb3V0X2RlbGF5KHN0cnVjdA0KPiB4ZV90bGJfaW52YWwgKnRs
Yl9pbnZhbCkNCj4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3RsYl9pbnZhbF9vcHMgZ3VjX3Rs
Yl9pbnZhbF9vcHMgPSB7DQo+IMKgwqDCoMKgwqDCoMKgwqAuYWxsID0gc2VuZF90bGJfaW52YWxf
YWxsLA0KPiDCoMKgwqDCoMKgwqDCoMKgLmdndHQgPSBzZW5kX3RsYl9pbnZhbF9nZ3R0LA0KPiAt
wqDCoMKgwqDCoMKgwqAucHBndHQgPSBzZW5kX3RsYl9pbnZhbF9wcGd0dCwNCj4gK8KgwqDCoMKg
wqDCoMKgLnBwZ3R0ID0gc2VuZF90bGJfaW52YWxfYXNpZF9wcGd0dCwNCj4gwqDCoMKgwqDCoMKg
wqDCoC5pbml0aWFsaXplZCA9IHRsYl9pbnZhbF9pbml0aWFsaXplZCwNCj4gwqDCoMKgwqDCoMKg
wqDCoC5mbHVzaCA9IHRsYl9pbnZhbF9mbHVzaCwNCj4gwqDCoMKgwqDCoMKgwqDCoC50aW1lb3V0
X2RlbGF5ID0gdGxiX2ludmFsX3RpbWVvdXRfZGVsYXksDQoNCg==
