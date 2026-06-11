Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345A3CD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 22:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF44110E8B0;
	Thu, 11 Jun 2026 22:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AoLz3r2Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F7210E8B0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 22:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781216413; x=1812752413;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tg2yLPY9m0d52r2CGbxQVgSFwr22BtyrPjp9jkVgJd0=;
 b=AoLz3r2Y1wJPiAncslBasH5Cq0UQZnXv1bJXhls075fQE8jAR1neDoRd
 Yg87kzf20vgln12ALJYd+d4OX4TkQnERUs9MRHV9bMGGNJO+CuHY61EJm
 q+nEcU1EZkjA5lx9sw9njcUQOjaY6GNP41AL6G817UFXXzvhAoo0AxR94
 x5FmMjqkxUYmWOZisIOdrJRShe2zE4LHiWJH+ZrBVxbkkaVRVPLh1B5JR
 QbKm2u/KrmI32PKw7xIfRIBWonrv5rMafKZI4Dm3z+83xqdfkAFS2lXCs
 LY4vHniqwV+FdZyWlIRmthXMVnPZMEvE1dxW4318EzTnSAnMiyrAf6L+Y g==;
X-CSE-ConnectionGUID: M2Qdcy81QsiHIzQxirNTog==
X-CSE-MsgGUID: Wn2WQ3OfTSCAiTQIoiSPFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81179639"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="81179639"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 15:20:13 -0700
X-CSE-ConnectionGUID: HC+HFON/TSiS/qhPQV5++Q==
X-CSE-MsgGUID: Qr75/3JzQrSP4+oV6zTr3w==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 15:20:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 15:20:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 15:20:12 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 15:20:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDXpxmh/lXpDFGDEKyWsMm68TLNe1AlcIrE/ERHFFIZu7iUWtSDRrwq0mef//TexU2PbiF8ttBYUr7bJnHPmippOCWcOMFKIYc79WhMTrFuaaJskWAomxZgL7CnxkTbBbjziGmoEvQnhsRUmQGspGZhykuy8nvm/RB1g6PlmcpV1FpmCwIHYgsYFryoQKNA+HM/xw+SeA0JbovC2unhJAhfQaTFx82oGgEHEitY+GjOGt+0TDRtqSvpafAICTFxp54g9/iFdvin33t5CijaqfpMx4naDts55qGNHdG2xJv3zzg9FwrkXYbGglkSaL6VkZ4hpg/39dGqoNxmbkrEL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bss2RTahOEk7GbkDgkR7ifkwXhHIgyrW7+UQH8xBFSw=;
 b=Qu6L9tyU3BC0YY3Bl7cxVkE2G2DqECg307/g54Kr7HRqOvFSnFxyTgyRBr6eF792PTSMniWGr6CCe40XnsKmASpl4PH6hLAfSyCQHeoRkZ6Ngb/LMYbuNrhXYkKc/dRQhEylA5XeoimwFQ53vkk/kt78QKYGLB5/IDiuGZOj5XsbL8o0tPn8tZKf0aI9cpcGPnh9Lqw3jJ5OpZaNuEerjQaqMAhOYZh1sGm4YOhmvnYhTCNlhrN3h/nJ06KAOrgu1fzHaAbiyRqGChsIRjXE1iAUTzqmmeewrVmGFeIekwmEOxFCWi+ypDCdrQYTAgFwis6cZos9a8c7XBtrlzlhAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB8157.namprd11.prod.outlook.com (2603:10b6:8:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 22:20:09 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 22:20:06 +0000
Message-ID: <33423af2-7e8d-4682-a3ca-ff99bad28979@intel.com>
Date: Fri, 12 Jun 2026 00:20:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: add structured RAS error logging
 infrastructure
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20260611091224.17275-4-mallesh.koujalagi@intel.com>
 <20260611091224.17275-5-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260611091224.17275-5-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::21) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 25237bd3-4140-4a99-a116-08dec8079752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|5023799004|4143699003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2VO8AA6C6bJos5hkpUGeoIvvY+GlaEetbcOHohwzM8MHT7YgnDPlkcnB8Cdkm39KCPio+NX8xbDWtPyNYAUVjRNFLzwZjn4XUtdWahSmwLKwrePdOitU9SNqGpT/jDb7mvR7bnC75RiRMaYhzbVjd1HU/jvKgjxHHDJVuZHs9qHbsAlW0azbY9tciQbBbjFoEN8+h4oGUfRp6eLCXf8WnOb86b9BTTHpakOT42PppXx32g4dqPHAEd8rMSKz+5+SazH2c+TM15xDN8xqZ/dtLErpBFqN6lqnmmCeGOdhFB562AkCutaHTulTLWDpnqy6LNSPTQsoI58Qupj+OYST7yuCR4rdX+y+B8fdjwsj9gOV27zQ/Ien8Spl2BVPkzEw3vNc84iQM+HU91cpHu2HYEso/i317HaESmEY6L3bsWJmBiDTlF0mZW7EE/1OeflAoQUNPu47kCOtnYRYZ7D0V1X4JKLHXGBhvK/b46swkn/t9LKFAjFQbp4FS5U4FA6VlgTdY14wD0SgKTt/mbdqgcvEmovUkMP+AOQh3WrEDYNs54ZBZxtvo3Gc5E/tWISFEO0Ii1Mwy/rPWv1X3s2w9OJ/2OxJLEa7bPtTiyU3zAL8ZcsUieM6jy/DpVegAryblNYOwhJXNK/KCfZ0bszJYyL281byYw3yFlnbzG/iO2fs5uNatY99paFiSIs+BE6F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(5023799004)(4143699003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2x1d3FUOXBrQWFLU0VkWTVyYnVmTks4cmRJb1NKZ0pqYTl6eEEwSHEvZXJJ?=
 =?utf-8?B?NXJLbm0wRVhQUkJhZGY4YkpvNHdDZUVWZjFWbUJMQzgwMjZUc3V2K3Mya3ZK?=
 =?utf-8?B?SmZkc0cwU0JMUUpFd1lrVGVQck94YUs4bFNkbWtuODhFUm1qYVVQblBORFpO?=
 =?utf-8?B?cVBtSWVrY3BpYWMveXp5OHExcmV2NW5aYWk5WDNtU0tOWmVzQlNxUC9kQ0o2?=
 =?utf-8?B?dllUMjFYd3VnQm5wQXNBaFNFeWZxazVidzVzWFptMnpKZzFUZlVFSGtwak1s?=
 =?utf-8?B?a09zeU9RUUpuMjhzK1V2dkI0WUNneVpEMUVmNUEzeGVqL1k0YVA4VHdWQmNr?=
 =?utf-8?B?OWpLbjg2RGZNVWRrWTA0K2cvUXQyTTVQY3FETWFsZTJGSFc0ZlF5VnVxVzlx?=
 =?utf-8?B?YkN4TnpRM2NHNG1VdWRFaXJFRnMwZGZuamVLVEZjWVNtbUxzSlNGV2NaNzQ0?=
 =?utf-8?B?SGErVEo2UWZHNVN2T3ZTaXBHWmhNZkdMcmc4bE9UaUFPSFVFL2cvWkRpaUxv?=
 =?utf-8?B?RlRkUVJiTms3MXViTndkdXJkZGtMOE9DdHFBZnVKWVhzcmVXQ0R5aE5OVGdK?=
 =?utf-8?B?RDM1Tis3VldJVHdzZGJkekVFV29UNzRBS0VGSmN1TWJLekdIbG9QYVArTGMx?=
 =?utf-8?B?QXh1VWpHU2RtWUhVUUhuYXR4NkUyeklXUTMxTXZ3WmlPbTk1QWgydmREVloy?=
 =?utf-8?B?TmJmaDFCR29MQWNxUkRRQStlUHNtOFpjWjNvWTI3SzBpT3BBejhVeXdZL3Zv?=
 =?utf-8?B?M0ZMWlVROGZlTmFhVncvc1BXb1B1R1VTYXQzZEFKeHV2bXU4TEx3eWxTNnZH?=
 =?utf-8?B?MUMwbHQwQTJ3ajhRcXQ5UXI3eDBYREhuMnZzckFUWEgwNnFWNzZzUmRYMDN4?=
 =?utf-8?B?YVFNNlhib25CaW1IUjNRUG0rRUN5REkzdjhtbkR4ZXNETDgwYk1YOGhjdmdi?=
 =?utf-8?B?V1lUNWdwSFNHTWcxU2tqV2VYM3M5b2t1dnJYblQ5L1VMUXFVcXBFTk01ZmdG?=
 =?utf-8?B?TVJJRnZQR0xmUFNsWWM3NkhxRlFEcDk3NTdMMzd6RWt3TTBYaGpQeHR4UCtO?=
 =?utf-8?B?TVJPbXNMcDFUREFaV2lKVDJRRXRKTFhFT2pqWDErSVVtdWkrSmhQR2lXNWI0?=
 =?utf-8?B?REM0MFQxZTBPYUQweGpKS3FtbS82cHhobFZuTlI4SHF0WEZiM0lNSDRxTWsv?=
 =?utf-8?B?clpsdm5jaGRYd2g2eW04V1cvWDR1RElMbEtQNlozcmd0cGFRSG9yNWQ0K2Uy?=
 =?utf-8?B?NTY0RnB0WnkxQjc2OEd4OTlMZ0N0R1V3cktxRitsQzhkK09LbUwydHVndXZC?=
 =?utf-8?B?WDBYNEc0WlNRVnJVTm1HTTdqTlFoUnVyS0hmR0ppVXlQK1VmbUlBRVp2bXQ3?=
 =?utf-8?B?SU5WRlJSS1ZuQlNrTisvS2w4NVJPTXpJS1N2TERDQkVqeDhvT3ZGM3BXRnIr?=
 =?utf-8?B?Z3o5TDM1dmF6SUN2R0phNGtLRUZGMHk2ZmI3SzJFcVVJQzVlOGtvWCtrVGp1?=
 =?utf-8?B?TmdrSVZZMW5nOGRRZFU4RWNuUVVqYlBHVnU4VUpGbjRhOTNEMFJKNHNpNDl2?=
 =?utf-8?B?QmFsSXBBSjdabVg3RlNqNlRJTTJsdElCTllrZ2kwZnk5U0o0bzBPTWp4Wm5D?=
 =?utf-8?B?eUtCbERXdmFVYlJ4TGI5OGJ3SW5OMmdUd2gzN1JmajhxSlhLNWVhMjNpQTBJ?=
 =?utf-8?B?cGJueU1WemJqZCtLempKVHF1Q0xqSGZHeTJUaTdEenVSVXNUcFJPSmt4UVBH?=
 =?utf-8?B?WFpJR0tVOWVlS3JYb1VtM3JQakNjQjNndlFNOXdlZHlNVkp5a0NOcHhYUldl?=
 =?utf-8?B?aGU3QmdpbkQ5VWk0N0gxVDNEY0VOUDRTcjFlTTRiTUZRazd6NGpTMUpiSStl?=
 =?utf-8?B?TGt1UXFYamNJMzdHV1pGOWt5RTRqc0E0Ti9LL203b21oYmJUQ2RtSGVjaFRI?=
 =?utf-8?B?RXZhbWQ1UU0yYUdMUE5DakkweGo1L1N1djVUUkpidnVxRVoxcHRObkVrK1Y5?=
 =?utf-8?B?bDZNYVprSlpDNUJyMWZKNVlvZExwbHViSENrM215bGVwV3dSMjZvL0g4L1Bn?=
 =?utf-8?B?VHZtd3ZWVzQxUnkyK3Y2WDVVdW5EMGlyVldrenpHMlBTNnlsMlNmRWxOSlV5?=
 =?utf-8?B?d3VIaXpzYlNQOTB0SXNCT3lWbWI2RUdzOUV1V0YzZ1kwRnpwbE93TzMxM0Vn?=
 =?utf-8?B?NGgyd0N1TUNNby9nZ3R6VHhkeEh2OHduakVsd1NPMEZ5NmhoV09tcVlsbWhq?=
 =?utf-8?B?S2dzOUdTeGVxUHloK1FCMkp6Skh3YVdZUHlMcGNVMVZ2VnlUMVJBMVlIZWNL?=
 =?utf-8?B?UEdsS2FVdWFHUU4vMk12S2JnalhMcUlGc2p0ejB2ZmFqNDdCekwrdkw4MUtr?=
 =?utf-8?Q?qAu/VBeN4fixPvrw=3D?=
X-Exchange-RoutingPolicyChecked: W7oaxEubitc3PzSWTp9EDHhFcPysKqWxr5YwiM9ebJs7iLYR9UEBwbxlctyk71+t0x2Pl5jReSjmDCw0H492BU+Wuh3DpBGQeupG/0mCEd2h6sa1lZQ89ciwYF0D1h+SUpx1NNuGTKbF6Y9QJKSCsZn9Kr2iLASwgnEuDxMFsXSo91vVTycGA5Yybq390ZHvhqYrnPmkNkSoDImBYLQWmdyW/y5sijR7ljsP7m3Hi9+W8YDb8/xtq2yz8UO5gsCifuNOXkHZ4lwCUiQ1egzJ8pAW/8HtoHU1qtwQ9gDm8TfJcAGz+E3q/L2mbN7oz74O9Lr79wyn8EMWb/tIt16pCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25237bd3-4140-4a99-a116-08dec8079752
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 22:20:06.6214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WJSWVxbImYQS7FB/BY+N+oJVjoUxx/DRVfNQ3aJrq7p3Y5gAiBS7XV8TjRe9jNYUj5G8LrJcL6ZPHjMeNhZS2EbalSYUhQGLXGH0eRbFEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8157
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



On 6/11/2026 11:12 AM, Mallesh Koujalagi wrote:
> Introduce SIG_ID defining Signature IDs (SIG IDs) for
> categorising XE GPU errors, and __xe_ras_log() to emit
> structured log lines with SIG ID, CPER severity, tile/GT
> location, errno, and a free-form message.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile     |   1 +
>  drivers/gpu/drm/xe/xe_ras_log.c |  64 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sig_ids.h | 101 ++++++++++++++++++++++++++++++++
>  3 files changed, 166 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 091872771e98..412be4bad952 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -115,6 +115,7 @@ xe-y += xe_bb.o \
>  	xe_query.o \
>  	xe_range_fence.o \
>  	xe_ras.o \
> +	xe_ras_log.o \
>  	xe_reg_sr.o \
>  	xe_reg_whitelist.o \
>  	xe_ring_ops.o \
> diff --git a/drivers/gpu/drm/xe/xe_ras_log.c b/drivers/gpu/drm/xe/xe_ras_log.c
> new file mode 100644
> index 000000000000..b6a2792b61d4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_log.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_print.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_sig_ids.h"
> +
> +/**
> + * __xe_ras_log - Emit a structured RAS log entry
> + * @xe: xe device instance
> + * @gt: GT instance where the error occurred, or NULL if device-wide

what about tile-only errors?

> + * @sig_id: signature ID from xe_sig_ids.h identifying the error class
> + * @cper_sev: CPER severity (one of CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, etc.)
> + * @errno_val: negative errno describing the error condition
> + * @fmt: printf-style format string
> + * @...: format arguments
> + *
> + * Formats the message and emits a kernel log line via drm_err() for fatal
> + * events or drm_warn() for all others. CPER record generation and hex dump
> + * are planned as follow-ups.
> + *
> + * Format:
> + *   [xe-err] SIG_ID = <id> Severity = <sev> Location = <loc> Errno = <n> Message = "<msg>"

is this some standard format or just our invention?

> + */
> +__printf(6, 7)
> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
> +		  u16 sig_id, u32 cper_sev, int errno_val,
> +		  const char *fmt, ...)
> +{
> +	char loc[32];
> +	char msg[256];
> +	va_list ap;
> +	int ret;
> +
> +	if (gt)
> +		snprintf(loc, sizeof(loc), "tile = %u/gt = %u",

elsewhere in the xe driver we are referring to a tile as "Tile%u" and to a GT as "GT%u"

also, the "=" used here might mess with rest of the items that are also separated by "="

> +			 gt->tile->id, gt->info.id);
> +	else
> +		snprintf(loc, sizeof(loc), "device");
> +
> +	va_start(ap, fmt);
> +	ret = vsnprintf(msg, sizeof(msg), fmt, ap);

can't you just pass va to drm_err/warn below ? 
> +	va_end(ap);
> +
> +	WARN_ON_ONCE(ret >= (int)sizeof(msg));

maybe xe_assert() ? but shouldn't be needed anyway

> +
> +	if (cper_sev == CPER_SEV_FATAL)
> +		drm_err(&xe->drm,
> +			"[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%s\"\n",

do we need this "[xe-err]" ? both 'xe' and 'err' will be there already added by drm_err()

	[ ] xe 0000:00:02.0: [drm] *ERROR* ...

also passing a raw SIG_ID number is not user friendly ...

and severity is always present, so maybe just print it without any prefix

for location maybe we can use existing xe_gt_err/xe_tile_err/xe_err macros ?

and is errno really needed/useful? we already have severity and details will be in the msg

so maybe instead of seeing this:

  [ ] xe 0000:00:02.0: [drm] *ERROR* [xe-err] SIG_ID = 123 Severity = fatal Location = device Errno = -5 Message = "blah blah"

we can try with messages like:

  [ ] xe 0000:00:02.0: [drm] *ERROR* [fatal:123] blah blah (-EIO)
  [ ] xe 0000:00:02.0: [drm] *ERROR* [recoverable:987] blah blah (-ETIME)

  [ ] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT1: [fatal:123] blah blah (-EIO)
  [ ] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT1: [recoverable:987] blah blah (-ETIME)



> +			sig_id, xe_cper_severity_str(cper_sev), loc,
> +			errno_val, msg);
> +	else
> +		drm_warn(&xe->drm,
> +			 "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%s\"\n",
> +			 sig_id, xe_cper_severity_str(cper_sev), loc,
> +			 errno_val, msg);
> +
> +	/* TODO: Add CPER record driver handler */
> +	/* TODO: Add RAS dump cper hex handler */
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sig_ids.h b/drivers/gpu/drm/xe/xe_sig_ids.h
> new file mode 100644
> index 000000000000..8abe7554714e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sig_ids.h

maybe this should be "xe_ras_errors.h" ? plain "sig_ids" tells nothing

> @@ -0,0 +1,101 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SIG_IDS_H_
> +#define _XE_SIG_IDS_H_
> +
> +#include <linux/cper.h>
> +
> +/**
> + * xe_cper_severity_str - local severity-to-string helper
> + * @sev: CPER severity value (one of CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, etc.)
> + *
> + * Avoids a link-time dependency on cper_severity_str() which is only
> + * compiled when CONFIG_UEFI_CPER=y.

or maybe we should just select UEFI_CPER in our Kconfig ?

duplicating whole function looks like a bad idea
> + *
> + * Return: string representation of the severity, or "unknown".
> + */
> +static inline const char *xe_cper_severity_str(u32 sev)
> +{
> +	switch (sev) {
> +	case CPER_SEV_RECOVERABLE:	return "recoverable";
> +	case CPER_SEV_FATAL:		return "fatal";
> +	case CPER_SEV_CORRECTED:	return "corrected";
> +	case CPER_SEV_INFORMATIONAL:	return "informational";
> +	default:			return "unknown";
> +	}
> +}
> +
> +/*
> + * Driver SIG_IDs

what's the criteria for each new SIG?
is it per component? or per category?

> + */
> +#define XE_SIG_PROBE			1  /* FATAL: probe failed */
> +#define XE_SIG_WEDGED			2  /* FATAL: device wedged */
> +#define XE_SIG_SURVIVABILITY		3  /* FATAL: survivability mode */
> +#define XE_SIG_FW			4  /* RECOVERABLE: GuC/HuC/UC/GSC/CSC/PCODE */

btw, shouldn't we use existing FW_BUG FW_WARN FW_INFO prefixes when reporting our FW errors?

also, are we sure all FW errors are recoverable?

> +#define XE_SIG_GT_TDR			5  /* RECOVERABLE: engine hang / reset */
> +#define XE_SIG_MEM_FAULT		6  /* RECOVERABLE: VM bind, page fault, GTT */
> +#define XE_SIG_IO_BUS			7  /* RECOVERABLE: runtime PCIe/IOMMU/MMIO */

are those IDs supposed to be stable or can be changed later?

> +
> +/*
> + * HW SIG_IDs
> + */
> +#define XE_SIG_HW_DEVICE_MEMORY		8
> +#define XE_SIG_HW_CORE_COMPUTE		9
> +#define XE_SIG_HW_SCALE_UP_LINK		10
> +#define XE_SIG_HW_PCIE			11
> +#define XE_SIG_HW_FABRIC		12
> +#define XE_SIG_HW_SOC_INTERNAL		13

hmm, those IDs look more like HW components names, not errors 

> +
> +/* Must be updated when adding new driver SIG IDs */
> +#define XE_SIG_DRIVER_LAST		XE_SIG_IO_BUS
> +#define XE_SIG_HW_FIRST			XE_SIG_HW_DEVICE_MEMORY

if IDs must be stable than this will not work

> +
> +struct xe_device;
> +struct xe_gt;
> +
> +/*
> + * Common backend helper
> + */
> +__printf(6, 7)
> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
> +		  u16 sig_id, u32 cper_sev, int errno_val,
> +		  const char *fmt, ...);

this is a wrong place to define function prototype,
it should be in xe_ras_log.h instead I guess

> +
> +/*
> + * Driver-facing reporting macros
> + */
> +
> +/* FATAL */
> +#define XE_RAS_PROBE(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define XE_RAS_WEDGED(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_WEDGED, CPER_SEV_FATAL, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define XE_RAS_SURVIVABILITY(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_SURVIVABILITY, CPER_SEV_FATAL, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +/* RECOVERABLE */
> +#define XE_RAS_FW(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_FW, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define XE_RAS_GT_TDR(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_GT_TDR, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define XE_RAS_MEM_FAULT(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define XE_RAS_IO_BUS(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)

maybe better:

#define xe_ras_fatal(xe, sig, fmt, ...) ..
#define xe_ras_recoverable(xe, sig, fmt, ...) ..

#define xe_gt_ras_fatal(gt, sig, fmt, ...) ..
#define xe_gt_ras_recoverable(gt, sig, fmt, ...) ..

> +
> +#endif /* _XE_SIG_IDS_H_ */

