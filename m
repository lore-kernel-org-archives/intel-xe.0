Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E78CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 13:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EBE10E34A;
	Mon,  6 Oct 2025 13:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="On/FTY1h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C5E10E34A
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 13:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759757263; x=1791293263;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=S0puOd8OpYAtHAV6b6QHGj8a3j6/7dMVgEFMmyjZKAw=;
 b=On/FTY1hNzWP2lz4Rtk+i5CzZVhx/+WfEo3NCxD5LVA3cn7Uv3tbNLHg
 E3g61Pj9oK6sUsyKtSIiHAoeOh5L+sX84dk/R2jZGwJ/LAH0MJC+iGwO2
 1HJOtpPNG5kFjtD+bSzeOXeM0bcaVs27iXWk7p81szChB/Swf94DrptWO
 BFPGCO+MjHGMLjy2+CB/19BNKW/RCN41XcX7hgFkyDOu3wPGiGVFo2dEG
 CMD1YUN9Sqn+VgWYyfApeOaYAdnn7FNgXU165PFDT1FcP9gYvliM6lyYn
 VJvvs0tXZRYevyYBw+J068/UWbDuGuR9VNA/VBJKooVWuJBx8ZPYzoZAt A==;
X-CSE-ConnectionGUID: UHU1XQS3Tjy+IW3L59UTwQ==
X-CSE-MsgGUID: NEr3Jz48R0e4ZfTif5d93g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61885753"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61885753"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 06:27:43 -0700
X-CSE-ConnectionGUID: AcAZAirlR0ShyIX3Smlazw==
X-CSE-MsgGUID: vK7JnBSDSBqvI9CLC8xNeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="179818286"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 06:27:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:27:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 06:27:42 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:27:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8tkrIXnL4Wbrcc1Q86Svlk00FKY0iJUVadw9j7Jnj4xiXEVg/eeK+0valPC3TZTT4lWJ+gk18mEh9noe+C7++gSnzUa0uhgCvJTCVS00NTO3UQy1CUnmhnT8mlGdGwvI6ifeld9CHGRek1WYpprF6ldE2BgYxo/GuOoDd0oQ1zxRXsxzYzI9uS3RuJb77VGv1JMDsTdk50YTm1hhOHqL+b1sIALxe1w3MyCHZ/2NvgN2RReR+7nhZcL/svhXkF2VM6pjJYfreDAvr1wsslWz03q6uzoJrHU3HDg/R9WRTu66xGpyYHe2WTGiKvL6/21U3Ki/7UYv+mjUctvyKdvHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZqphBUmpMO1/YeH+vOjuBRKg54KKwH9guSUsz4OrLI=;
 b=L0rk6EqtwbLGhIGj0+qgS3VZZkEUb1NWoan6Lop/Ee14BbxfsfLhJObRApn9iGkNY7t8xAcp3/xVJ33jiVogmbHGswYzNbH+Jk+fOsOHZ7zP5JI8EnMWXodU6wRIp6B+UQzbfCnVu+99ojTInzBLToUbIfIIFA2kzICH6Wchx/4XI/jEUXzzBhvQXUuo9zShAWeZoVJRA3e+jA79fUuG1ruFwaQtRbc2kwnieRXNznCnBAJVMPxul2F8Yv4eiOKuc3hKNZUre2qLqAVQE2aYzNK4ERM40vJ5/tzlumwiMIc+jT2/P4DsPxSRG/qr1gMDKUvq2Cv0mcKjYlqyUIa3rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB6504.namprd11.prod.outlook.com (2603:10b6:8:8d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Mon, 6 Oct 2025 13:27:35 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 13:27:35 +0000
Date: Mon, 6 Oct 2025 15:27:30 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/xe: Add tile-based SRIOV printk macros
Message-ID: <20251006132730.ektsa6zyio2cguuv@intel.com>
References: <20251005133641.2651-1-michal.wajdeczko@intel.com>
 <20251005133641.2651-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251005133641.2651-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: TL2P290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::7)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc6e44b-1975-42e0-242a-08de04dc1c9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0owQkVoaURJNHFqR0sxRjg1dldNTWhtR0Y0SlV3MjNRc3RjdloyUXhXeEFO?=
 =?utf-8?B?K25WZXFnejJhODE3ZDEyMkpFUnJjNmN5dlRvbHA1b0pObVRuUFBZdkNMY0dB?=
 =?utf-8?B?dy9TOGtMQVYxT3hhOVJYOFdmYnY1WG1pdG4rUjhvUjBVaE9yYU9PUWRZeWlI?=
 =?utf-8?B?dU5VZDBEZStyZUZUN2lxbExvYmZKQVhKczJpR2NLOGlFTFZxS004THBWTnRP?=
 =?utf-8?B?VjlRU2pKQ1RNb1lVK1l3aFBoMGRQZDN2RXFITy9kd3BBc0dINFFPQXlsY0pp?=
 =?utf-8?B?RmZBaXdNOXJGRUVPaTVDQ0lHQmRadVBjOWthUjZJY0E3c0dJQ0RMNkYxeEVD?=
 =?utf-8?B?NC9NWnExL2RGOElZV1RXM0xCOG9KZHZoYVdxNDhSK2Jodllpcy9BMkRLdnhI?=
 =?utf-8?B?VWQ4MWZUWWsvdjBaUnBiM2p3REFBMTNMOVV3N1pWdnovdDBtNWZRK2M3VkVE?=
 =?utf-8?B?VFNEQUtUMHZIR25PSEtham9PeTloK1lxZHcxL0JHZWxERFV5MUtKQ0RvWTJm?=
 =?utf-8?B?Z1B2Y3grYVg4YW1qcldtT1c2YlZtNDh1QmtOa3dwNHBVeDJyQkE3VjE0akF5?=
 =?utf-8?B?MVR4UGg0eHVnQ2RpY2JhcHh1UlpPT2RIS0VrdXJkMlFPSmVDTXNwTmdRKy9V?=
 =?utf-8?B?bTlCMTErMCtxOG1JTlBBL1FUSVJvbXpWeHNjcDVUN3U0b0ZZQ21tQUZlN05J?=
 =?utf-8?B?ZHY4dlFMWHpIUHhodE50Y0NnT09Jdk5JaldNeHplU003SVFWQjlPWlhEVXdH?=
 =?utf-8?B?RCs2N2lvT2RDajVLZjBDKzg1bG9HRVlNTjdtaFBuQUNsa1B3RTlrZTFtbnRX?=
 =?utf-8?B?bXc0dVBjZm9GWTRBVFZjWXNxbUhjL3RpTEVaQ01PN3RjUU9JYjNmK1ZUVGRB?=
 =?utf-8?B?Y3lXMDdOWFVHQURuc1Q2THYvYncydWFNMDNnQSsxTys2RVg5U1BKWHVIaHlv?=
 =?utf-8?B?VVNDYkZibVRYZUZPdEdTMkIzTVl3NWZBTVFoZHQ5V3FUQ3VEWWZ6elZ0T21p?=
 =?utf-8?B?NlUwWERqWTlzRXVzMU1HbFFjaXhFTDMvRE0rMWQ5c3JIQ2JzYkhHSUVHU09Q?=
 =?utf-8?B?S1dzN2pONElZL0t5Qmx3V3Y5TVFDRkVTNmtLbUhkMTdDa2tnMm81b24va29r?=
 =?utf-8?B?NlF5SmxycURJcmo3WDE4RDdLaHVhdlR0cXE5czBaR2xndHczQU1JV1NQQzJH?=
 =?utf-8?B?dmFDaFNUd0Y3T3RkYXhMeFNYZ0R1ZGV5VU03ZW9nOENXNWtOWmx4OUFRdkhv?=
 =?utf-8?B?alBFb3FyVWtORXliZUtNRmZNMGxDa2RuSUtpSHpBL1BBblVtMjZyVHRBeFFP?=
 =?utf-8?B?QlpLcEtZeDhuOVZHSkNDMy95WEwzL0cwL0s4NnYrR2NsRE1hcEhBNzNnOWw4?=
 =?utf-8?B?S1RXTU50YjNKZitqbE8wc0gxZUhIbFdEenp2bm5vWjNaUE9zUW80eGZzRm1B?=
 =?utf-8?B?SlJldUxjQTd2QUhJRG5Xc0k5V0dtUldzdkVka3h0TURSUWFqRloyakNjSzl2?=
 =?utf-8?B?NksrR0t4OTFrN0p3SlA0ZXJicytDTXdqMk9WL2NkOWRCRU14K1NVTkV3cXFM?=
 =?utf-8?B?RFFjSCtKZWV5UTZXTG93K3dVSTBuNWJ2ZEUxaGtmSTNKcEt1V1FGV2c4TXpm?=
 =?utf-8?B?Z2hXTU1KMVRSUmdMa0JCL0FENXdxZlBHSjVNLzNxSkdHcmJ3ZlJiT0JyS1BT?=
 =?utf-8?B?TWdtV3pDRlExVGtmeHpaZUJnQ2J1MVUwTVo4NTZBb2d3NWVBWkthYlh2eTBv?=
 =?utf-8?B?eDNEQVErYVRnQmdjU3JvbXllZHpFQ3ozNlNJOWVJVEI2aEZIbmRtM1VJS2VR?=
 =?utf-8?B?bkI1Nks4SlRYMmozSFA5RXB0cUpURndpZEltYy94aU9CTmllVU5VejViNDF4?=
 =?utf-8?B?UHNvYTh1bFlTMWJjVWYybEtuZUlzeVM0RXhJUkRKSHRub3M2SWZmd3pjWDdJ?=
 =?utf-8?Q?YqW2DK36fMrG5VbDlhyUBT6DlcybX7nv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnFMYnA5SWVPNHJBWmZQdjBncXBpK1hVQzJ0ZTRsZkxtR3ZUcGxFTy9UdmZs?=
 =?utf-8?B?ZVc3bEhFR0RrbXJLcGwrS1FJRUhkT3ZyRmoxdmxCV0NHY2IyMGVqQ0hiWUU5?=
 =?utf-8?B?Nkh2WXJwM0IwTG8vdG5ZZFVYdG80Zkc2ejdheFBMRmlHWXRMVHRqWENzVWla?=
 =?utf-8?B?cU1BZFptU1dmVStFL3k3VG15OVdHSWJlQU16MVY1UHBaR2FLS1RPMEhaZ29k?=
 =?utf-8?B?ZVFyTzdzMHhhQm9remFBU2FFTC9rd0hBUmZaUEZQWmpWdjZWVUhibjdPTVdl?=
 =?utf-8?B?MVQ4aU5YV2tjUDJDa2NKV1NWQTZJQXVJU1pXNWRSVkZKc0p3cVBnWGJSNlNm?=
 =?utf-8?B?QnhlazB5aEhRSzJYeUFTcStxRTBwT0VrcHVWRFBIaXAwRWFQMHVNRHR1NjBB?=
 =?utf-8?B?dlU0cVN6Y0E5dWE4T0hiRUJWRWlCTmdWVFc5OXNzUnRFNzhHVThwTFZ6MU1S?=
 =?utf-8?B?OCtOZmEyZFZFQlJ1TTNtdExrRm9EVjFyV2lvNFlmTkRqZ3JHU1pyTE92TEVx?=
 =?utf-8?B?TlBSdXNlbGtyOGltcjFTVkdXcllmU1dobXg0S3FwTlc4Z1RPVTk5L1Rucmgv?=
 =?utf-8?B?enQ3UngwYm15NDZOeUw1NDNYUExJbUNjeElPcEFPWnhTMlRBOWhnbFZYMTBQ?=
 =?utf-8?B?TFdQU1l3TDhYZUtYb3A2RWFLNkRUd3hib1A3WThWanRzaU9Ra0MwelFvSmRI?=
 =?utf-8?B?dlRtS204ZUQ2QkxZNDdVcXlaUXZTRlJtSSs3OWlQWHNiQmdoVXo2bjdxb2hQ?=
 =?utf-8?B?aXpRTnFWWW9aWHZKT2YyN3RZZ2RTU2hUREFNUWtveFRyNTBKZTVMamNPQUFB?=
 =?utf-8?B?UTkzWlJRMWE1WTN1OXZjMVVkcTdlZStpOCt4aWk1cng5TGI4MmtwVkZVQ1J4?=
 =?utf-8?B?Y3Awb1loczAxM21XZ0Y1WnZhbGIySUZja3FrSXI0ZERLaDJtbkdhKzdYb3R4?=
 =?utf-8?B?alg3VlM1VTAwbkpDZmpITEhWd3J3enk0QUtGMWNaa2wxOWhhTDEzTUJ4V0FT?=
 =?utf-8?B?TFlRVURlVUxVd21nZEhWalJpcjkzK0oyelFlUjE2TFd0RmlwRzNJMCt6SHV4?=
 =?utf-8?B?eDd5d2VIWWhUQWEzMmU0VVUxR2s4WTFpUitqWW1qak5KWGRZeU9zLysyZFlM?=
 =?utf-8?B?T1NQOEtVMjlyREYxNS8wcVFVM3NXOEp4dUErRTZMMkVvemNoRUt5NjlNMzl1?=
 =?utf-8?B?VXN4cmpTSFdYL2RxNmtSN2V3SUtZUC84QUFEVnRKNmVLc2R0WDlrUFJuRXdK?=
 =?utf-8?B?N1NJUUJlQk5JWE92bVNQSXZhdXJvbDlXRGlPaFVmN1RPeGplT1R4QTRESGZi?=
 =?utf-8?B?NEMvM3VQZWd2SXcybXhFVW4zS1IrVWpib1BUdnp6MFRzeVNyaDk1NzVEWnJS?=
 =?utf-8?B?L0U4KzU1dmtzTEVhc0ZuUTRjdi9PVkVrM0Jna1ZvQVRLb3c2V0ZhRW02bjVC?=
 =?utf-8?B?cUtwQWF0NU9iR2N4QlV0MEhpaEp5K3pYMnY4SjJkOEVoUlE0S3JTakUvcjBT?=
 =?utf-8?B?THE2WGRRZHQwZ2I5QUJrQk1LMzFIckNMa1VtOEFuZGRUNHpsS252ZDlVYm1o?=
 =?utf-8?B?NWdLVkFXNGNvekRsM0tKVHdQR3lQaDdEbmNhbWN3a0crTjhxK0V0bnlzSEl5?=
 =?utf-8?B?eEYzTkdsWlhpTGkyUkxYTWh4SjBBNzc5UjRuOEIrL25hOFBBTDQwK0kzbjB3?=
 =?utf-8?B?ZGxtN3dZTlJkRUFZRStBTUp4YzRPY3FQMDZIUEN0MUUvTjV6RytyMTVPclVI?=
 =?utf-8?B?UkUzNVAxMnc4Y3IyQXRTaWRDUkhzeWlzY0tPY0pTWjhpcjBrZC81TnA0Slps?=
 =?utf-8?B?YVYyTWkyV1B3dHAvYXZlS3E5OUczSzQ0WDJJa1k0U3NBY1BqdXdBWUpBbFRL?=
 =?utf-8?B?Q3NEWjJMSVlOVVUzNHNGMlB0ZVRhVWszZjNHLy8vaU50N05UNm4ralI1RmNq?=
 =?utf-8?B?c1cwWEs1ZDNNU2ttNzVJM3pBK1F6dXFTajVMUm5UUDNOOHBUcm84U3BNV0JY?=
 =?utf-8?B?Z01lSFBjYWFudVJjYkw1MVVpbjQ0Z0FrSVVLUDQzN2pqRFdsRXpVMlo5eUdF?=
 =?utf-8?B?bHYyVENEQ01qNi9YQ25wb3RYTC9zelJoWHFQWC9Cb2lWL0VvM0hoVFoxd1E1?=
 =?utf-8?B?Sk1aTzZ0SjhhMlU1TWgzeG5DSXA3VnBROUlwbU5NaWZSQmF6ay9seHIvcE9p?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc6e44b-1975-42e0-242a-08de04dc1c9b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 13:27:35.4272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12R9YFwkh+9qEdDE0qeLswDVhaI8NX3u3U5WEf6h6HO4VFmpqzjwZBlekVSsZxpjCxRcV2dUjMuQId1fHwBlQQHC+AYH25RM2UikRne4h0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6504
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2025-paź-05 15:36:38 +0200]:
> We already have device and GT level SR-IOV specific macros, but
> unlike native case, we don't have yet tile-based ones.
> 
> Add macros to match native use case and also update GT-based
> macros to rely on those new tile-based SR-IOV macros. This will
> slightly rearrange the output of the GT logs and instead:
> 
>   [...] Tile0: GT0: PF: pushed VF1 config with 2 KLVs...
> 
> we might see:
> 
>   [...] PF: Tile0: GT0: pushed VF1 config with 2 KLVs...
> 
> but that's even better.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_printk.h   |  7 +++--
>  drivers/gpu/drm/xe/xe_tile_sriov_printk.h | 33 +++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_printk.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_printk.h b/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
> index 17624b16300a..d3457d608db8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
> @@ -7,10 +7,13 @@
>  #define _XE_GT_SRIOV_PRINTK_H_
>  
>  #include "xe_gt_printk.h"
> -#include "xe_sriov_printk.h"
> +#include "xe_tile_sriov_printk.h"
> +
> +#define __XE_GT_SRIOV_PRINTK_FMT(_gt, _fmt, ...) \
> +	__XE_TILE_SRIOV_PRINTK_FMT((_gt)->tile, __XE_GT_PRINTK_FMT((_gt), _fmt, ##__VA_ARGS__))
>  
>  #define __xe_gt_sriov_printk(gt, _level, fmt, ...) \
> -	xe_gt_printk((gt), _level, "%s" fmt, xe_sriov_printk_prefix(gt_to_xe(gt)), ##__VA_ARGS__)
> +	xe_sriov_##_level(gt_to_xe(gt), __XE_GT_SRIOV_PRINTK_FMT((gt), fmt, ##__VA_ARGS__))
>  
>  #define xe_gt_sriov_err(_gt, _fmt, ...) \
>  	__xe_gt_sriov_printk(_gt, err, _fmt, ##__VA_ARGS__)
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_printk.h b/drivers/gpu/drm/xe/xe_tile_sriov_printk.h
> new file mode 100644
> index 000000000000..68323512872c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_printk.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_TILE_SRIOV_PRINTK_H_
> +#define _XE_TILE_SRIOV_PRINTK_H_
> +
> +#include "xe_tile_printk.h"
> +#include "xe_sriov_printk.h"
> +
> +#define __XE_TILE_SRIOV_PRINTK_FMT(_tile, _fmt, ...) \
> +	__XE_TILE_PRINTK_FMT((_tile), _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_sriov_printk(_tile, _level, _fmt, ...) \
> +	xe_sriov_##_level((_tile)->xe, __XE_TILE_SRIOV_PRINTK_FMT((_tile), _fmt, ##__VA_ARGS__))
> +
> +#define xe_tile_sriov_err(_tile, _fmt, ...) \
> +	xe_tile_sriov_printk(_tile, err, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_sriov_notice(_tile, _fmt, ...) \
> +	xe_tile_sriov_printk(_tile, notice, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_sriov_info(_tile, _fmt, ...) \
> +	xe_tile_sriov_printk(_tile, info, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_sriov_dbg(_tile, _fmt, ...) \
> +	xe_tile_sriov_printk(_tile, dbg, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_sriov_dbg_verbose(_tile, _fmt, ...) \
> +	xe_tile_sriov_printk(_tile, dbg_verbose, _fmt, ##__VA_ARGS__)
> +
> +#endif
LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
