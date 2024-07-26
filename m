Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06A8C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 16:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE3A10E03D;
	Fri, 26 Jul 2024 16:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFdGSCT3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D81A10E03D
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 16:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722011852; x=1753547852;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=LZZE2k1rELcaeP2pbXyrLdANEaI7RQwpO5pTRROsI9w=;
 b=jFdGSCT3uHE6n8UESHW7ZjSNpK8Bdas5t8beeXdwclnxbVM/2oIUdJ7/
 aPrmqHJCeiTdgyCfTHmZkIPH3xXg2X2lJ5Y/CFHE5MZ6BXkF+HqP/GUcq
 JZkvHMY/B3U3m6IkMm5j83sb3DB3rqULDiCL+DtR6DiReatoZTYtYiyCv
 lVBRvWMnSyJ2DsrHFW/Vfuehr3MqNbDg7Wv6erJulHUyAOggDVVh+a3Kp
 T+ugNCwRhU9KJxtwrstckGQ50iIiMSwuF6ahy4IXL+QGfM+thvhU3/d8Q
 07lQSG74KOysWODFf/I89/G4SWxGhKVlvGk4G3Gk/T0up5I4Btvdf078J A==;
X-CSE-ConnectionGUID: ZJNABkW7SV22iHapLLmj9Q==
X-CSE-MsgGUID: m5+aMaOmQDWpY2StfmZu/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19688831"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="19688831"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 09:37:32 -0700
X-CSE-ConnectionGUID: PleywU7yRCmCQGl8Yh7FSw==
X-CSE-MsgGUID: 910c6iHrT2+rdfyl8Vbbmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="53217038"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 09:37:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 09:37:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 09:37:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 09:37:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 09:37:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOO6iBui3ZAeU65e9wmpU0vfQ53XrqcL0hVEg3MM8p0+Rn0qNKjG3HI5RdkX5Mz9D5D9Jja6aNh5Ei8ofMycFdeLIRORo2NeAl7khbhWftBwUM3oWCfiIUQ0QcXqhGNcuV8BWm4uXb6deByHfL2MCAFtxnbt0rLcyrJqzv3dKcCNBoFiEXOJ8eGyPe6xEDMYJVsOSlrbkg59ODpU+ug/b0QgIf2TSpUM6Ppz6m1pYo5UV4dIj0VjcYw1Ftifc/IxrILWreTFkXRMH9/gsGuU3ib+Q2bPuWJIpNVVIUGr9OCNwmnwOZkZNYM3ZWq0LiH3UA4vwfqblFiFz+gpaqHVMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J84qJCxr0921SUccvUGejNowWwQ4OV1gkZ7vnKfBDdY=;
 b=k8i87bqqghf4ZaTYynsaFiZSjF/EyPUqOt+5cwXzPJTlaBWGgEjWAAMqskr9BVhdoTPrezj3SS44LtMrjgsUtzuXhbei38a/m4z1oMSnJXF+uNDTBl3EwXvd3+Y0rOjb2YbiJcZTzJWPWlyyPvTVLupcksnTmHmEoPWMI4sv0T587DZxFbaTWuSpDVUGTUxhapsgDaNWXyQMtvClF0nCghUhxGvgW9euoyxGsUpcSvKMWUooNdyv6qlh84RTWAOyrx0VmgTAMJH8QRcugNVkOJaLw9rGt4EVz7igThFhDN0cIYyS6c+hYvgqPoUoU581q9Xr+8LFnNMTcG/TaKdzxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 16:37:23 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7762.027; Fri, 26 Jul 2024
 16:37:22 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240726064337.797576-7-lucas.demarchi@intel.com>
References: <20240726064337.797576-1-lucas.demarchi@intel.com>
 <20240726064337.797576-7-lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 6/7] drm/xe/kunit: Test rtp with no actions
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 26 Jul 2024 13:37:17 -0300
Message-ID: <172201183744.1586.17708055766759678866@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::27) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV3PR11MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: 2395530a-258b-4059-f3ed-08dcad91391e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2VibElIRitnQTlaM0ltVFpnWUlpeXhPVWM5aWRZUGQ0V3QrbEc1NnZEZE1C?=
 =?utf-8?B?MjJtRUZaWTNSSnNnaDBNb3FCdDFZWXBOc1o0cTJsU0VwQkc1UFhnWG9YUERh?=
 =?utf-8?B?UDJGY3lWZ09ZSFRGTDFNaGluanhwUHVYL01ZRHpWTG93bjdhZTZtMXhHNWRh?=
 =?utf-8?B?RVdZdVJRaUdzcG5NZU5RcE1LdWx5cnlwYXQwVGZrVG9ZcEp2aGZRanFrYlhJ?=
 =?utf-8?B?RXVmQmozeWlPRTFUc1FEZEpNVTJzcWVZQXU5S2RRcXhqc2lnRGs0Z2VDVkc0?=
 =?utf-8?B?NVg0RGV3Ti82Nk04dFlndFBIUzdtWVdrcmlwdzFVaG1hNWpuNDM1bEV3WmR6?=
 =?utf-8?B?UzMycFhqV01pajBZQnF0Ym5QT0V5NitXb2hVU2NCaHNVWER4cWY3anJqSmI1?=
 =?utf-8?B?NmJUOHBITHFvdVRwTGgyS3FHZDYxS0tnd1JCcjRlT1E0VDJDTVM0dXBSRElJ?=
 =?utf-8?B?UU5tWnpMMG9xYlJvK3pYejFZRm56R0t5MVB1TmZGSmlBL0FkTkFnMFFCVEM1?=
 =?utf-8?B?cWI2enJocHBJRHk4Vmxvd1dFUFVodDNSQzg4VDBxbkRjbkMrTk9XTHlVbTJT?=
 =?utf-8?B?YlRNRkRJSlJzcjBSWGZsbzQrbHpmNFk0b2pHNXp1ZjVJK3JGQmRrRkkzd05h?=
 =?utf-8?B?UnF3cFJOYmsvdXdUTGd6WUpEUGxlc3k2bmEzajlxSjloWnliSDBjczhhNTkr?=
 =?utf-8?B?dXlrWktXYkt1NU85Uytlc1NBclBrSHBReElYY2xCOVp5SUxicEVhWFJiNEto?=
 =?utf-8?B?NlRKcFhuQW10S0x2aXV2Q3gwWWE5SWlWekdrYWxhbERrSUxOek9sVkNRSEIr?=
 =?utf-8?B?SlV0M1BqeVJiOXMyRTV1dlpLdEUzNDEzYlhOUmJMUXk3WjExcEVZamxKckRm?=
 =?utf-8?B?bThBbUdZeGQ5ekNiUzQyN1lqZi9hK2hlSzVlNFJXSndEM2RqWWlDOCtxd0t0?=
 =?utf-8?B?eUYzTlNYT1RjTkNIY1cvUXRJWWR2L1hJV1JkL3U3TS9JeGdXeGN3Q21NTW1k?=
 =?utf-8?B?aEVUTXJidlV2RGhZLys0MDVGZXpqWEttVFRDRkRkdmtFZFVqTnVscys3V0hM?=
 =?utf-8?B?djBEZEZ1YnpsdzhZV1JzTUN0M3NPckFQQVVxbDJGRGQzbzZIWmJVKzZ6OHZu?=
 =?utf-8?B?UDY0NCtINm5QSnM0ZkQ2NHhuT3NlQU1WMHZvSXM2ZStVUHErNFFDQkQ4ZThn?=
 =?utf-8?B?UE40eFZlU0FrWWhlTnBUYmxtRkw2SFlkT2MwWnFxOWZzb2pFcnNhWkxVWlhL?=
 =?utf-8?B?NS9LcWpLU2M4SkRxSGlJaERxaWcvL1R5NE9MTVpUV0M5T1JGeE1yM1B0R1hT?=
 =?utf-8?B?RmQrRzBNK2Y1QnFCQWViUVdISXlXQUtGZ3Jqa0hxTXJIS2JqcG1OR3U5VDBG?=
 =?utf-8?B?ZS9qYjl6ODZOSjFIMlJHV0lUWEpuK0tOZkRnTUxadURkb0ZJUHlHWDhKZXdV?=
 =?utf-8?B?cXRwdmo3TUtTeTBXMTJlaEtQVkVNcEhLV2VtbGZYUXZFRE54NEJLUzdRanh1?=
 =?utf-8?B?NWZDNFc3TnNDWVpqazJkTkdlR0p1WGJmY2paM1VCQWIzVnFvdHY5cHRZWWVM?=
 =?utf-8?B?eU5ZVWtMWk1Xa25DYVgySFN6QUEyNmJOY09PQ3puQ2JMMjJEaUNtZVJFcnVz?=
 =?utf-8?B?d3VuL3V6bUp0Q0RiaENvUlk5MFJQbndlTDg0cDJ3NExLd0xwb2hSN3g3U3Fi?=
 =?utf-8?B?WjdHemJSdW1scnEvY3lVRkY2S1V6Y1pFNnNRdndQUk1aV1BXNDQwaFVrNGNV?=
 =?utf-8?B?RHNEK3lyQXZuM0gyUVpZRGNaMEIyWlVYNUVVcmhORmtvVUJKYUNXdEg1SXhn?=
 =?utf-8?B?Vmkra3FzZzRkVS9ZU1Fldz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGhCdlVPcjVvKzlKbEhOZWR6UjJzc09mdEYrYWpXaC9SQkY5c1dUcHp1UWdY?=
 =?utf-8?B?SVN3YmlmbTM2RXRtK1FvbVV2eFUzSXk3TEJWSmhsb1pMWE1GYkVNNWN1YjBm?=
 =?utf-8?B?eERlYXNCTTdYc253TEppQXVVdktJQkhBVXdoSHBkSXVKZ0xzNUUwb255NjdK?=
 =?utf-8?B?Rlh6cXVneGtLV1FOekpGSmdhYnFKUFR0TFVDenpnVGdjU1VLekNGOGNINjYz?=
 =?utf-8?B?dDdEZktISzkzbnFreG5VSElXL2NwenJpeVNZZUo5MTRYc29RRFZ4QzZpd2g1?=
 =?utf-8?B?TEl4c0Q0TU00WlFLc0syblJYcVQyK1d5Wmp4RXp6cTkxa3V4cExGVGpWQ3pJ?=
 =?utf-8?B?UUIvVFRSdmdsZmQvYkg4bXg1SlY2UkppZmgvK0ZWVzRkcG5LcFBlSkFDakI3?=
 =?utf-8?B?YUFzSXZEQXh5SzV1b2c2ZC9vNmtpUHJ6ZmQ2ZzRDbXpMaTl6Sml1WGNpTktQ?=
 =?utf-8?B?WnRCMnl4K0ZLd2RTZXFRUWZieXc3ZWluNmpIelhTcnBwSEJOOHhHb1lVRE9L?=
 =?utf-8?B?N0M3cVVPc3M1RzZhRFJ1b0NSRE44NC9vM2owWW1kbEcyZkpKTnptcWtMSmhE?=
 =?utf-8?B?Uk1GN2ludU5LL3ZHK00zQ21XM0JOeWlWckF0Q0ZuNC9XOHpDVm11R0tncGtU?=
 =?utf-8?B?L3ExdjhJM01DZjJwSmFpRmNhejh4Z1FDY2w4NEovb0ZUVmgxZWRmS2RWcVJZ?=
 =?utf-8?B?OHRCN00xR1JXcDh2dXJKMXd6ZWtmQTIzZmVJb0JxQk53U3RHZ0xvMWZWc2F1?=
 =?utf-8?B?MXlQcFZvU0FHSHlNblp3NzFsd2RNOEJPMVVUSGNCZWxvczl3N29kK2ZLSnJh?=
 =?utf-8?B?eEFWaHBRL2Ftb0d3MFRqREZTTldZRlZMeFN6TjRXemFWZkZLaSsxMzRMK3R1?=
 =?utf-8?B?d2w0Wkp3aE9FeDBKQldpSUduRlZoOEU1V1B6RVNYcENraE9PekEwMW9mVjZ1?=
 =?utf-8?B?TDBLUEVyV0pZRVFPNXUzb2RLeUNMTFdXOFlUd1VmUW91VHBUTjJSZjU3Q1J2?=
 =?utf-8?B?TG5KUzBVamEyUzRsa2xTbGhEUlFVSkUwbDdjZGVFc1J6TlRGdllDMnVvM0lT?=
 =?utf-8?B?dCtOK0V0c3dkVUVHdCtwQ1hNQUUwUWZ0UlFWalNPRHh4YzZkbncyRVJqVDlo?=
 =?utf-8?B?eGlHZ2hEVzFVeXZtdU4vMDBaczJ5YWJ3L24xUzRJS0VRRElYMFUyNHR5YUM4?=
 =?utf-8?B?Vm1xL0I0UTVOQWRZOVhWb2VNTGdJd3Jqc0ZtcWlmUmxtaFRLdG5rV2xxTDB3?=
 =?utf-8?B?MmhjeURTamhRUE85dDEyQkpzRWtjWk40UFV6Q3FhTlhBWGluUVRPQ0JRZE9T?=
 =?utf-8?B?YWFnNnpsbE5nTTlLWFA0aXJPYWhwbjV1aXBWS202WE5VMFV0ZXJ3bHlUb0pT?=
 =?utf-8?B?SUZHa0YveHpFamVXKzdVWU9OTHZpcU56cXV5WE5LZm5WYVo5eGlGUWwwMStq?=
 =?utf-8?B?ZHgweTB5QWZWR3J4eWtUYnMxTXpoOC9VcjhTVnZVNHZtTzE2MFY2M2xaMS9Q?=
 =?utf-8?B?TmI5M0xIM0VYbWJPYzV3V0xWRGlKcVpYaHorb1pvMDVNODh3YjV3NHh1YUdG?=
 =?utf-8?B?UG5DbTRQSjJwWnBFL1pxdnYxS0ZCTlczOEU2SXVCV25SZUROVThYUFgyTzBR?=
 =?utf-8?B?Mk1tcFZmdFFadmZieXE2S1JScEpyN0piQXdENXRDVzRldE4zazZoNEZvaXdn?=
 =?utf-8?B?N2Q5djFmS2NrYmN2dHVsdkNyc2pIRnltNkNZVGZnVy9nL0o2UG5KZjczY2JC?=
 =?utf-8?B?VENDenVaRzRiYnZMS2E0aktnZ3JZTEZQK2N0NDVBRWt5VmFmSldOQWg1NnZ3?=
 =?utf-8?B?a3lERkdNUWlacURuSE5Fei9hcis4K2NSSGhRd2JKaUp3WHYzN0dYSURsZTFU?=
 =?utf-8?B?L2pGSk5JbmVQM3JKYk04N1Z2TVV5c3JOcHB1K3craXlPNDNWUDJXTmxMWE0y?=
 =?utf-8?B?Z1FCM1dnUGUrVUJnalNmSVBsL3IrNm9zM1cyUExMbTdFd3dXbXlMRk8zbGRu?=
 =?utf-8?B?eTk1NGJhdjBUOS9nZlBjOGt0WnIxQU9ic0x3QWlFQ1VTNDdMbHMrRDhyWUd0?=
 =?utf-8?B?QVFjeDU1R3JZR1pHSGxHU2NYb05lOUNwMlR2TjJLUDU0RlNXdDFUTTFIbXE4?=
 =?utf-8?B?OGRJUzhOZzQ2Z2VLOW91QUx6cVpqOEpoTFA0MjF1ZHdORW1wdmxuMHMzbndF?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2395530a-258b-4059-f3ed-08dcad91391e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 16:37:22.2515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KwzoYluUGS4TtCgTQqYMOit6PWaEjg9y5eDxt6RFbXQI1kkZubwnzAVrkqHXCRnWAi3UIjKD9G2kapNjESpEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8483
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

Quoting Lucas De Marchi (2024-07-26 03:43:36-03:00)
>The OOB WAs use xe_rtp_process(), without passing an sr to save result
>of the actions since there are none. They are also executed in a gt-only
>context, making it harder to share the implementation. Thus, introduce a
>new set of tests to check these RTP entries. The only check that can be
>done is if the entry was marked as active.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_rtp_test.c | 163 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_rtp.c            |   1 +
> 2 files changed, 164 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/t=
ests/xe_rtp_test.c
>index 73e97f8d2b5b..5b425a335706 100644
>--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>@@ -42,6 +42,12 @@ struct rtp_to_sr_test_case {
>         const struct xe_rtp_entry_sr *entries;
> };
>=20
>+struct rtp_test_case {
>+        const char *name;
>+        unsigned long expected_active;
>+        const struct xe_rtp_entry *entries;
>+};
>+
> static bool match_yes(const struct xe_gt *gt, const struct xe_hw_engine *=
hwe)
> {
>         return true;
>@@ -339,6 +345,155 @@ static void xe_rtp_process_to_sr_tests(struct kunit =
*test)
>         KUNIT_EXPECT_EQ(test, reg_sr->errors, param->expected_sr_errors);
> }
>=20
>+/*
>+ * Entries below follow the logic used with xe_wa_oob.rules:
>+ * 1) Entries with empty name are OR'ed: all entries marked active since =
the
>+ *    last entry with a name
>+ * 2) There are no action associated with rules
>+ */
>+static const struct rtp_test_case rtp_cases[] =3D {
>+        {
>+                .name =3D "active1",
>+                .expected_active =3D BIT(0),
>+                .entries =3D (const struct xe_rtp_entry[]) {
>+                        { XE_RTP_NAME("r1"),
>+                          XE_RTP_RULES(FUNC(match_yes)),
>+                        },
>+                        {}
>+                },
>+        },
>+        {
>+                .name =3D "active2",
>+                .expected_active =3D BIT(0) | BIT(1),
>+                .entries =3D (const struct xe_rtp_entry[]) {
>+                        { XE_RTP_NAME("r1"),
>+                          XE_RTP_RULES(FUNC(match_yes)),
>+                        },
>+                        { XE_RTP_NAME("r2"),
>+                          XE_RTP_RULES(FUNC(match_yes)),
>+                        },
>+                        {}
>+                },
>+        },
>+        {
>+                .name =3D "active-inactive",
>+                .expected_active =3D BIT(0),
>+                .entries =3D (const struct xe_rtp_entry[]) {
>+                        { XE_RTP_NAME("r1"),
>+                          XE_RTP_RULES(FUNC(match_yes)),
>+                        },
>+                        { XE_RTP_NAME("r2"),
>+                          XE_RTP_RULES(FUNC(match_no)),
>+                        },
>+                        {}
>+                },
>+        },
>+        {
>+                .name =3D "inactive-active",
>+                .expected_active =3D BIT(1),
>+                .entries =3D (const struct xe_rtp_entry[]) {
>+                        { XE_RTP_NAME("r1"),
>+                          XE_RTP_RULES(FUNC(match_no)),
>+                        },
>+                        { XE_RTP_NAME("r2"),
>+                          XE_RTP_RULES(FUNC(match_yes)),
>+                        },
>+                        {}
>+                },
>+        },
>+        {
>+                .name =3D "inactive-1st_or_active-inactive",
>+                .expected_active =3D BIT(1) | BIT(2) | BIT(3),
>+                .entries =3D (const struct xe_rtp_entry[]) {
>+                        { XE_RTP_NAME("r1"),
>+                          XE_RTP_RULES(FUNC(match_no)),
>+                        },
>+                        { XE_RTP_NAME("r2_or_conditions"),
>+                          XE_RTP_RULES(FUNC(match_yes)),
>+                        },
>+                        { XE_RTP_RULES(FUNC(match_no)) },
>+                        { XE_RTP_RULES(FUNC(match_no)) },
>+                        { XE_RTP_NAME("r3"),
>+                          XE_RTP_RULES(FUNC(match_no)),
>+                        },
>+                        {}
>+                },
>+        },
>+        {
>+                .name =3D "inactive-2nd_or_active-inactive",
>+                .expected_active =3D BIT(1) | BIT(2) | BIT(3),
>+                .entries =3D (const struct xe_rtp_entry[]) {
>+                        { XE_RTP_NAME("r1"),
>+                          XE_RTP_RULES(FUNC(match_no)),
>+                        },
>+                        { XE_RTP_NAME("r2_or_conditions"),
>+                          XE_RTP_RULES(FUNC(match_no)),
>+                        },
>+                        { XE_RTP_RULES(FUNC(match_yes)) },
>+                        { XE_RTP_RULES(FUNC(match_no)) },
>+                        { XE_RTP_NAME("r3"),
>+                          XE_RTP_RULES(FUNC(match_no)),
>+                        },
>+                        {}
>+                },
>+        },
>+        {
>+                .name =3D "inactive-last_or_active-inactive",
>+                .expected_active =3D BIT(1) | BIT(2) | BIT(3),
>+                .entries =3D (const struct xe_rtp_entry[]) {
>+                        { XE_RTP_NAME("r1"),
>+                          XE_RTP_RULES(FUNC(match_no)),
>+                        },
>+                        { XE_RTP_NAME("r2_or_conditions"),
>+                          XE_RTP_RULES(FUNC(match_no)),
>+                        },
>+                        { XE_RTP_RULES(FUNC(match_no)) },
>+                        { XE_RTP_RULES(FUNC(match_yes)) },
>+                        { XE_RTP_NAME("r3"),
>+                          XE_RTP_RULES(FUNC(match_no)),
>+                        },
>+                        {}
>+                },
>+        },
>+        {
>+                .name =3D "inactive-no_or_active-inactive",
>+                .expected_active =3D 0,
>+                .entries =3D (const struct xe_rtp_entry[]) {
>+                        { XE_RTP_NAME("r1"),
>+                          XE_RTP_RULES(FUNC(match_no)),
>+                        },
>+                        { XE_RTP_NAME("r2_or_conditions"),
>+                          XE_RTP_RULES(FUNC(match_no)),
>+                        },
>+                        { XE_RTP_RULES(FUNC(match_no)) },
>+                        { XE_RTP_RULES(FUNC(match_no)) },
>+                        { XE_RTP_NAME("r3"),
>+                          XE_RTP_RULES(FUNC(match_no)),
>+                        },
>+                        {}
>+                },
>+        },
>+};
>+
>+static void xe_rtp_process_tests(struct kunit *test)
>+{
>+        const struct rtp_test_case *param =3D test->param_value;
>+        struct xe_device *xe =3D test->priv;
>+        struct xe_gt *gt =3D xe_device_get_root_tile(xe)->primary_gt;
>+        struct xe_rtp_process_ctx ctx =3D XE_RTP_PROCESS_CTX_INITIALIZER(=
gt);
>+        unsigned long count_rtp_entries =3D 0, active =3D 0;
>+        const struct xe_rtp_entry *rtp_entry;
>+
>+        for (rtp_entry =3D param->entries; rtp_entry && rtp_entry->rules;
>+             rtp_entry++, count_rtp_entries++)
>+                ;

Same comment as for "drm/xe/kunit: Test active rtp entries", otherwise,
looks good to me.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

Since we are on the subject, I wonder if this "unnamed entry to
represent an OR" could be now replaced with a proper OR rule, so we
would have a single implementation for the OR logic.

Since xe_wa_oob.rules currently has a nice formatting, we could have
xe_gen_wa_oob doing the conversion.

--
Gustavo Sousa

>+
>+        xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rt=
p_entries);
>+        xe_rtp_process(&ctx, param->entries);
>+
>+        KUNIT_EXPECT_EQ(test, active, param->expected_active);
>+}
>+
> static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *des=
c)
> {
>         strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
>@@ -346,6 +501,13 @@ static void rtp_to_sr_desc(const struct rtp_to_sr_tes=
t_case *t, char *desc)
>=20
> KUNIT_ARRAY_PARAM(rtp_to_sr, rtp_to_sr_cases, rtp_to_sr_desc);
>=20
>+static void rtp_desc(const struct rtp_test_case *t, char *desc)
>+{
>+        strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
>+}
>+
>+KUNIT_ARRAY_PARAM(rtp, rtp_cases, rtp_desc);
>+
> static int xe_rtp_test_init(struct kunit *test)
> {
>         struct xe_device *xe;
>@@ -378,6 +540,7 @@ static void xe_rtp_test_exit(struct kunit *test)
>=20
> static struct kunit_case xe_rtp_tests[] =3D {
>         KUNIT_CASE_PARAM(xe_rtp_process_to_sr_tests, rtp_to_sr_gen_params=
),
>+        KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
>         {}
> };
>=20
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index f054ac9cf06d..1c641cc0f5a1 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -327,6 +327,7 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
>                                 entry - entries);
>         }
> }
>+EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
>=20
> bool xe_rtp_match_even_instance(const struct xe_gt *gt,
>                                 const struct xe_hw_engine *hwe)
>--=20
>2.43.0
>
