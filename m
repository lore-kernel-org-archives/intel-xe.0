Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77A7C7115C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 11:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CFB10E6E6;
	Wed, 25 Jun 2025 11:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0tXWa8N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0435A10E6E6
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 11:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750851701; x=1782387701;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=CuxOKQAHFcrx+/ne1h/1a4f9VGKMdebZOfVwuiTPokU=;
 b=F0tXWa8NMXWc7t4xxtv/42cbj9onahpM8cc+pdFmIyvsiHea6QQxgbr/
 id5stTD5V6NV68FpVMQ9yeXJoHlFuucxuw46GZ5IFq5ddfeJHAJJUAc1r
 JIsNR/9wMngBlFEI+qJe40qJZiUstlxKQ4/H7ikLtUtcepyhCGAZRCOKg
 TcMDgP98xE3t419/vagAbR1y7wP72T3IZFtfXZfc7YKUc2c5x5ihrh4jb
 IUZ8D+KRE96WZBCMW0rICwTgdITsi2G2B5VC65Q6x9vHslSYd9KYS+S+h
 1J2yPy3FqCt+tfKAHTeKKkR07Qxe/d9+oNxhjKsVbTqTu5Nbwto/lHL+s w==;
X-CSE-ConnectionGUID: 8egneKE3STeQyboJgcocQw==
X-CSE-MsgGUID: eYzVRv+dQgOdNAI7nzpJtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64473996"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208,217";a="64473996"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 04:41:41 -0700
X-CSE-ConnectionGUID: YMGW+IBUTteuELaYJa+GSw==
X-CSE-MsgGUID: VpPGJWLESYu9tNcpVazO/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
 d="scan'208,217";a="183229448"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 04:41:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 04:41:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 04:41:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.53)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 04:41:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZlSOOUk/79HnuE679jagtubfOMgMHWetibkQ0vIH5ZnXUK5OhJo3bg4pfDKpI8pf+ykwf3BLdkFCXZgTbdvlSJUp7m+asKQn7RMQFLZFyKlxSvS4nso7tR8xnwg63qlBYGsmMI9BlNIbqE6Oy3kZQTzQpnNfb/S2VSC32k12RZCHr/iHyBmu6VB5jGrihRRMfRapoqwwtelq5yov/6kNlovGPYFGEbf/FI46S4coZ/JF1hRxAyLCIwaiVPDOgjYl2OzLGapzGXnCJ4tRmMids0zy5nNZ5AU1t0AUfU9qgy2lTNkQqtazi/iObczOj46ZNn3D0cyCeCMqg80fvSpXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZ68Rd/gX+nygTy6AwwhhMbfdqTANb05L4KgeFOTKDk=;
 b=cU3ZhTk+0KUGZshQ0W0w8t8DswCJO6nvg2R9ri7El/1fIT3UPk885mcFfmivbYno2q71r164Co5MbV/AswXAjM9wb2ou56Y1Z+ouq9gB1T2s5PL8U82merTkSxU2B3cAxDkAjFXgIDTxFFMIGLHKEamzyLiS8g/xFr/uw86IGmVDJRjPzRbrK+PhmF6oNmWOT/Dr+v2s8na6jBkv1YvGKyo2PuxHsXRN830DrmHV27Y2EwBsWmxKEVNhpaj/kwUG/CCsYUP83w24mS4fqB9e1Eo74I1h3otw3WfrLf1c0qgYbSgkMdoUNHzvbvmoKz2pae9XZlgn93BD65ahNX89Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 DS7PR11MB6222.namprd11.prod.outlook.com (2603:10b6:8:99::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.17; Wed, 25 Jun 2025 11:41:32 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 11:41:32 +0000
Content-Type: multipart/alternative;
 boundary="------------CH0DZXZ3uTe8UFQiMXkQcOFl"
Message-ID: <f8f7f468-7fd2-4b81-9cdd-323d13dfb414@intel.com>
Date: Wed, 25 Jun 2025 17:11:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/xe: Assign GT IDs properly on multi-tile +
 multi-GT platforms
To: <intel-xe@lists.freedesktop.org>
References: <20250617020906.1719276-7-matthew.d.roper@intel.com>
 <20250617020906.1719276-11-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20250617020906.1719276-11-matthew.d.roper@intel.com>
X-ClientProxiedBy: MA1PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::29) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|DS7PR11MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 880bfb17-c1b8-4654-78d0-08ddb3dd3b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OW5FWk1yekR6TG1QMXlnNHBCbVFUd1NiZlZES09QSW1WM0Q5UjRQekUvS2JX?=
 =?utf-8?B?VlpMd2hxeXRLOHF6WGxxQmlsN0RMbm83REdiRHZsZlpFOVliWGsrWSt1aVA1?=
 =?utf-8?B?bUlENnNEZ3pPRW1ZOVdVMTVjSFgzQ1g3ZStrcUNXdnV0SllJb0FHbGU0cnBh?=
 =?utf-8?B?c0hnY1VJNTJRT05XRVNlWWZUYzJxL0dQdkZramkvbjkyZS9sb0FmaGV2cUxR?=
 =?utf-8?B?UmM3Vk5OaHp5NFFvZEcxRXlINUhLMm91NlhZS2RZL3FLVGNuTFlHV3lTTUF4?=
 =?utf-8?B?bjIwQ2lUWmtSN2VJcEJLaHkra3NOeTZlc3kyMHZBaE85Nlk4Y1Jua2ZKaEJ3?=
 =?utf-8?B?MzFCTjBUaCtmWFVqQ3BCRHVHMFN3NzBlUG05YXloOFBGcHo3ZFhDdTFpTTc0?=
 =?utf-8?B?bEgwWGlFbG1ZVlc5UzRhd3BXaFlmNGk3VnVVbVp4Rm8xOXR6UVBtbHg1VWpi?=
 =?utf-8?B?UTVPaEVva1g5Rm5LUGJQMnlOQWtCYitMK2lIOHBXRlliVkl3bDZ3YUcxaG1t?=
 =?utf-8?B?cHhOYWdoalBrRDZPUWdaZFhPaHNjS1Y1Tk5WUDhxbk9ZRVIxaTlsNjV3UWJ2?=
 =?utf-8?B?NitwR1ZUVzExRUVPMktxbXRiYWdDSkZjc3NlNDQ3SjVwUlJWaXY0YkE4VDRj?=
 =?utf-8?B?cXFreUtFRnc4eURRQkpCRW01WVNNZTU1Sm5aRzlqWVFEbkp0Vk9yQkVwWjd3?=
 =?utf-8?B?dE9uWlozQ1VEWmdEOXI2N1lQVFQrdjBndXBYQjRDM3BaOXhQcEo0Y2tDN2I0?=
 =?utf-8?B?TkdZV2JJdHUvTU5wc3B2a2k2b3UzcUFDQzU0MkJlSXIvWmtSUE5MakpNQTVt?=
 =?utf-8?B?bWNNcmh0YkVjNWcrZ2s3cXo5RkJONCtaM1JPZGNtWnJWTUtDZVh2NVkvOXdz?=
 =?utf-8?B?ZnlhaDhmUXcxQXZ3dGNKQXA0ekFVVkxsN0JDeVRLVVovRW1BSnpERmVLZExS?=
 =?utf-8?B?SWljRUJxc042dkpDKzloN0N0cktka21VU1lVdXE3bzZUdWFPMlhVTERlSFFt?=
 =?utf-8?B?dXpzYzYvZTlZcitsb2tNaWp2NEdFK0cxemEzRFo5U25vRERWRGNad0JGMGRK?=
 =?utf-8?B?MTVlSXdqNlBCMWt6d3gvWDhFeWZQV04xenZCeUdVa3N0MDJzWXc0R3Q4UCt1?=
 =?utf-8?B?dWFOd2xEam9NbllxbS9JNUE4RmsxUFBTOE9HWWViczhjajJnYkltOWU2T0Zx?=
 =?utf-8?B?ZThxSkRiNVhNdEJBKzlHZGlMNzVtKzJzeEt2QWVWSHdXTGgvWWZ3YnhadExX?=
 =?utf-8?B?Vk0zTXA2bm1sZmEzMG5Kd3VqTlpNNGJqdW85KzJhdVhESGlnVnArY0M2S25a?=
 =?utf-8?B?a2draGNybUVKYVBEYnFBRDl1YkpJc1RTVHpzTmZsWTlxNFRrT3lqUDh1Snlu?=
 =?utf-8?B?OUhrUk01OWJyMzJMOWpiaVdwOXpGSmQ2WVVrTlRaeDlZbWNyQjhsTTFvQzFO?=
 =?utf-8?B?eW83bE9VMy85QnF4TDJOUmh2UE8zVzBvTEU1NmRjWjJoOUhGd2FWUk0xM0N4?=
 =?utf-8?B?c016aUs2QXZyR3Z2Q1BDeXFXbGVnOEIxRzc3NVMxV2VHRlF1eVhEVW41MXY5?=
 =?utf-8?B?S1NSRU9HeFF3ekpOL3hTaWswYXltcGxZWEFlSWYxVnFGN0JteHNqck90V0sy?=
 =?utf-8?B?SWhveHN5QS93RlBETmdVb2dlTzhZMzU5UnkrM0hNU0YyUGpDeGFIWDV0L0s2?=
 =?utf-8?B?V0F1d3ZMdlZPRXpEWFVnZ0RVUnBieDR3NTdwTjVBTHl2STN1VXBXNXlSakw0?=
 =?utf-8?B?OGRGcXZiY0Z3MzQyNmY0MXBRcklDTExqYnBHTXJ2K0p4ME02QXBDQnN4SWNT?=
 =?utf-8?B?bTM2VXVzU1cwUWJWMUNiN0R5TUcrT1FKaW9hTVg4ak1PRU5wVEUvY0hKTnMv?=
 =?utf-8?B?UHZJQzVQS216NEw3bzNtb2t1UkduTndySkNRaDA4bWNadHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2J4QzZzU3liOGsvZ080OUFneEtEWTE4MTBIRGx2TWdSR2dobHl4eFU4RHRW?=
 =?utf-8?B?SHpiRUJBYVpXRFpJYk1qUmMxTitYVVd3SDVzUHZIMzhjc08zTS9nTUpmSG1a?=
 =?utf-8?B?VUdzZUJKemZydUxhdTZlNUdhRHVsTHlHTmpnUVlHd1RWdE1xM3NuK2FSZkYz?=
 =?utf-8?B?d2Vqd1ZWbjh6YThTSzlDcU4rS1pVc2EwY3dHNnhSa0ZmZ3p3eVg3cnVFNHgx?=
 =?utf-8?B?U1h5dmpLNDlvRGRocUtNcHFGck9PM0pRNHIxRkV1YlhySjB0OWxMMTZ4STJH?=
 =?utf-8?B?K1pySFR0YVVjZWRmY0l0aG93Wkw2R3N5b3llVmlKb09MdzFTUXJRTkV6Q0VY?=
 =?utf-8?B?VmdteW5LV3U1dGkxTENlaVU3cmNUa045UkdJUXZGZDN6WHo5NWVPWXR2ZW9o?=
 =?utf-8?B?QVVSUEs5c0dyMk1mVUc0eEhVVWdJMlBNVGJkMGl2V0tYSU5BNVREVGVHNko3?=
 =?utf-8?B?T2VCTUdjc0wyUXRwZjY5ZFRRb2lmbVUrc1hWRGFPbWRJQnpqTkNzbkRqbTVT?=
 =?utf-8?B?bVZLekFYazQ0Mk9vSXQ2YW5nNjlYdzBvL3RZSkxkeDUxa2E3TXQ1TS83aE1G?=
 =?utf-8?B?MHU0d1RKbFNpQWpWRHJsVlNXL1hUdUhueDFwdjNHSE9CK1drL3FFaVdOY3By?=
 =?utf-8?B?YmFDZDFJUjBJbFpNamF5dUg4ODhFR0FwbHMwYnJtRDhtSlpMUGZEUmRMYzgw?=
 =?utf-8?B?WUVwWkNCRk5jREVEb2FWM2NyVng3VTNNYUV2NTdhSUFYS1FpVkp6MStYMTA3?=
 =?utf-8?B?TVBpc1drNG1qL2hRTmNVMmxxd3RoVGlSVWd0em53OWxmWTBCaEtRMHVYbjZZ?=
 =?utf-8?B?WnNmQWUvdTM3eUs3RkI4S2lhM3QzMEkyREtHSG9lcDRkaGJBWWFqd1ZmcllB?=
 =?utf-8?B?V3VHUVk4S3JRZTI0V2VaWnU5czJ3NThkNnl4WjMxb2VPL3VGckhTV3pwL3Zq?=
 =?utf-8?B?WGZBSzcwcVdlT3ptNTE2bndmZ2VIRlVmRDJMalR6RW8yZVhZYVYySWhBVmZl?=
 =?utf-8?B?UG8rdDY0SS9KejN2T1p3L28rWGRBa2FDM29lOEVQMzBYeG1zNW1laGdtZUxP?=
 =?utf-8?B?aXdQS1BJc0NoWXZQbUhWRzkzZmIyWjVWb0RvcGpjK2NrVjJKV2syVUNTVG5n?=
 =?utf-8?B?Q2JKQTFIaGJnUkp3dDljWHdIbldNVmRkU2JNVDhuRnRmbmljS3F1c0NEN3Jj?=
 =?utf-8?B?YWI2bExSNEFLTGFvWGd4eTYwdVNoM2hMaVIzQXdYWnRKK0cvS1NhOGZ1M0FI?=
 =?utf-8?B?eUNTZVE4SDc0YUc2aUJGZWRWdmJXaXdMSGk4NzQyb2I2L0F0Y2JXM01RWmE3?=
 =?utf-8?B?cStSaUhuUnZKb1hnNUgxaDAwd1BSSnV5L2lMMWJycmRzOXFCSktQcWVETnQr?=
 =?utf-8?B?Q0FJNFA2SXMvN2twa2ZRVTE5MEpZWURqOWNzQW1JV1lmL2hpV25IWGc3M3pD?=
 =?utf-8?B?aFk0bkYzZkpMNmRMRmJVUlZ5WitTd2w0UnJrc0lFWVlTcDg4NmVlVDBmRVJD?=
 =?utf-8?B?QWwwT1FVZWJwWnFNQnM3bG9rOEZCQWF2YnN5K05XNzNGdDBUNWc3Rks5WWN4?=
 =?utf-8?B?UitGMjcrOHptdWhGZ3RPSVoxbWRKMWpVRXk5U2FXY2JUbTByR3NaN2ZuRHB6?=
 =?utf-8?B?YkhPLzladks2eWZTVTJkclI1SFdSOUZQRE9jVldSV2pLN0hIbTRpblZVN1oz?=
 =?utf-8?B?ZmhYK3dSZnRDRGxKZEVJdUJId0I5QWltNS9GOWFkakJqME5xTUNDa25OOXpx?=
 =?utf-8?B?MkRiV3UzbjRHM0s0eVFBOWl4VTJDN0NVSTlDNVlOVlhodWJVUVpkblFsamNw?=
 =?utf-8?B?U2lPUkxYMFR1amJSMWE1WWFxQmc1VDhlamhFN0pBcGRqS1VXT1pBb0VDV2Zp?=
 =?utf-8?B?L3E3anY0bVdTbnJ1eE1KMW1VWFdBM2JyODhZZzhyTjVjWE9ySzZFdjZJYTFr?=
 =?utf-8?B?TStmZkpmQ3Rud2NJUmFPcnVCcXRkTEZpN3BPcTkrR3ljd05yTmhsaHJDcXc4?=
 =?utf-8?B?Z3JoL0FaRWQyeHR0ekRXdFJxVHdNTWxrYkRKZmVIUjkxTTdacE9qNmMvaHEx?=
 =?utf-8?B?Z2hTUm9Ca05yQi95clB5Q0phU2VoQzhaR0R0VFAxbCs0Q1ViRGovRUNlZFpF?=
 =?utf-8?B?Ui9mWm1OMXdZeTYrTXBKRnA2ZlJ5b2UyV1VQU3FsV2s0ZzJFdVdmZHdKN2w3?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 880bfb17-c1b8-4654-78d0-08ddb3dd3b95
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 11:41:32.8320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZy46M5Le08l0Xnfc8e6xIt4vGxr+jZkYeNRGS5jKPeMhpYI5ijvvqBxv9KktCfV5NvdNoqyt1gwuWCs/5F7pqI9WcpP21Y9MeeG28MfAS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6222
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

--------------CH0DZXZ3uTe8UFQiMXkQcOFl
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 6/17/2025 7:39 AM, Matt Roper wrote:
> Although "multi-tile" and "multiple GTs per tile" are mutually-exclusive
> characteristics on all of our platforms today, this may not always be
> true.  Assign GT IDs according to xe->info.max_gt_per_tile in a way that
> should work even if future platforms have different configurations.
>
> This patch should not change the behavior of current platforms; it only
> future-proofs for potential future designs.
>
> Signed-off-by: Matt Roper<matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio.c |  8 --------
>   drivers/gpu/drm/xe/xe_pci.c  | 14 ++++----------
>   2 files changed, 4 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7357458bc0d2..b65d888ee8e4 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -82,14 +82,6 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>   			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
>   				 xe->info.tile_count, tile_count);
>   			xe->info.tile_count = tile_count;
> -
> -			/*
> -			 * FIXME: Needs some work for standalone media, but
> -			 * should be impossible with multi-tile for now:
> -			 * multi-tile platform with standalone media doesn't
> -			 * exist
> -			 */
> -			xe->info.gt_count = xe->info.tile_count;
>   		}
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a4885f64c2c4..b29252abbf3e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -687,10 +687,11 @@ static int xe_info_init(struct xe_device *xe,
>   	 */
>   	for_each_tile(tile, xe, id) {
>   		gt = tile->primary_gt;
> -		gt->info.id = xe->info.gt_count++;
>   		gt->info.type = XE_GT_TYPE_MAIN;
> +		gt->info.id = tile->id * xe->info.max_gt_per_tile;
why gt->info.id is equal to tile->id * xe->info.max_gt_per_tile then the 
resultant number exceeds max_gt_per_tile , i dont know whether we can 
assign gt->info.id as equal to tile->id
>   		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
>   		gt->info.engine_mask = graphics_desc->hw_engine_mask;
> +		xe->info.gt_count++;
>   
>   		if (MEDIA_VER(xe) < 13 && media_desc)
>   			gt->info.engine_mask |= media_desc->hw_engine_mask;
> @@ -708,17 +709,10 @@ static int xe_info_init(struct xe_device *xe,
>   
>   		gt = tile->media_gt;
>   		gt->info.type = XE_GT_TYPE_MEDIA;
> +		gt->info.id = tile->id * xe->info.max_gt_per_tile + 1;
>   		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
>   		gt->info.engine_mask = media_desc->hw_engine_mask;
> -
> -		/*
> -		 * FIXME: At the moment multi-tile and standalone media are
> -		 * mutually exclusive on current platforms.  We'll need to
> -		 * come up with a better way to number GTs if we ever wind
> -		 * up with platforms that support both together.
> -		 */
> -		drm_WARN_ON(&xe->drm, id != 0);
> -		gt->info.id = xe->info.gt_count++;
> +		xe->info.gt_count++;
>   	}
>   
>   	return 0;

--------------CH0DZXZ3uTe8UFQiMXkQcOFl
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/17/2025 7:39 AM, Matt Roper wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250617020906.1719276-11-matthew.d.roper@intel.com">
      <pre wrap="" class="moz-quote-pre">Although &quot;multi-tile&quot; and &quot;multiple GTs per tile&quot; are mutually-exclusive
characteristics on all of our platforms today, this may not always be
true.  Assign GT IDs according to xe-&gt;info.max_gt_per_tile in a way that
should work even if future platforms have different configurations.

This patch should not change the behavior of current platforms; it only
future-proofs for potential future designs.

Signed-off-by: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_mmio.c |  8 --------
 drivers/gpu/drm/xe/xe_pci.c  | 14 ++++----------
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7357458bc0d2..b65d888ee8e4 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -82,14 +82,6 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 			drm_info(&amp;xe-&gt;drm, &quot;tile_count: %d, reduced_tile_count %d\n&quot;,
 				 xe-&gt;info.tile_count, tile_count);
 			xe-&gt;info.tile_count = tile_count;
-
-			/*
-			 * FIXME: Needs some work for standalone media, but
-			 * should be impossible with multi-tile for now:
-			 * multi-tile platform with standalone media doesn't
-			 * exist
-			 */
-			xe-&gt;info.gt_count = xe-&gt;info.tile_count;
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a4885f64c2c4..b29252abbf3e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -687,10 +687,11 @@ static int xe_info_init(struct xe_device *xe,
 	 */
 	for_each_tile(tile, xe, id) {
 		gt = tile-&gt;primary_gt;
-		gt-&gt;info.id = xe-&gt;info.gt_count++;
 		gt-&gt;info.type = XE_GT_TYPE_MAIN;
+		gt-&gt;info.id = tile-&gt;id * xe-&gt;info.max_gt_per_tile;</pre>
    </blockquote>
    why&nbsp;&nbsp;<span style="white-space: pre-wrap">gt-&gt;info.id is equal to </span><span style="white-space: pre-wrap">tile-&gt;id * xe-&gt;info.max_gt_per_tile</span>&nbsp;then
    the resultant number exceeds max_gt_per_tile , i dont know whether
    we can assign&nbsp;<span style="white-space: pre-wrap">gt-&gt;info.id as equal to </span><span style="white-space: pre-wrap">tile-&gt;id</span>
    <blockquote type="cite" cite="mid:20250617020906.1719276-11-matthew.d.roper@intel.com">
      <pre wrap="" class="moz-quote-pre">
 		gt-&gt;info.has_indirect_ring_state = graphics_desc-&gt;has_indirect_ring_state;
 		gt-&gt;info.engine_mask = graphics_desc-&gt;hw_engine_mask;
+		xe-&gt;info.gt_count++;
 
 		if (MEDIA_VER(xe) &lt; 13 &amp;&amp; media_desc)
 			gt-&gt;info.engine_mask |= media_desc-&gt;hw_engine_mask;
@@ -708,17 +709,10 @@ static int xe_info_init(struct xe_device *xe,
 
 		gt = tile-&gt;media_gt;
 		gt-&gt;info.type = XE_GT_TYPE_MEDIA;
+		gt-&gt;info.id = tile-&gt;id * xe-&gt;info.max_gt_per_tile + 1;
 		gt-&gt;info.has_indirect_ring_state = media_desc-&gt;has_indirect_ring_state;
 		gt-&gt;info.engine_mask = media_desc-&gt;hw_engine_mask;
-
-		/*
-		 * FIXME: At the moment multi-tile and standalone media are
-		 * mutually exclusive on current platforms.  We'll need to
-		 * come up with a better way to number GTs if we ever wind
-		 * up with platforms that support both together.
-		 */
-		drm_WARN_ON(&amp;xe-&gt;drm, id != 0);
-		gt-&gt;info.id = xe-&gt;info.gt_count++;
+		xe-&gt;info.gt_count++;
 	}
 
 	return 0;
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------CH0DZXZ3uTe8UFQiMXkQcOFl--
