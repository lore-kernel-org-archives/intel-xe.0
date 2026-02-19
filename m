Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D28C531E3
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 23:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBED10E763;
	Thu, 19 Feb 2026 23:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQvLw84M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBD510E765
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 23:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771544028; x=1803080028;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gWGRJ3X6+Rd62m+eufcxiZJr84bDovGBEw1YV7k0mlY=;
 b=LQvLw84MhANYLD740z9i7c0Ndb5nnS063bCdfHSmf5QgIitPOTDIrrXx
 BXDwKY503SanqI57Icn7zmsndEbXI6ESAbxumgEoQOAYelSJBbZ/KV481
 3plVMQNEnQ+uzW0HINcZFG/OaKjwaIHpgg5unFTWOzngypEIHEpOwz72K
 jZucDudc+3QVo2j3YZ8aslO9UH45+S2xboZJgd0aDOUzeoRnLGvVNVsQG
 XEy6xNRUWEpi+BqG8K97Lx44/JsT02g4zNLAT3lTeEf+IHDKgScQ9D2/I
 Jj6xCPiFmCaFrHcawr4JILibg7X8WZIhEsk4+AMngrnZ0XYgKJdC19zPh g==;
X-CSE-ConnectionGUID: xu16iuF2TpS/8J59x+8EJw==
X-CSE-MsgGUID: BdtgQDgHRKKwmxbE3wT9NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="60218320"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="60218320"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 15:33:48 -0800
X-CSE-ConnectionGUID: y0ywns5/RlKgp9b5QYYLAA==
X-CSE-MsgGUID: 7a2bd85KTDKz4SW30oV78A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="243239082"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 15:33:48 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 15:33:47 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 15:33:47 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 15:33:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMYIyWJd6bF7aUjUEqB1PfTquDcsg1TZKUSEi7z6ZKPC3Q1GuDGU5pis/SncW0WPizKI7gqgjs/BsoVef9sZYOkV9CUm+jqBP/oYFtB0j4OmRzqOZrWvlolLYp6BDFsn61NbbAZ5weZh5joiKq++jeuRfrDAPHHcbNYx9Ryw1g3CEKs6mBN6NY9VBgShGL0bsypqL9yc2/gmXonoIBUoAg8lx+b1y46cmgJJX0h3XLUD0XkdrRDIFeJPMA2QRzGcEEilVwI+rTKIJ3VPXOw3wfLSzubv07Sh+VCYwVxnpKOnXju/PnXv7rYmat434ldsaWNUx6SogHi1fstYLBoCjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3VKxc7s47JuSFwrxgibWMzq/D7sXg2fgojdCmyDiVo=;
 b=F6tJxTDwRigW8caWUpZ0a6Mtvegb2jz6ZKkdf6zPGH8YKgL2DHcwo4YY/7pHuDOE2zzCzYY2OdEz8vGKP9IAGHMBkVmbgDNbP88ZKaJkxikwn3oeLfjq4+Tp0LePZhIUJNt+s2q2mAe66qCg5AtXquXhH827zf4L9GWmbfQ7jM8QJ3IJ2hPvy2J5D7/dmSzaj055EOjj2tlSIxSYqxMKV4CE1q/+H5hlcwAH1cEES2jdRnnmDjv5sVZ58FTY60foKHDKqXa2aBIBnoHgZK7BAfpp6dQ++gXI0S+xlBqLjG5Kb0XpnBexzez1AzMMVLIPL8mxF9RnF45PLT8d8Dd1cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY8PR11MB7362.namprd11.prod.outlook.com (2603:10b6:930:85::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 23:33:45 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 23:33:45 +0000
Message-ID: <4986dea4-30e0-479f-92b9-d1e0516ad44c@intel.com>
Date: Thu, 19 Feb 2026 15:33:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/xe: Enable Wa_14025515070
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260218191643.4130621-5-julia.filipchuk@intel.com>
 <20260218191643.4130621-6-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260218191643.4130621-6-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY8PR11MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d13d726-97ea-4df5-f96d-08de700f52df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjFDQnRyVGFBaThrSjZrU3RlTzB5dVZsTFlydjlkMWsySWR5REVHcCs5TlJH?=
 =?utf-8?B?MEJwaGZyd3YvS25mMVMxRDcvd3pYOEtsZ2JHU2hIY05YMFR3RTN3TnVudGEr?=
 =?utf-8?B?RkMxWHlBMi8zQk4zckp2S2pqc1BJMGVFS2xHaW11NUphSnNhVmo4SjZIeElv?=
 =?utf-8?B?SUhVSUo2NmZ2Wmg2WkdCb0JqbTdBSUo3dHhzVXlZVDk3RnRUR21DOENFb0lV?=
 =?utf-8?B?SEQrVGw0bU5uMC9vYmZuTzZhRmNXWW5ZSlEyRVZCY1RoUWl6d3lnMzVGUXRN?=
 =?utf-8?B?QVB5RG5OTVBlNlk0c0JSU0xhc1BDeEhOdkV2cmNZT3hqRC9uNi8ralEzTEQv?=
 =?utf-8?B?OHZxSXExbmx4emVONzdjV3ZoTW5vYUk1ZDFMdG45VmtJS1ltbVk2WU92MGYz?=
 =?utf-8?B?UEExU0xnQW0vQmdta1VIOGg2TStPRXhySWxMOEZhYXh4Y1M3bjhrMEVESExX?=
 =?utf-8?B?K0JjV0dGL2ZQTkpjSHdVaDhVQ3k2ZkZKeUJRZ3Q1aVFEVm9QdURGOVVxK3c0?=
 =?utf-8?B?eGdjYjlaaVVXVzRQM1lSRGlFOTVzK0dOZTRRRnNNVEJNVWcycGo3NDVKN0pX?=
 =?utf-8?B?NHFOYlZlUW41Um5uMHpwV1dqbnF6bVRPRGJrd2xXS24wd1dzSjFWOUY5Rkhy?=
 =?utf-8?B?Uyt2aWdTUlh6VlNNaFA5UHhPTWhiL3Jsa1RySVRjOC9ZNnFQVytMQWlOYXB0?=
 =?utf-8?B?eExLRUY3Wm1aSEtGdVBnVjFLSTlJd01razF5b2s3UCs1VzdsSzJPTlVsVmRR?=
 =?utf-8?B?M0prUmI4Smt0YXpEd3VWZ0JxTUQ3Q0tJcWpkSUx0SEFINGpuVW1rU3B6enpK?=
 =?utf-8?B?ZGd1SFV6UnE4TWp0cE0yRFlRZjhMaWJTQ2VXdUZJZXEybmRzWXR5M3htb0dN?=
 =?utf-8?B?OXI3KzJ4ekR5Z3dybHlaYjYxRlhBeEJEdW9LSnBUNEllRFA4d3A4Wmk2d0xP?=
 =?utf-8?B?c2Q2SXpmN01lOS9udWkvbnVhMmxLK3JvVXVyOXRjUDFOTGwzNzFyOWcraFhh?=
 =?utf-8?B?RUNVOUNTQnFmTHE5VEdZN3lpUnVpY2hYMzFSMlZkMG4rMFpURkVLQjQyNEZo?=
 =?utf-8?B?WVZPZnJmd0JiL3FYd1NvWHFUeWo2UWl6Szl0VHhhMDBiYVVUaWxaL1pEYkJs?=
 =?utf-8?B?T3lkMjQvay9hOFE1K3FyZGNKWlJ5czdqek9GcXdUY2NTUGd1QTBuNGRuZDU2?=
 =?utf-8?B?RHRBdmdiU210dkNDZXI0clg3OVU5eW9Md1ZSeFZ1YzdnbDE4SzdMVzc4ZEl3?=
 =?utf-8?B?ekdXMUh5bnhjWkVwQVVncFMvM0dJK0VXRDVLOTYwRk53dFJDcU8yVk1CVVNx?=
 =?utf-8?B?eGlOQ2ZQTFdiSjlZZTdFRTZ4NkVvcWhuRHpBQjZKMHoyUUprdzhwR29PdEsy?=
 =?utf-8?B?Ymsya29Lb0R1d0l5TUp1VUk5d20yYVI0OUxZeGtUNElKSWxsWTlrUjNRQmZ2?=
 =?utf-8?B?NnRoNE9TKzJ1MDJaU2RVbkZiTFQwZXEwTXB6Y3JGU1ZSS3R1dElHUlVMVC9C?=
 =?utf-8?B?SThEb09MREdWZWNleFZGcjRzd3dKVTZ1c2x0dXRLZ1lxQ2h4bFdXWkJnWGdE?=
 =?utf-8?B?V2MyMkpsK2hmMTltODQ2Sm9TS0RCS0xDZ0xiMU9IZVBtU1pSVFBtdmgreXox?=
 =?utf-8?B?VDl3Tm1NQThnUVA2QjB0Smk5aThTbC91RDhRWFBvNCt3aXlGTlJsOUlIVXBm?=
 =?utf-8?B?SGo5QWNOa241bmRlZDdLUDErR1dCaERzKzMzZWpLREhoSXp1RjVqUzdPUk5a?=
 =?utf-8?B?ZEcySjdGbWZnMHFocEJ4YmZrUXpWSTlRWWlTalZ5WkxTNi9yVUZ6ckliTERD?=
 =?utf-8?B?aTV3OGV6NWR6aFZnMXR2YzNuOXo3RXhhZ2x3MUtXRGk2UnAveFI0OGxVUUVB?=
 =?utf-8?B?WXlPN0FydktkZ0M2RWwwQXE4VWlsZWo4czB2bFpPU3daLytSNDBJLzMvN3I3?=
 =?utf-8?B?Y0V2bXVLMFA5eUMzVU4zYXB1L3NySWkwZWJKUlNMRjI3NktXcWVXWndXZmhE?=
 =?utf-8?B?WkhZSDdmcWJ6QjhWbEh3T2xuL2ZzK3ZHZjRmNmFjemNZazErWmZQTUQ1UUYv?=
 =?utf-8?B?VzZlZWhYVWFTcTRBYTZxLzJPS0h1L09rMWpoOWJVTEgvSVhvVWFpYjN1VGJ1?=
 =?utf-8?Q?NQok=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUJMQ0dOYW1Hd3N6VWdZZmJyb0tCNk8weit0MTFZYWVRK0xKdmtkVnA5cFRU?=
 =?utf-8?B?UjFYTmdQMU1pbVJLL0dBMThFdXZ4ZXByalJ6Um1KbmliREw5SVBPWlFNZ3pN?=
 =?utf-8?B?RDhxZGxOV0gySFB4TUQzWSs5OVVieTQ0QnA3SGpOVzFSVzA4VXNRVE9xQWpo?=
 =?utf-8?B?Y2R5UDhZVWZMMys3OVZCRXE3TGZEZmpINW05cFl2LzRwcCttcE5JVzVIL1Qv?=
 =?utf-8?B?R3lkQmtIOVIxWXV0M2NTRnJRNEdJb2NaWWI5R1EwQzFBc0VoMyszdERsV0gy?=
 =?utf-8?B?K0xGbE11dzByaEF4RGJPUlk3eUt5aTNhenQ4d3pYZHRaS2VNRUt4ampEclZa?=
 =?utf-8?B?ZmFyQzQ1TTdmSExYZW5hZjlpZG14aGJiZWg5OS81Y2ZZOG9rT094MjBUTEN2?=
 =?utf-8?B?Rk8vTU9Hc0t5QXZqUG12NW1vbHpUbE53TTVzQmV2eTYwbGIvKzh6SFdQRm1Y?=
 =?utf-8?B?S3BRcElaL2JIUStKTHpiNzdOM0d0N2ZMcU1jSzVUTHJHL2crZVdCRkY4REo4?=
 =?utf-8?B?d04rWSszNUFFaTVVRklXUnFBalBmK1lEOUgrM3d2VW5WUWVrYW1Ea3ZHSHQx?=
 =?utf-8?B?RXYvYTNTZ2t6YU9DTFdxQjR4bm41S0dWNmt4NGdOODJLdjJhQUp0VjBqOGRn?=
 =?utf-8?B?L2Z0aEp5UEYvVE1hdFgvRUhJNnRzdDhZd3h5MFl3UmRUQnlzeEp6M3Y5cUNa?=
 =?utf-8?B?QTMrNThIcXFWZmE2V0ZPcjVUTFp2dzhIdnIvMDh1Z0NHSFlKZFAvYklpUGpE?=
 =?utf-8?B?QXRqbEh3dnpsKzRUWnRRcG9ZOUlzYmpoMkp5aCtUT00xeGZTM25yM3c1Y0ZI?=
 =?utf-8?B?dnJrdjVaY0dXYjNxTUVmdndBMlMrQlhiWG45RDQxd3dHNWt2SkpnemdNUmRt?=
 =?utf-8?B?b2s2K2tmbHlVZzRsZ0RvWThhR05ZQU1aN2VJM0NESE9tNXNJYTJ1UFVsOVRI?=
 =?utf-8?B?UE5NWWliUWQvQVBIcWlxSG5ldFJpdXhFeWdYdjRjTlAwbHpNVm5xbUh6c0FG?=
 =?utf-8?B?bkgrQzBvNE8zL1BrbXU4VE9sN3JHenY0SElDcXVwc2k0bFc4ODdSeWlJTUlU?=
 =?utf-8?B?bGRDZEVhNTNNSS9HR05GajNCV2RqaHB5LzF5c0ZWKzdiOWcyelNTTjBDMGVa?=
 =?utf-8?B?NGowKzR1ZmhtQ0s1RlBVNXFsYXZxZWNSMGtFWlFhMmtJZXZ6RVdGSFo2SUR1?=
 =?utf-8?B?UVdIUDY1QU9YNk1aOCt5WGpqWjJ0YlF6Ti9hMVZwZHR5MW5YckV6YVFMeklW?=
 =?utf-8?B?YXNkRlI4bU54cWFtNzF4WXhXOFMwZ2lEbGNuWFc2WFVPMGN5VnRIWVYwcWZ0?=
 =?utf-8?B?T1I2ME10azBPOU9pT05TaWtHcUpjem8xc1JJRitXSHdTdlpxZXhuSWlIUnhq?=
 =?utf-8?B?Ymp6c3NuaXFaeTVvUzVkSWJob1lGVlJwaFNodERkVlZsMXRWUTBDeVVsb0s3?=
 =?utf-8?B?VGgyQzdtTDBYR0FCeWh2MlBHczVyVWk4Tkd3ZkFac0ltNk9zQXlveUZkazZL?=
 =?utf-8?B?M0NMR01uTERMQS9hblRCMllReEt6a0ZCVUlyR09idkpPaGZ4cmNuZHozcFV6?=
 =?utf-8?B?bjh1a2ZnZlpjdHFFa3dMNk5FWGZIdG1udmRjYVJIM1J4QlZsMTFwQ1R6NzQv?=
 =?utf-8?B?TXNmQWN4REtObnRsODVwN1hEeDNVUldLUkZkZDBrNTZ0ZmNyMkU5bllMUGJC?=
 =?utf-8?B?cjE3a1pHcFVEOFJMMnJvZjFhUVB2TmJoQVRjSEZlZFZNbUhFQjZkYStwam9K?=
 =?utf-8?B?NTdaSjdQUE1FY1ZJMC9sTUVUVGNHNkluNmJUVFoyeXU5YVN4TFBkbE9MeXBL?=
 =?utf-8?B?UzhqU1luWEgyNnRoK2xVZ1o1WkhQcHBLV25zdzR6cWc5OFhxRm1XdHIvWFQ4?=
 =?utf-8?B?RFN4blpFMEN2dkJlQlBDbVg3SWwxR0J3S0FFM2JLaEVTajZOYyswcWN2SWRL?=
 =?utf-8?B?a2xna2hXZnczZUFCL2pzK0FpTlM4Nk1wemVGeHcvZHpncC9PNnhZbTV3ZUpl?=
 =?utf-8?B?YW1UOVBRMGJGOVhvNVB1TjhwSzRXeGpVM3h4b29CT25lcUdHWmpkZVFNTjB5?=
 =?utf-8?B?WmV1Wm9TN0JqU09md0p2aC9iTmpvUVJyTFkrL1A2ZXVzMlIyOVhlSkVzUytI?=
 =?utf-8?B?VFlzZjFLekhEcWhpVmIzcDVBOW9BaTUwbHhuaVl0UC81Y1Q5NWxCSTQ2QXU0?=
 =?utf-8?B?OUYwbnNyaFNoUmliRExMNml2RjFWNitRY0tRMExqT2xabmZESUNIUEFQZHFL?=
 =?utf-8?B?RGs0eVZuUTQxVVFJMnc2U0pSeG9YRTl1SHRJNE8rM0lLOXFqQWU5dEFONDkw?=
 =?utf-8?B?cUFYaExiemJQb0ZPTWdjcjZvR0tubDN0T3l5Z1dpM2llQW1MdFdFS0VnUDg0?=
 =?utf-8?Q?3hDOJ4i26RYT01qE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d13d726-97ea-4df5-f96d-08de700f52df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 23:33:45.1342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7dXKOVpkUf6mbH1Iry2DTZNa0pyPpo1HkjQVo+kbyiyOuY5puPjgOvDNi64BL88I/XcjnR50XQcDKilf4tBHThszzt+yIJBriPIC9T69pQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7362
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



On 2/18/2026 11:15 AM, Julia Filipchuk wrote:
> Corrects a failure on context switch. On registration of context with
> indirect ring state will correct state of targeted and idle command
> streamers.
>
> If Wa is unavailable, notify and disable indirect_ring_state.
>
> Added additional XE_RTP_PASTE macros for expansion of longer rules.
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>   drivers/gpu/drm/xe/xe_guc.c           | 6 ++++++
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 4 ++++
>   drivers/gpu/drm/xe/xe_rtp_helpers.h   | 2 ++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    | 7 +++++++
>   5 files changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index e33bd622ab44..f0815500177b 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -496,6 +496,7 @@ enum xe_guc_klv_ids {
>   	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
>   	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
>   	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
> +	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG			= 0x900e,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index cbbb4d665b8f..3f41c0b75556 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -780,6 +780,12 @@ int xe_guc_init(struct xe_guc *guc)
>   	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 14, 0))
>   		xe->info.has_page_reclaim_hw_assist = false;
>   
> +	/* Disable indirect_ring_state if missing GuC 70.53+ WA 14025515070. */
> +	if (!GUC_FIRMWARE_VER_AT_LEAST(guc, 70, 53, 0)) {

This applies to VF as well, so we need to check against the submit ver 
here (like we do above for has_page_reclaim_hw_assist). This was 
actually something we missed in previous revs.

> +		gt->info.has_indirect_ring_state = 0;
> +		xe_gt_notice(gt, "indirect ring state requires WA in GuC 70.53+\n");
> +	}
> +
>   	if (IS_SRIOV_VF(xe)) {
>   		ret = devm_add_action_or_reset(xe->drm.dev, vf_guc_fini_hw, guc);
>   		if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index f4cbc030f4c8..a1f4ad7aaa6d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -360,6 +360,10 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   	if (XE_GT_WA(gt, 14020001231))
>   		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>   				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
> +	if (XE_GT_WA(gt, 14025515070) && GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 53)) {

Unneeded bracket.

Daniele

> +		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +				 GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG);
> +	}
>   
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
> diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
> index a33b0ae98bbc..86eee60c04a1 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
> @@ -66,6 +66,8 @@
>   #define XE_RTP_PASTE_10(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_9(prefix_, sep_, _XE_TUPLE_TAIL args_)
>   #define XE_RTP_PASTE_11(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_10(prefix_, sep_, _XE_TUPLE_TAIL args_)
>   #define XE_RTP_PASTE_12(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_11(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define XE_RTP_PASTE_13(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_12(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define XE_RTP_PASTE_14(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_13(prefix_, sep_, _XE_TUPLE_TAIL args_)
>   
>   /*
>    * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index ac08f94f90a1..b5e9cab34da7 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -69,6 +69,13 @@
>   		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
>   16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
>   		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
> +14025515070	GRAPHICS_VERSION(2004)
> +		MEDIA_VERSION_RANGE(1301, 3000)
> +		MEDIA_VERSION(3002)
> +		GRAPHICS_VERSION_RANGE(3000, 3001)
> +		GRAPHICS_VERSION_RANGE(3003, 3005)
> +		MEDIA_VERSION(3500)
> +		GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
>   
>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>   16026007364    MEDIA_VERSION(3000)

