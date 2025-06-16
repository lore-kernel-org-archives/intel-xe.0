Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C34BC7115A
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 19:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDD010E41A;
	Mon, 16 Jun 2025 19:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDICxNmw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23DA10E41A
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 19:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750101301; x=1781637301;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=uToGR8tkilr2i96ScelYySUlLTnbrXBEgoVEj+UcJRg=;
 b=WDICxNmwZgOD7oZW6B3sLUDvNm8DF8wtOFcoLacf2QhiFdqN8s4lUyPP
 Oxz9S/ATS/MSntrQYhYzshGY7ParGcJyWFUek3QpU/0zovXDx7vEOmg7b
 CE98UP48qwkZx6eb/kYw7F9l1QgfhtviSQKf1MGz70rrLMMRt7qxh0THx
 vZTemXNIKeojz3Qv+S2F+PPDi5vvON13w7JBfhqYI30M89IFFNxlWEc07
 8n9v9epO3by+LtqViQ1iIRTGTZPVzIgKrbZTFSEp20aLxwP2TihV0BFKk
 JfkgDg7tQb0FgnApKmha8aIVQF3FADeGlrFSFBz6XodogocWe618ILHHF w==;
X-CSE-ConnectionGUID: NVW8eFfuSImih/KE7Q2yXQ==
X-CSE-MsgGUID: HHHDUKEMSDya95UCqXmGcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62907523"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208,217";a="62907523"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 12:14:58 -0700
X-CSE-ConnectionGUID: i9WbkQt0TLm1JsxCne3sEQ==
X-CSE-MsgGUID: g4sP1t/gR76IsAklimtvQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
 d="scan'208,217";a="148394680"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 12:14:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 12:14:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 12:14:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.54)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 12:14:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3GxHAkb6CrVAkgGJK609sDtx80IKiYU56Arr15lDP4892fuqmaIs2iRVSW5NTIO+GXsPd83Klqzl6uFmrjvnlF+VucqqZI2BzhZ1FOk6lfI8CXpsc/a4m8oDM8dL1DwgJ+/MK5ZqwejSi2t3FElcGAhT25HQDAmU6KcpBM7xOvFdGw/KD20f8ZZEC7RVZIYZSItNwVemwmCi7OLx6HfwLP+gmn9hJellS/SBvXvbRAtRtu/m3RA3rm3PDXP3R0dRaFcQgtDbeOj5QEOQemXzDSfKCqkbSCK3xv3bkmKVHUwGbcmwS08DzzVCfJpPSka4sseObojSB5avBL/cCEG7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/t0mg3Wl6XMastusHLB5/QzycWX6ZmJ5PFOt4xQOfo=;
 b=o8cGz7f+4qVEFjOPC7axg3WaGgEPrkFALxv0G99qWXzmFn4OJVHg6sKG9pV95e8/O/0xn3sNZJTVmbM+4Qg4P8R760/rqgFZBWbI9sAT1juWhKiE2HOK9SXvwXXVB1biJQ9DYdeYicuGEXN+eE8gIlXRJpGs3oyqNg2ctnausHspSnxnvp3ukiZv2OXff3AZR2N+hd7zqZaLGA6O6fGMnZICECLnJkVrxB4R7IbdDDdYT2183wtpd+4+2nElUVpwtoLoBfep9SA7iId2YkXVxLUuidoYpjFJxfwmDRTkZSBK0mfZOAwZfHo6vVjlIhqNT5LU3YttFYSJqcKNdnMibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW4PR11MB6886.namprd11.prod.outlook.com (2603:10b6:303:224::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 19:14:54 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 19:14:53 +0000
Content-Type: multipart/alternative;
 boundary="------------ZfMV2t5Bfxo6dToHlru63fLR"
Message-ID: <f126caea-dc55-46ea-83ef-1849231c29e7@intel.com>
Date: Mon, 16 Jun 2025 12:14:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe: Normalize default param values
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Mrozek <michal.mrozek@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
 <20250613-guc-log-level-v2-3-cb84a63e49fe@intel.com>
 <4ac790b0-5c9c-4c15-a073-9007b3624e23@intel.com>
 <jfkgpylqiujyudvqr4ivn3653arznibeofzqrdyhiy4fv3tgsk@tjf4hde4izg3>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <jfkgpylqiujyudvqr4ivn3653arznibeofzqrdyhiy4fv3tgsk@tjf4hde4izg3>
X-ClientProxiedBy: MW4PR04CA0359.namprd04.prod.outlook.com
 (2603:10b6:303:8a::34) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW4PR11MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: c02f85dd-e5a7-440c-4959-08ddad0a12f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDZsdGxDeGd2Z1Fqc3NidVRZb2VydERsb0JJWG5sRVA4L29icUo5L0VuUVov?=
 =?utf-8?B?c1J5ZGxkTEVVWG1BUVNWWURJZXN4NFdwL1NoaVJiQlFPU2NUMnZGWFlOYXZT?=
 =?utf-8?B?akxPQzhYZERJZm9FY056RytuWjljaXo0NU15enE4RkVtdTEwR0E5a1VpMUho?=
 =?utf-8?B?RzJleE1pM3ZzRTRzWGtwRG9CVkRHVUhMeWdMM29TMXBlR2V3bzRFV3doTkhi?=
 =?utf-8?B?N1dEY1JSc1UyWXdieUhXUSsreWJ3S2J1V0xFZ3YwbjdIWHRXR3BNajNUZzdj?=
 =?utf-8?B?eXB5WThYTTNrZ2xtQW9CRkJwVnk4Y0dMemkzVW1CdEdNb00rUEFaKzJFaU5O?=
 =?utf-8?B?RVR0NEdHaWVzcXpMWVp3b1FNOXNmbWsyaVhjZ3NqT0s1M3NIYWZCYzZESGdK?=
 =?utf-8?B?eGMzdTI2QzFYNkpKOUV2Nmc3aGdXWEw3bWpQUHBzQTNWcE1FRHA0eDY0WkRr?=
 =?utf-8?B?aFRQRjNBZEhaT1B0enNlL0RrMXltTnNrdmlGdU5iWmU4cGd1WmJsZEllRk1Q?=
 =?utf-8?B?bk5wcVMwYVIwZjA0Znh1S1FyeFJQMVhxckh0K1NvNmxaWUppd0dJMCtReXBJ?=
 =?utf-8?B?bzZYU2FnOHU0YUpVeVN2cUlFV040bXVRd04ycmd0YURsWU93WVdDMjJxeU1R?=
 =?utf-8?B?QVNpZDFYK2FBTXNLMjM0Ti92WTRNNURTWDBkR0VBb3N0VXdpb2FLa2gvNkxQ?=
 =?utf-8?B?d0YyeVMxWDFjTWltRURHditNVGJUTjdXTGxxRFgrQkZmU2E3V2tBNEJKQTJY?=
 =?utf-8?B?eEN6b1R3YWpqYlIwaVBIeU1Xano2S3RqVEpFNGZMaXAyaVFaWkcyK2pzUnlQ?=
 =?utf-8?B?dk5TTWZYNTFTQ1JhSXE2Z01xLzQ3QVBkekZpQ0NBVkVBSWNTMGlmbkV2d09m?=
 =?utf-8?B?cVNyN3FSOGZpTlB2Qk0wRGl2ZVNWRVE5bDg2dUQ4SmRPZVgyOTk5STZlcVpR?=
 =?utf-8?B?ZS9zTGxjUSs2VGV1NSt4L0p0dVlHQzBjd0VzUmpJQTQyeUtrdEZEOE1RT3Rm?=
 =?utf-8?B?VWFlTkpxYkpXYWxpN1JLR01JRHVGMGNobVJhODlWQlpCcEVIQkt0VzQ5RmVB?=
 =?utf-8?B?aFZTcGR4Y3E3UUM0cGJkUHFuV09nUUFha0pPT2Exbmp1b3ZQNXB1SkJqZEJP?=
 =?utf-8?B?OXlUWDZ1MUE2NkRTYk5xTTI5R0trMi9ld012b29XdGpMQ3lGcWhJY04yQnBa?=
 =?utf-8?B?NUwrb05UVlFqVlR3Tll2RmhZNGhBWEZzL0p5bGFXUUprbXVjZWIyYzhPdzBR?=
 =?utf-8?B?alN0R0FYbGszM21BSURsMWErRVNheFg5Snp4clpGTm9xK2pHTCszU3VvaVlu?=
 =?utf-8?B?YzRzVFlxSkFjVkxUaE5FY0R2aEh4RGNhQkhpVHk3Y2NOb1JuU2FyYWpzTHVS?=
 =?utf-8?B?Tm42cHdPazZvUUtZbW1naTlES0d0eFJReUVFTjdSZFF6Y2QvRG9zNUpOYVpr?=
 =?utf-8?B?NFJoajhTZkFzVHh1bm9ESEIxc1Y2S2xWOUNuT0dYTTJPWVFlN2QwWUorZUxV?=
 =?utf-8?B?NFJXMlEzOE51Y1FoMU02RGlhSWNCUDQxTGVYWW4vMTk5cW45Rm16MzlyZmVH?=
 =?utf-8?B?dTVKQzJrNEsvUzE4bGJ0UGsxVExIZVFPL2VUem5ZR0pLYkJEdWF4d2dJMHgy?=
 =?utf-8?B?Q2YxTmp5WDVpeWJSVTZhU0lMdys5WXBTOE1aZGNNSlVJYW5wcnN5N2ZuS3FZ?=
 =?utf-8?B?VjhROWJ6RkcwZEx6c24vSE5qT0R0SkxlN044SE1uNXRCN0ZKa0Vja2xLL1hZ?=
 =?utf-8?B?NzdFLzB6ejZ3ZFZ5OU1COHpHNjhQUFAzSmtEY1p2VXVTRkVGY2tiQmIvR29X?=
 =?utf-8?B?bnpyeEltUERSbldLR3k4TDFjOTVURElGODFDNHYxWkpXMU5BVkhLVCsvbzZG?=
 =?utf-8?B?bk5OdUhDZ3p1V3IyUFdvR0cySGFXYkhqLzBJSzBPMng3NFljYlJZNFU3NVNH?=
 =?utf-8?Q?qJZ/+nCVl34=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3lPNjlvN2hxWlpxTCt2NVduWjZxd3pScDFEdS9aOUd5NXh0MDk5eXgyZGxB?=
 =?utf-8?B?bWJJQk1xeEZjbFhremZScGdkQ1Z4aEg2VUc5RjBBMHk3MklydmtUNXNWZEVZ?=
 =?utf-8?B?TnREVHJ4NUhaZ0xCSjlvcTFXT0F1Zm5DdU1LNkpGTXJVMTJscHNZOHZjRnlF?=
 =?utf-8?B?QnhpWHExUW0vNTBWZlpRcFowb2Fqa0M2OXhSeU9OSjk1Zm4xMGlmQnBwWnQz?=
 =?utf-8?B?SVdCU2d2YjZTNWl4L0JhdDM3WUp3WVN6U3Qvb2RjbC90VmRzVTFvVE9TcXhV?=
 =?utf-8?B?b1BEM3FHZndrZy9MVTRETXh5am5qYldqRU03Y1Z3aUdjQWVVemwvczZDUHMw?=
 =?utf-8?B?SE43WEpQcTRUcnBrbnBGRWpHaEpEeUtqdVNmRmcvbll4Ry8xM0liRjZCNEYz?=
 =?utf-8?B?b3dBYjZSd3MvaGxCcmtIdHNXM0NiM0d4MmI2Q3VnelhrVWprMEhMOVBSYnow?=
 =?utf-8?B?VWtVcndpWVpYaW1ONTlBNG9CbVdKVEFoU3F6TStaU1BMTFplZ1ZWWk5ndHF0?=
 =?utf-8?B?MGxUMFJONlRranVab2p4czIwbzg4UWZ3VmM4dTVvU3dqSkx3b3g4bDRwMFVl?=
 =?utf-8?B?eHNpazRvNFZkSEJaWWVvd3RSd2ZBdklZeUZuWmxTUnVISG1VMGU2VHZXLzUx?=
 =?utf-8?B?SkRGak9OWHV3bEZ0WExqQ0RHWG90VWZuOTZ4a2pwTTk2Q0NTV2dIZjBNSEMr?=
 =?utf-8?B?T0VQZkc5ODV6bmc4Y1ZvODBkZUJlcnU1bUhpTGJvU0NxN3JaRytCaEFRMU56?=
 =?utf-8?B?YTlYZlpSMitHS21qcSs4M1NSNm5QZ2s3cGVtck93NkdITEtjTWVmVGY0dWZ2?=
 =?utf-8?B?N1NvTWJuYTh2d0NKOWlzSmFWbTJ0WFJxVGpacytXMDJJcDFGSFJPSk52djBm?=
 =?utf-8?B?dHF5dUVGVTA3TlB2RUF0TzBRblNITTJSWHI1RzR1ODF1YURraG9qWkpLRXJW?=
 =?utf-8?B?YitoWVQvQndMZURMdTQweW5XMmo1SHpPc1UwdCszVTRHZzE2TUw1dWg3aUVL?=
 =?utf-8?B?YWpVTUNWckIrQ1c3NEREZUV6aVlOWWNybVJEbEc5UEQ3QTF0Q2QvcEUrWjJ2?=
 =?utf-8?B?TFFtUkpvRTBsWk5yRnBOOWxmcWxTRWZKSVE1eVdYUnJYQ092M1hSaHB4NHA5?=
 =?utf-8?B?emFNY0V5UmloUGFvQzlpTC9oQW8wejlHOGhMUEJMYTl6TTJsby9nUXRyanZm?=
 =?utf-8?B?VmorMlp0eXRwa0wvL24vSHBCbWR2dFptWmhtenZNeFlPb0d2enVSZWsvVmNa?=
 =?utf-8?B?cEY1NDBaQ01hM3N6bUpwOTFieUJodmRGZTlkbmtJUmY1K2Q1OGp0VTMyU1VK?=
 =?utf-8?B?dUx0TEJxUDVXQmpMWWx3MWhQdlZsS1g4WDJZMHZzdkdWVVdRTk9WNW90cnpI?=
 =?utf-8?B?dkVQUTdyZ1I1ZUhickpzNTVjbDA3a1Ztd3ZuM3ZEUDhFemNNNDBMTG5FZkhy?=
 =?utf-8?B?TWs5YUJaV2dZSnhSeXZSaWpzUXhLV3F1a2ZNUDhwMXd1SDRlWDRiVmJEVVcv?=
 =?utf-8?B?cUV5aWdTdTlDNk9JUnh0U2pDZlo1U2x6aW5EUUFOQlpGYkVaRTdROVgzeHJ1?=
 =?utf-8?B?cEJNS2JoRUNObHQraHRqTGhwUEM2OVFOU1lXMzIyV3hTa2NjQ0dscjE0d0FQ?=
 =?utf-8?B?empIOVFwVGhxNlhDT0FpN0VFeDNIVEJtbHFzYUZweFU0ckpMN25SalhwOWl0?=
 =?utf-8?B?Sy95c2JaMUhBc0M3UE9CWkdMa1ZmUVFUN1ZwNHc3enZ3djhNSGk5NnRyZFYy?=
 =?utf-8?B?d2RicmZFUytHZXpIeFc5dWQ0WGVQWFJRUTdXNW5nQStzS240MEZsVUtBd3M3?=
 =?utf-8?B?NWJYTlkrd3F6K0dVcWw3ZXJ1S2pNT2dobXZIaWE5VmE3cHhML2d3eVpqb20v?=
 =?utf-8?B?TDl5UEhKclh2S1FnYnF1U04vdHVyVnJvRDJ3S1lBaVRLSHZjQ24xanN3WVNt?=
 =?utf-8?B?dDN6dmk0Uy9WUEZ1OFdNZm1PdHVvdlQwc2xQNHZqOFBVa2ZZVVRwaFNPUjF1?=
 =?utf-8?B?eVRqWnE3NHJ4YTdnZ1BHaTR3ZCtYRVlvTHp4NnN3MUpEbVZNY256aG5WQkFZ?=
 =?utf-8?B?MnBWOHJwQ0V3SFVXenhUQ09uM0xrM0hRUk50MkxhSTVyOGFqUmVNaDk1aURl?=
 =?utf-8?B?dUhEQXJjRjhGRWFsK3NDNzRwZnBXcVFLNnNtTzdQY3ptcmZSRHY2Z0ZUVHBE?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c02f85dd-e5a7-440c-4959-08ddad0a12f0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 19:14:53.8146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSRv9zc7vZo70KOqj7RaNYxrK044+7qmHjaahQqsoq0COtzQ8WgXuf4JCBacsUY4uQtIMSRvXHDTY6oGyHjmizsWHhEGaT6xaFeHBIYF4iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6886
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

--------------ZfMV2t5Bfxo6dToHlru63fLR
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 6/16/2025 11:52 AM, Lucas De Marchi wrote:
> On Mon, Jun 16, 2025 at 11:46:57AM -0700, John Harrison wrote:
>> On 6/13/2025 1:00 PM, Lucas De Marchi wrote:
>>> Document xe module params with the default values following a similar
>>> strategy for all of them:
>>>
>>>     1) Define a DEFAULT_* macro with the default value. When the
>>>        value can't be directly stringified, also define a *_STR
>>>        variant
>>>     2) Use __stringify() or the _STR variant to make sure the
>>>        default value shows up in the param description
>>>
>>> This allows us to show the correct default according to the
>>> configuration. max_vfs for example was wrongly documented for
>>> CONFIG_DRM_XE_DEBUG and svm_notifier_size didn't have its default
>>> documented.
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_module.c | 44 
>>> +++++++++++++++++++++++++++---------------
>>>  1 file changed, 28 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_module.c 
>>> b/drivers/gpu/drm/xe/xe_module.c
>>> index 192908fa074cb..2068c579d5c3b 100644
>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>> @@ -19,34 +19,43 @@
>>>  #include "xe_sched_job.h"
>>>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>> -#define DEFAULT_GUC_LOG_LEVEL    3
>>> +#define DEFAULT_GUC_LOG_LEVEL        3
>>> +#define DEFAULT_MAX_VFS            ~0
>>> +#define DEFAULT_MAX_VFS_STR        "unlimited"
>>>  #else
>>> -#define DEFAULT_GUC_LOG_LEVEL    1
>>> +#define DEFAULT_GUC_LOG_LEVEL        1
>>> +#define DEFAULT_MAX_VFS            0
>>> +#define DEFAULT_MAX_VFS_STR        "0"
>> Could be 'stringify(MAX_VFS)'.
>
> I think it's better to pair with the one above.
> We don't want to print the the default is ~0 in the other case so we
> create a manual _STR.

I meant:

    #define DEFAULT_MAX_VFS            ~0
    #define DEFAULT_MAX_VFS_STR        "unlimited"
    #else
    #define DEFAULT_MAX_VFS            0
    #define DEFAULT_MAX_VFS_STR        __stringify(DEFAULT_MAX_VFS)


John.

>
>
>>
>>>  #endif
>>> +#define DEFAULT_PROBE_DISPLAY        true
>>> +#define DEFAULT_FORCE_PROBE        CONFIG_DRM_XE_FORCE_PROBE
>>> +#define DEFAULT_WEDGED_MODE        1
>>> +#define DEFAULT_SVM_NOTIFIER_SIZE    512
>>> +
>>>  struct xe_modparam xe_modparam = {
>>> -    .probe_display = true,
>>> -    .guc_log_level = DEFAULT_GUC_LOG_LEVEL,
>>> -    .force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>>> -#ifdef CONFIG_PCI_IOV
>> This ifdef is lost from the new version?
>
> yeah, dropped it by mistake... will need to add it back.
>>
>>> -    .max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>>> -#endif
>>> -    .wedged_mode = 1,
>>> -    .svm_notifier_size = 512,
>>> +    .probe_display =    DEFAULT_PROBE_DISPLAY,
>>> +    .guc_log_level =    DEFAULT_GUC_LOG_LEVEL,
>>> +    .force_probe =        DEFAULT_FORCE_PROBE,
>>> +    .max_vfs =        DEFAULT_MAX_VFS,
>>> +    .wedged_mode =        DEFAULT_WEDGED_MODE,
>>> +    .svm_notifier_size =    DEFAULT_SVM_NOTIFIER_SIZE,
>>>      /* the rest are 0 by default */
>>>  };
>>>  module_param_named(svm_notifier_size, 
>>> xe_modparam.svm_notifier_size, uint, 0600);
>>> -MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in 
>>> MiB), must be power of 2");
>>> +MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in 
>>> MiB, must be power of 2 "
>>> +         "[default=" __stringify(DEFAULT_SVM_NOTIFIER_SIZE) "]");
>>>  module_param_named_unsafe(force_execlist, 
>>> xe_modparam.force_execlist, bool, 0444);
>>>  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>>>  module_param_named(probe_display, xe_modparam.probe_display, bool, 
>>> 0444);
>>> -MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's 
>>> left untouched (default: true)");
>>> +MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's 
>>> left untouched "
>>> +         "[default=" __stringify(DEFAULT_PROBE_DISPLAY) "])");
>>>  module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, 
>>> int, 0600);
>>> -MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - 
>>> <0=disable-resize, 0=max-needed-size[default], >0=force-size");
>>> +MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB 
>>> (<0=disable-resize, 0=max-needed-size, >0=force-size [default=0])");
>> Why leave this one as hard coded value rather than a define?
>
> there wasn't an assignment xe_modparam, so I overlooked it. I will fix
> those up in next rev
>
> thanks
> Lucas De Marchi
>
>
>>
>> John.
>>
>>>  module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 
>>> 0600);
>>>  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level 
>>> (0=disable, 1=normal, 2..5=verbose-levels "
>>> @@ -66,18 +75,21 @@ MODULE_PARM_DESC(gsc_firmware_path,
>>>  module_param_named_unsafe(force_probe, xe_modparam.force_probe, 
>>> charp, 0400);
>>>  MODULE_PARM_DESC(force_probe,
>>> -         "Force probe options for specified devices. See 
>>> CONFIG_DRM_XE_FORCE_PROBE for details.");
>>> +         "Force probe options for specified devices. See 
>>> CONFIG_DRM_XE_FORCE_PROBE for details "
>>> +         "[default=" DEFAULT_FORCE_PROBE "])");
>>>  #ifdef CONFIG_PCI_IOV
>>>  module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
>>>  MODULE_PARM_DESC(max_vfs,
>>>           "Limit number of Virtual Functions (VFs) that could be 
>>> managed. "
>>> -         "(0 = no VFs [default]; N = allow up to N VFs)");
>>> +         "(0=no VFs; N=allow up to N VFs "
>>> +         "[default=" DEFAULT_MAX_VFS_STR "])");
>>>  #endif
>>>  module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, 
>>> int, 0600);
>>>  MODULE_PARM_DESC(wedged_mode,
>>> -         "Module's default policy for the wedged mode - 0=never, 
>>> 1=upon-critical-errors[default], 2=upon-any-hang");
>>> +         "Module's default policy for the wedged mode (0=never, 
>>> 1=upon-critical-errors, 2=upon-any-hang "
>>> +         "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
>>>  static int xe_check_nomodeset(void)
>>>  {
>>>
>>

--------------ZfMV2t5Bfxo6dToHlru63fLR
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 6/16/2025 11:52 AM, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:jfkgpylqiujyudvqr4ivn3653arznibeofzqrdyhiy4fv3tgsk@tjf4hde4izg3">On
      Mon, Jun 16, 2025 at 11:46:57AM -0700, John Harrison wrote:
      <br>
      <blockquote type="cite">On 6/13/2025 1:00 PM, Lucas De Marchi
        wrote:
        <br>
        <blockquote type="cite">Document xe module params with the
          default values following a similar
          <br>
          strategy for all of them:
          <br>
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;1) Define a DEFAULT_* macro with the default value. When
          the
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value can't be directly stringified, also define a
          *_STR
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; variant
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;2) Use __stringify() or the _STR variant to make sure the
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default value shows up in the param description
          <br>
          <br>
          This allows us to show the correct default according to the
          <br>
          configuration. max_vfs for example was wrongly documented for
          <br>
          CONFIG_DRM_XE_DEBUG and svm_notifier_size didn't have its
          default
          <br>
          documented.
          <br>
          <br>
          Signed-off-by: Lucas De Marchi
          <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
          <br>
          ---
          <br>
          &nbsp;drivers/gpu/drm/xe/xe_module.c | 44
          +++++++++++++++++++++++++++---------------
          <br>
          &nbsp;1 file changed, 28 insertions(+), 16 deletions(-)
          <br>
          <br>
          diff --git a/drivers/gpu/drm/xe/xe_module.c
          b/drivers/gpu/drm/xe/xe_module.c
          <br>
          index 192908fa074cb..2068c579d5c3b 100644
          <br>
          --- a/drivers/gpu/drm/xe/xe_module.c
          <br>
          +++ b/drivers/gpu/drm/xe/xe_module.c
          <br>
          @@ -19,34 +19,43 @@
          <br>
          &nbsp;#include &quot;xe_sched_job.h&quot;
          <br>
          &nbsp;#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
          <br>
          -#define DEFAULT_GUC_LOG_LEVEL&nbsp;&nbsp;&nbsp; 3
          <br>
          +#define DEFAULT_GUC_LOG_LEVEL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3
          <br>
          +#define DEFAULT_MAX_VFS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ~0
          <br>
          +#define DEFAULT_MAX_VFS_STR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;unlimited&quot;
          <br>
          &nbsp;#else
          <br>
          -#define DEFAULT_GUC_LOG_LEVEL&nbsp;&nbsp;&nbsp; 1
          <br>
          +#define DEFAULT_GUC_LOG_LEVEL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1
          <br>
          +#define DEFAULT_MAX_VFS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0
          <br>
          +#define DEFAULT_MAX_VFS_STR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0&quot;
          <br>
        </blockquote>
        Could be 'stringify(MAX_VFS)'.
        <br>
      </blockquote>
      <br>
      I think it's better to pair with the one above.
      <br>
      We don't want to print the the default is ~0 in the other case so
      we
      <br>
      create a manual _STR.
      <br>
    </blockquote>
    <br>
    I meant:<br>
    <blockquote>#define DEFAULT_MAX_VFS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ~0<br>
      #define DEFAULT_MAX_VFS_STR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;unlimited&quot;<br>
      #else<br>
      #define DEFAULT_MAX_VFS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
      #define DEFAULT_MAX_VFS_STR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __stringify(DEFAULT_MAX_VFS)<br>
    </blockquote>
    <br>
    John.<br>
    <br>
    <blockquote type="cite" cite="mid:jfkgpylqiujyudvqr4ivn3653arznibeofzqrdyhiy4fv3tgsk@tjf4hde4izg3">
      <br>
      <br>
      <blockquote type="cite">
        <br>
        <blockquote type="cite">&nbsp;#endif
          <br>
          +#define DEFAULT_PROBE_DISPLAY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; true
          <br>
          +#define DEFAULT_FORCE_PROBE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CONFIG_DRM_XE_FORCE_PROBE
          <br>
          +#define DEFAULT_WEDGED_MODE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1
          <br>
          +#define DEFAULT_SVM_NOTIFIER_SIZE&nbsp;&nbsp;&nbsp; 512
          <br>
          +
          <br>
          &nbsp;struct xe_modparam xe_modparam = {
          <br>
          -&nbsp;&nbsp;&nbsp; .probe_display = true,
          <br>
          -&nbsp;&nbsp;&nbsp; .guc_log_level = DEFAULT_GUC_LOG_LEVEL,
          <br>
          -&nbsp;&nbsp;&nbsp; .force_probe = CONFIG_DRM_XE_FORCE_PROBE,
          <br>
          -#ifdef CONFIG_PCI_IOV
          <br>
        </blockquote>
        This ifdef is lost from the new version?
        <br>
      </blockquote>
      <br>
      yeah, dropped it by mistake... will need to add it back.
      <br>
      <blockquote type="cite">
        <br>
        <blockquote type="cite">-&nbsp;&nbsp;&nbsp; .max_vfs =
          IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
          <br>
          -#endif
          <br>
          -&nbsp;&nbsp;&nbsp; .wedged_mode = 1,
          <br>
          -&nbsp;&nbsp;&nbsp; .svm_notifier_size = 512,
          <br>
          +&nbsp;&nbsp;&nbsp; .probe_display =&nbsp;&nbsp;&nbsp; DEFAULT_PROBE_DISPLAY,
          <br>
          +&nbsp;&nbsp;&nbsp; .guc_log_level =&nbsp;&nbsp;&nbsp; DEFAULT_GUC_LOG_LEVEL,
          <br>
          +&nbsp;&nbsp;&nbsp; .force_probe =&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEFAULT_FORCE_PROBE,
          <br>
          +&nbsp;&nbsp;&nbsp; .max_vfs =&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEFAULT_MAX_VFS,
          <br>
          +&nbsp;&nbsp;&nbsp; .wedged_mode =&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEFAULT_WEDGED_MODE,
          <br>
          +&nbsp;&nbsp;&nbsp; .svm_notifier_size =&nbsp;&nbsp;&nbsp; DEFAULT_SVM_NOTIFIER_SIZE,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp; /* the rest are 0 by default */
          <br>
          &nbsp;};
          <br>
          &nbsp;module_param_named(svm_notifier_size,
          xe_modparam.svm_notifier_size, uint, 0600);
          <br>
          -MODULE_PARM_DESC(svm_notifier_size, &quot;Set the svm notifier
          size(in MiB), must be power of 2&quot;);
          <br>
          +MODULE_PARM_DESC(svm_notifier_size, &quot;Set the svm notifier
          size in MiB, must be power of 2 &quot;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;[default=&quot; __stringify(DEFAULT_SVM_NOTIFIER_SIZE)
          &quot;]&quot;);
          <br>
          &nbsp;module_param_named_unsafe(force_execlist,
          xe_modparam.force_execlist, bool, 0444);
          <br>
          &nbsp;MODULE_PARM_DESC(force_execlist, &quot;Force Execlist
          submission&quot;);
          <br>
          &nbsp;module_param_named(probe_display, xe_modparam.probe_display,
          bool, 0444);
          <br>
          -MODULE_PARM_DESC(probe_display, &quot;Probe display HW, otherwise
          it's left untouched (default: true)&quot;);
          <br>
          +MODULE_PARM_DESC(probe_display, &quot;Probe display HW, otherwise
          it's left untouched &quot;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;[default=&quot; __stringify(DEFAULT_PROBE_DISPLAY)
          &quot;])&quot;);
          <br>
          &nbsp;module_param_named(vram_bar_size,
          xe_modparam.force_vram_bar_size, int, 0600);
          <br>
          -MODULE_PARM_DESC(vram_bar_size, &quot;Set the vram bar size (in
          MiB) - &lt;0=disable-resize, 0=max-needed-size[default],
          &gt;0=force-size&quot;);
          <br>
          +MODULE_PARM_DESC(vram_bar_size, &quot;Set the vram bar size in MiB
          (&lt;0=disable-resize, 0=max-needed-size, &gt;0=force-size
          [default=0])&quot;);
          <br>
        </blockquote>
        Why leave this one as hard coded value rather than a define?
        <br>
      </blockquote>
      <br>
      there wasn't an assignment xe_modparam, so I overlooked it. I will
      fix
      <br>
      those up in next rev
      <br>
      <br>
      thanks
      <br>
      Lucas De Marchi
      <br>
      <br>
      <br>
      <blockquote type="cite">
        <br>
        John.
        <br>
        <br>
        <blockquote type="cite">&nbsp;module_param_named(guc_log_level,
          xe_modparam.guc_log_level, int, 0600);
          <br>
          &nbsp;MODULE_PARM_DESC(guc_log_level, &quot;GuC firmware logging level
          (0=disable, 1=normal, 2..5=verbose-levels &quot;
          <br>
          @@ -66,18 +75,21 @@ MODULE_PARM_DESC(gsc_firmware_path,
          <br>
          &nbsp;module_param_named_unsafe(force_probe,
          xe_modparam.force_probe, charp, 0400);
          <br>
          &nbsp;MODULE_PARM_DESC(force_probe,
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Force probe options for specified devices. See
          CONFIG_DRM_XE_FORCE_PROBE for details.&quot;);
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Force probe options for specified devices. See
          CONFIG_DRM_XE_FORCE_PROBE for details &quot;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;[default=&quot; DEFAULT_FORCE_PROBE &quot;])&quot;);
          <br>
          &nbsp;#ifdef CONFIG_PCI_IOV
          <br>
          &nbsp;module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
          <br>
          &nbsp;MODULE_PARM_DESC(max_vfs,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Limit number of Virtual Functions (VFs) that could
          be managed. &quot;
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;(0 = no VFs [default]; N = allow up to N VFs)&quot;);
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;(0=no VFs; N=allow up to N VFs &quot;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;[default=&quot; DEFAULT_MAX_VFS_STR &quot;])&quot;);
          <br>
          &nbsp;#endif
          <br>
          &nbsp;module_param_named_unsafe(wedged_mode,
          xe_modparam.wedged_mode, int, 0600);
          <br>
          &nbsp;MODULE_PARM_DESC(wedged_mode,
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Module's default policy for the wedged mode -
          0=never, 1=upon-critical-errors[default], 2=upon-any-hang&quot;);
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Module's default policy for the wedged mode
          (0=never, 1=upon-critical-errors, 2=upon-any-hang &quot;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;[default=&quot; __stringify(DEFAULT_WEDGED_MODE) &quot;])&quot;);
          <br>
          &nbsp;static int xe_check_nomodeset(void)
          <br>
          &nbsp;{
          <br>
          <br>
        </blockquote>
        <br>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------ZfMV2t5Bfxo6dToHlru63fLR--
