Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C7BC27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 12:12:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D92E10EC1F;
	Fri,  7 Jun 2024 12:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHZBObMF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E830A10EC1F
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 12:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717762321; x=1749298321;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RkZHKMG+kM2C8eNUoMl9vdSEVDusFZVmyFNp/OxlDWg=;
 b=MHZBObMFUs/cE5E5kzEf1cmtGdyjo/LtaZkM9dvLhrbQxFlBnyUwL0Wr
 2/Qr0cbtfE7jWLifP33TvSJcgUezW+u3HgQ5MNGARQllcvd3p8praKJIW
 yGKwztEqrfSUVguia829WAv9seD8Cc+BkBHwvg1/hq44YNGWzp2hmOp6R
 k+UgI7qbCv/Q1aDzTvbM1ttjjpiVAK0K9YfXBbzjahY6oACSh/sq3/yKU
 Y71R4aXJbZ+9gsMphUWtzlRu1e/6H2aqTMPbgwDgq55EYv0F5XvIk3pzO
 ny2dG4A97VuYBErPP8jJs0B6xDdgFnOsp6x0z3ykLcukJEjSJ6fCgfRAR A==;
X-CSE-ConnectionGUID: Of9zQi6wRSu9QZ9KhcxmFw==
X-CSE-MsgGUID: jFZxMwSzTPufvadapmzWgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18307008"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="18307008"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:12:00 -0700
X-CSE-ConnectionGUID: fJ9zoqhbTHG/YhWIuh6uRw==
X-CSE-MsgGUID: Kln0d2dCR3em207l9G7ZTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="42721679"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 05:12:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 05:12:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 05:12:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 05:11:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNTRjmHt9qRsAO04rQ5wmTE6CceAW8X36slRmZNF5h1pd3WKjXxo1tk41OOXG0eCsddMxgLy4WfcHa2YbKhb8hTeWbGn3Bc5NN3dVnGJExQZbglFjFTinFAdvmqsftGe6u/fYstXpP/5S3XFKBW9SmjNE2EfPwTw/z43hDa+tDcQdEv4ojhlIE1KfbDG+KSf/0SYOm8OIKsAaOY4XMQn/Gf1TBZ12MoWpAaLHnE/tjAzGNxq/A9JesdRZwunKkeqcBohch8fApskPRE3FZ/bla5kRgA1v49X/yStQVxoqw2tNmywBufpK6nIkLH+JYmf0EReaIL3gYOuTmiV6aG2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuLJonTHEqmaK6JprmxLtMWxGJBWLG2YtIsNrr+26go=;
 b=E+iDjpbMJ7dRQ6QLCreF3tPlIJBvAJCG2XPZ2NwnjMHdCaYX2+Qg5VbYcJGuaFXWjj7ZNitCs63fYXJQIJ33WaxZf5oaKW41NYA4tZt6D8rTgZuGhF3YJ/CPZWvxjQIRcoJJltSQp32GlYf1nypuJZPrFdnt6mc8fErlWp2Cwhj3+V/6w4dgxjWfI6kjgWXz3empbo4xhMUBHANu+n2bq+N2EiRuyiXXL67RagRVjWoERB4QgvYgQNkMo916y7DGWppXFCvTVrdmQ+ScTuP4ZBnv9lKLah76z9osWiM3N0evozoa8tnj4SnO+iuH0j7aqiiVliVjavtgs50Fx8Apjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB6746.namprd11.prod.outlook.com (2603:10b6:510:1b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 12:11:58 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 12:11:57 +0000
Message-ID: <04bb0a0e-ceea-4fca-89b7-4db24123ba8e@intel.com>
Date: Fri, 7 Jun 2024 17:41:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Ensure caller uses sole domain for
 xe_force_wake_assert_held
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
References: <20240607052213.1391082-1-himal.prasad.ghimiray@intel.com>
 <20240607052213.1391082-2-himal.prasad.ghimiray@intel.com>
 <39637904-5d38-4f91-b528-9c235c2b8782@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <39637904-5d38-4f91-b528-9c235c2b8782@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c5d77d2-b9c7-4332-3f8e-08dc86eb073a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MW5aUGVKOVBOQVd4VkYwNlFmQjJWbnNkcVZmQ2ZxS05EVjlxeUE4NzE3Y0da?=
 =?utf-8?B?K2hhR1Vzdlhsait4eUo0TC91bnJ0NGpGR3NHM1MraHNlRmswSXJjWTlkMVox?=
 =?utf-8?B?YkgxSlFOYXJpNTA1Sm8wVVl3S1Jhc3J1d0N4a1d2ZElhVXZtSnZxZkVVSkNU?=
 =?utf-8?B?R3orcG84L1ZNQkZ3UjBBRFVvdG01K3FXWmFrL093Y0lkRzhwTEFRMytEdGd3?=
 =?utf-8?B?VkNvd3FzN3MrejlTUHozVHVjcXVKYmE3Q3JTSEtmYnc2ZkM2RmgwaWpuK0Vp?=
 =?utf-8?B?TEcvWE02UnZ4cnFoNk16bFRSM3lwSlpQOFo0aDdhMC8wOXhGSFVyd2Q1TkV1?=
 =?utf-8?B?MkJ6K0NCVklVUkNjLzF3OTRYU3VSYlV4M0ZKTGgyK0tZL3FyekYvZ29KZjR5?=
 =?utf-8?B?MU9WRnZxMWk2ZUVMdWNQRXV4UVFucHdrUUtsbW5ZUmNrRTVGZEhxOTE3ZUsz?=
 =?utf-8?B?VGNTNDl1ZklaSDIzL0VEaCsvVGFFS3NiYlpVT2gzNVAralNzeVpQVTEyU3gv?=
 =?utf-8?B?U0grYkQ1Ri8wYnlVRnYrSlBIL2pNSDFyTFFxQ0c5MnQyV0dubGpVMzZia1dV?=
 =?utf-8?B?TWEzdEJZcDJ3UjdEdkZqV2c5NlNURENreXkwNk84YU5jQ2VITmVoYkV3YWF1?=
 =?utf-8?B?cG5QcVo5Uy9xUXpzMmMrTUhsYW9QblZBc0I1RG1iWlh3ZElJUUtaY0JIbzBH?=
 =?utf-8?B?OXBzdE5NVEx4NDhRaHZuU0U4Y3kyZDNOV2hXTS9DeDB6WHdhS1E4NXRiUkFT?=
 =?utf-8?B?QjRuajNwWEJvV2lrZVBkZ2hkd0R3Y0s4YWNZekRZVmtDTWhpMVBsQWp3UzVY?=
 =?utf-8?B?YjNzMXJWRkhxVWRKczFvRUtEMi9XaWM3ZXJPaGRaUUdtRlRlTDNGMnpSZ2NR?=
 =?utf-8?B?bC81RHFwc2Z5U2pSMXJybTh3U2Rub1RheDF6TXVRWS9JQWd3MHdCck52RDRB?=
 =?utf-8?B?S3RTS3hMODVkT05DdHRoSXBPQUNBTkc3R2pMZXpMU1p4YWpvSHpBWjAyRnZj?=
 =?utf-8?B?RnU0NzVQT1hiNEdKUC9zS0tmOUVHQ01rNFpuY2FpZmRwSGpLa2pNSlRzME0r?=
 =?utf-8?B?L3FTcXUzSlJqMHZvV3ZGSHJsOFh4blg2cXRma3h0WWxEOGdKYTJhUjRaT05O?=
 =?utf-8?B?Ym5ibnhkRTc2dkJDaHl3OHZXY05CREV6OC9Zam1QN2NzODM5QXFINUtRbFJL?=
 =?utf-8?B?TVRDd041N1pnVEhqeDhrVmdMWmdHWTJWZXYvNTVrc1JGMllnekVxeDFoZE10?=
 =?utf-8?B?WDZPRDFLaE5wRmxZWGZ6cWVhQzVraURXcjlwYngxenhudjVJQ1dQMXVleEV2?=
 =?utf-8?B?dFFWWjc2bFhoajFhSlVLaVZONjREOVpUOWpBOWN4M2JBckxMNHUxNzFaMHhi?=
 =?utf-8?B?NEZOcnRPeXBtczl3OFpOY1NHVUNpQ0N5elNZSnUveUU5WmFNNnRwQ0VyMTR3?=
 =?utf-8?B?M2tURmhINVh5SjZKV25aeXlISE8yaHZSMFozMGxMamExY2RRV3RIOUhlT0RV?=
 =?utf-8?B?U2cvZWtKNFQ5dk9jNHpMMDNxS3crMHEyaTY4ZVFSeXZjVGViVEc1U3BGdms4?=
 =?utf-8?B?MXNsamlwNys3cy9paGpoU3Y5Tmx6UzhjMGoreWkrOWVaUnFnQ1BKZGNqbFBu?=
 =?utf-8?B?NjQ4Ump0c3JCODN1RFVVVTMyOURtd3BjSnU2YzNwVG5Tc09rcklYbFB0T2Jt?=
 =?utf-8?B?dHZFd0ZsZGQwNHVvMVhKVXEyNHF4VXVEdzZMSkd1Z1F1RmV6MkNuNWJBcFEr?=
 =?utf-8?Q?WxJUeWq/x8FBgA8nx0sUeBSzHhdRMSNrAepyjMp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWtpRXVoYnpvZ1FPRXJTT1hkNjBESE9xZG1tVUdpemM1V2Z4eFJ1TWs3dHNC?=
 =?utf-8?B?Q24wRUppTFhNdkg2UGg2Q3llN3NnQWVnRnNIWW5Bc1hSNVZFazQ4bERHdDl1?=
 =?utf-8?B?VnZQeVV3QmZPd3RUR202cXVOUzY1eEtCNUw5NUZNU1EzWU1PeVMrZ2NYb2xo?=
 =?utf-8?B?SkVEOGhVcG9XMVFHWmZWSHFsOHkrSjhLeEZ3eWRiY1Uyd1dMalZkaVhiVFFM?=
 =?utf-8?B?U0Rsakx3RkxlbGgwZFNFRVRXbkdtYUVLTUNXZkJxWkNZYlVrT2JDKytyakRp?=
 =?utf-8?B?ZmxuVnNyTXNkUGJBRWdWZzgvWmtrbS9Fb2U4OHB6VXQ2eTBaV0poaE9BN0gy?=
 =?utf-8?B?SE5jL1B3VlpWZWI5QWtZbGxKWEZUOVRvYUFmaklUdkhEZW5HNUlvZnJ5QlVm?=
 =?utf-8?B?SmJJMGtSYlVQY0dFczIvL3k2NTZUcG1CQUZYaUpHT3Z2OFlVREJzR2R4M1Vl?=
 =?utf-8?B?dzk3ZWR0WVlUQnJtK1FoeHQrQnNBMmZXWWtNNnpBclA0Yi9DRW4xWU9kYVky?=
 =?utf-8?B?Y2FZTGtiQ2Z4QTJLUE96TGRNOEpuanR5UW1iRUszVVFPRlVEak95TWxuNGg4?=
 =?utf-8?B?Q2lKcjFJaHltVFp2a2Vib3hhVEUzUkNaQjhib2I1UlFCbjhRN1pmNWpLMjlo?=
 =?utf-8?B?MTBKK21mRWh0cG5sc20rMVJHMFhhbmVrMTdmdkR5QVEzL3pUYUI5NlQrZ0lX?=
 =?utf-8?B?d2Z4NzBLME9RTHVHM3NncXNIZDc0S3U0Zk9wU2IvUDZOaHNDRVdYNmM2TnZW?=
 =?utf-8?B?WUJSejlxeUQwZ0d3enJYUkVPOFNZWmdjQ2NMcnppZmhUaURUcHlHR1VHMmM5?=
 =?utf-8?B?VXdOU0tyVDdxUG1lYllVTk9oUFlUTklSUmZXdytPdklLTEwvd0JzYUhqV2sw?=
 =?utf-8?B?ZFpWQUg2cVREZDE4OFVPME5LWGJZcDlRc2JGRlZOVnFwQlJMMVl2ZklxZDBq?=
 =?utf-8?B?eW5yd3M2eU9BWjB5UVlVOUdLTmZOa0lkcjdUUkowd0FyRjlvbGsyOUFQSlZy?=
 =?utf-8?B?QXhlU0pjVnIzS216Q1F4M2crR0NlVm1POU1DcTZBUUp4TlQ1ODMxM3RvSEd0?=
 =?utf-8?B?SE1LR2FzTDYxMWZyVG44bE1uM1JHakVBK2VMWXJtR1B4aDdpNWYyRnBXeHA1?=
 =?utf-8?B?czdGZkVjbzBQMFpHZGZBMGQvbmdmM0RzalJvSms5Mk1kNTVHNGNKeDdEMTNl?=
 =?utf-8?B?THN0cTEvdnl0NDk5UTdQUVhaRGZ4Z09sVG1oQjJ4dGd6TzlMd3JSRElxRWdw?=
 =?utf-8?B?TzBOcWMybHN5RnhjWGE5d2lLWUxvVEtmVzkwNTZEL0l1cm0wV3Axa3czS3Ba?=
 =?utf-8?B?TC8yZVNCbzl0UDFXU21rMWtKZ3VEYXdMYnNLTElieTYwakhoUFFDMXpMNTFJ?=
 =?utf-8?B?MTN1Qy9iMG50K3dCREZFVWRzOE5jN0NZMXg3ZTNiM2ZsZURweENHNHBZUlE3?=
 =?utf-8?B?cEhUeEJyZzFUdWxVRldPeXRuY2pXT1JJS2lVNTJyZ1RDNXpkMTFnMWE3YTU0?=
 =?utf-8?B?a3VwMWRFMlE1VXpPN2hlZFBCN3M5YnQvMmNqV3duODBJL2QyMU4xNkRzbk9V?=
 =?utf-8?B?NE1ydjVIRFFYMjM1cmNERkJsZkRPTUhhQ3VEa0pMS1A5NFAwMjNpRHJGVU0v?=
 =?utf-8?B?aXF2bEFjc0VReVJYWld2NTdHQittOWE1dkk3NkdwMkNONSs0RG1TZm4yMTha?=
 =?utf-8?B?Rkx3ajMzbWg3dzFXQ0pObTJYOEQyVEswNFAvc1JBb1dEUW9mNDNxOEpRZFp0?=
 =?utf-8?B?dlo5RkZkK00xM3BrYVdvdGxVUGpSSGQ2YWFWVENrcEI0TWt2Zno1c0lReG5M?=
 =?utf-8?B?Q3NqZG9zOHg5NFREL1pXVVhwVEEyWjZSSHRZZk0xbDJZM0haOG5LZGJZRXJh?=
 =?utf-8?B?TzhKa1QrQmNXclVPMUFOZjBrdk51U0NjNUtPcVJsd1k1UDlBL0lINmpxQlhO?=
 =?utf-8?B?SEFnQXFnTktQV3AzalI1WGlmZDB1QkREVCtnZXQ2L3JuekIvZ1FWS1JPaStU?=
 =?utf-8?B?cTNzTXc1OXlJSC94VnNsUEhpakpiRVgzNUdlTDh1N2hPZEs3ZHZjNFdYQzFC?=
 =?utf-8?B?QkM0aFI0SVdPRHp6aDlGQ1I2UGVMa2hvbU1DS1JaeEFPSTc5ckJmQTNlZ3ZB?=
 =?utf-8?B?d3cvNGhUQ1J3M3N5bGh5aDV0Y24xaHJ4MVp0SjFtN0MyMWVWOE05T0k1Z3VE?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5d77d2-b9c7-4332-3f8e-08dc86eb073a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 12:11:57.9206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1My/l8yYKziJtctbXKILntiGq8DUndtED1VNkmTP6L5fTmSvbWWXjfLVC6nD0Ggjjn197JKmcjkbcaTtan7wuYMXHpNkp/5cWGnRsZY1a4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6746
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



On 07-06-2024 16:53, Michal Wajdeczko wrote:
> 
> 
> On 07.06.2024 07:22, Himal Prasad Ghimiray wrote:
>> xe_force_wake_assert_held() is designed to confirm a particular
>> forcewake domain's wakefulness; it doesn't verify the wakefulness of
>> multiple domains. Make sure the caller doesn't input multiple
>> domains(XE_FORCEWAKE_ALL) as a parameter.
> 
> maybe we should also copy above commit message as description of the
> below helper ? but still, assert provides some level of guideline, so
Sure.
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Thanks for the review.
> 
>>
>> v2
>> - use domain != XE_FORCEWAKE_ALL (Michal)
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index 83cb157da7cc..651ea1e62c63 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -32,6 +32,7 @@ static inline void
>>   xe_force_wake_assert_held(struct xe_force_wake *fw,
>>   			  enum xe_force_wake_domains domain)
>>   {
>> +	xe_gt_assert(fw->gt, domain != XE_FORCEWAKE_ALL);
>>   	xe_gt_assert(fw->gt, fw->awake_domains & domain);
>>   }
>>   
