Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421C4CCA470
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 08:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03E510E0DF;
	Fri,  3 Oct 2025 08:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPb23E4i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A99210E0DF
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 08:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759480849; x=1791016849;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hEbneDnESMh7xsLjJAw/IzHXN8VUtR/l06Ezx+usIdg=;
 b=YPb23E4iVFxw/m4rFEMomI1mYTk0LAI09nl1qGMnnx9gGa6gR1asf0lF
 xS6StiiEn7blrd/Z30GCql+bA4nMurGpZzIX2Al+B1cFfWMnA09ssBRYK
 Y1kRgGJGxCuaK5K/E8xHc8R6taa4Qbx1q5MYVmBom7Z12mXYnWGDVe3y7
 8+xVzblFwN4hHhRMBWogR4kE8iiMJ+i9Y5Wc5aJ1DuCVhtTRuT3LRCPfW
 nlnumMYRNh3TalBYwi3sZcfDuYNiD+dUmWsiRgm+LmN0DJG5e4WmgZcdy
 /+YUYtjyP8fpRfUU6o9g1PWeEDHJWV5si7HTfJYzL8tsVSWjVYhHc3vxW g==;
X-CSE-ConnectionGUID: bXu1IzkSR0y0SviDNheNxA==
X-CSE-MsgGUID: Pw1mgLC9T0mBs+N+1YVfuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65589065"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65589065"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 01:40:48 -0700
X-CSE-ConnectionGUID: ZAVdFCwkTjOU8thYVy+IPQ==
X-CSE-MsgGUID: scmVS1KGRuunvFUKVopn8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="216363586"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 01:40:47 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 01:40:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 01:40:46 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 01:40:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orspiGSOdfqYlqHHITHRQEYX1kAAZ89fBD3xNsJaKx9rOfrJk00ShMRERn+YYtq2lL81mT8ATRHA6IXRGjy5OVGtqjJBjLbfdpI3jAPGUid3Q8NRqT4V9bYA8wYzkLWdpEXhGuJvzP46lT0pVU6/7qPwhwafOV2iWDK+G9z8DRBF9nWRDwJcyLcJYwB0vDErrVr47590+eISnG81AOY6+ybLJrgb28isjCiXkZvVUZ1KmDQzwhWqxb2O7VCR2lS5IM6glV5RsR02U9ZN925zqvfNqAKzQwm45/ggJJQwLUyB/8Z2y3tJF7p71+oe+B31n+YUm2Jk+1Kx4DGcFpDxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cA7VAIwHXC3h61kPB51hFBcI052HS2FsWT2/bXAnlw=;
 b=NXa6wXP1CFc2HlFWR7Gm5N1zmcnDdydWgjAaxaB5EGfkm5TtYfTiOjYNfguMzjWyKKsnG/nEjxzB3tlCGrXG1h5MCq5pXRYXXMKu1owzynwaISDjdLsKo6D4yICvnJEbpfgrvAt/9kfllLsItWOf2e9pJs7MdrNh1ARBT+VTo9/vE1wefDOPXNp2gQHcqgG6Q3gMgx8dOe2h/6oIPZALGndI8VWMvwF9YBy9oHbxW0kaJj3TohRBSRX9RMUYU7fJ418g+UAdFX/l3R2ZnYx0M6tKBwy3QUgGc2+V74nn14BrcNM1V2fzXeZIVQr5XMfkBef8aWOKBKVZ2lGKB9X0cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 08:40:44 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 08:40:44 +0000
Message-ID: <e7a0d5c0-34a1-43f0-9363-f0b721f3a91b@intel.com>
Date: Fri, 3 Oct 2025 10:40:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/34] drm/xe/vf: Add xe_gt_recovery_inprogress helper
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-12-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251002055402.1865880-12-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0399.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::6) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6024:EE_|DM4PR11MB5232:EE_
X-MS-Office365-Filtering-Correlation-Id: f14677af-aa95-41da-bb60-08de02588ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1J2SWNILzRaSDlhVEFaMTczdXZlNjRLdDVxOW1jOFAvZFViV1dXbjBxaTh5?=
 =?utf-8?B?K3crT1J0Q05aeHZiUzluSGFPdGNxeWNDQjNEUXZUaVpvUTNBeUxoRG9ISG90?=
 =?utf-8?B?L0NxTFUxdWw3RitTZVpWYjVkK1VxbmU5VDhHN3BkcFZGV05IS1JCeVVUdDQv?=
 =?utf-8?B?alpuSlM2SEd3MjNva1hUbWdLVldaN2lzYVhDSGluR2U3ZThNVnNGbGFqZTlv?=
 =?utf-8?B?Y29nZUszQlRpQitzazBvODNsUWdlVDdkL3d3a1lKdUZ0WGN2dWdWNUpSa1pJ?=
 =?utf-8?B?SjdteHhZcDRlcW1Ya3pVYUpMVlhVNFBDdGhUVkdsNm1MTDk1WkVxbUV5VWdK?=
 =?utf-8?B?b1RUYjN4b0g1K0Vac2FDQXlPUHk3ZjFKR3RrWFlLWjFhN2pwYmFvMHdMR2o5?=
 =?utf-8?B?M1ZhSDdOQzg3dCtkZ3ZxTy9hRTc2cVlDOGdieS9OYm04NDRQMENuMTRRUWlO?=
 =?utf-8?B?OG5HakZGNjM0NTFwYU9FWDRsbXhyK2FLU3NYMG15VFVGemVYaVZtaE9MenBV?=
 =?utf-8?B?TnhpTDdHMGI3aDNHUXZzbjR2alNXMTdjRzVhZy82TnlBMG5XaWUvUTJlRitw?=
 =?utf-8?B?YTZtSEljR0xZNE1GTy9JcFhZT0pwc3UrMjZnV1hjVVZ1ZW5URW9GUVgrZVow?=
 =?utf-8?B?VDNBcmR2MllQQW1tV1p4Z3ppQTNjVWZSOGQveVVJOWJabGFNbTJDUkVNakhs?=
 =?utf-8?B?U2RkbGwzN21FWFIzbTVWbElsaHllejE3bG1ia2x2TWpaQUtSUWphTnZyQTlF?=
 =?utf-8?B?T2kvUmUwTDQyU0tNSUVCS3BGZlBGTllweEJyNXJYS2diN2lBMktEaE50VG03?=
 =?utf-8?B?SlhBTTRNbS8yVi9iaFpJcDJDSkhJWHlzVmFLVkJIQVF5V0ltaEJ6R24zRDVD?=
 =?utf-8?B?N2RtQlF1KzBXTHlxNm5UWk9lRDdrdWJsais2TzRkUVhlN25vamxjMXpZdUFQ?=
 =?utf-8?B?ZjlFWjB2bjBFU08rMDA3aHVETFU3Rnd6NGE2N1E2YkgwaEMxc1ZFOVNkVElR?=
 =?utf-8?B?Yk05TjBoelFTZHFHaHptM2ljUXYxMWxjL2h1Q3lLS2hOL2lsWlVEc2hZamV0?=
 =?utf-8?B?R1A4QWs1OXgyb2U5cnRDWUppeGYxNitWRlllY1ArMExBT3V4Vkk0dS83R3VZ?=
 =?utf-8?B?SFRQM2NWYjF5MHFZV2Y2eERRdy9CbTQrZ2VNREtFZ2pKcFFBSnQ3Ky9VSlAx?=
 =?utf-8?B?NHd1aytrWlppc01kNkNKK1NsTCtlWFpHdjhxdW53ZnNaK1lzeTRjbmZKV1Vn?=
 =?utf-8?B?RFhkR2dackpybXlGblRpc2xYalpVc2lZMDkrQkhhSGVmZ0l3WGViTk4vZUpR?=
 =?utf-8?B?UWxiS3lGY2pUOXhzbmh6R1U1ckRFTzBhNk1jQ0FIanlzYVVONjlOWGFBVFd4?=
 =?utf-8?B?WFZPcFByNWVFT3d1RFk2VCsxenJoUzRCUTIxMDBsV3NpRDJUUC9YWFdpVjV3?=
 =?utf-8?B?TmtXNGVWUDFiRitVVldPZ2NvWndsVmpyN1JoWGFKSVAwRWhIbnZxb2tUdlRW?=
 =?utf-8?B?VC9ZbjdrRmVLa3JuK29xOWtXQnlTcXpFNnZaem1NTy9LbGhiQ1IrNElGNEc4?=
 =?utf-8?B?KzFVTU5vWXZOSGZPWjdneFF4eDB2b0tDaE4yRWZ6U1kwYVZ0SkR6SEh3cEVU?=
 =?utf-8?B?M2dGZTFZNVJTbllwNVBhUFBPZEg0a0FzUWxYcUJyeTk5ODZZM2lXOG9JOHpB?=
 =?utf-8?B?alBMS3VpZTFqRWV6NVcraU9vWFczTnRDalBRLzhYTkFTcVM1ZzYyOUJYZ2Js?=
 =?utf-8?B?SmM5OU5ZNzg3cTRmMmtBYjl2NW1ROVVIVVVJU25IZVc5R1Y5WldUL2xPTFhX?=
 =?utf-8?B?MVVrVFRQTEJxdU11UmNmcjhOODh4V1hmM2p0Qk9EWEM4Zmc1TTN2Qi9BbFp6?=
 =?utf-8?B?OEthTmhHN0gzV2pFZFhsMnQvbHh1elEvTytvNDh4L0VZZXZZZEx6blEva2ZX?=
 =?utf-8?Q?Bakqwd5fsBNKfhKMrc0KSIjHc2R39TqS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVhUOVZYVHh1TFlnMy9OUjRBWWk2YjY4MHhwSUdJMmw2ZU1YZHU2K3l5ZFA0?=
 =?utf-8?B?M1c4eTdrV2t5S0hMY216MGFIZ1YvYWNGNis2STErc1Mra0liM01Nd2hGYjd2?=
 =?utf-8?B?SFRKenVNVXB6ZUV4eFp3Qlk3L2QydHRGUVdxWXFCSDg5YUZUK3VHV3cwSEtY?=
 =?utf-8?B?NmtCdm9jTW9xelNWQW9vcU91dHlRM3JDT1FEaGlMWXFDY2VtbzN6S3lpTXVN?=
 =?utf-8?B?YldZL2tSeE1CYm5FNjNXSlRpWFU5dXRNZWtYNmg0WG9yVUxYV2hLTkVHZGU5?=
 =?utf-8?B?Y3BaQXJCT2xNY0J5QVQ0REVGTUpxZ1Rld2txS3NBODhPTzd1bGZtUzFVZ3Fi?=
 =?utf-8?B?V0ZqZnZ6L0diUU5Hall0NlFETHZaZGk0VVRxVG1nZmxicHlSYWhBNFFFRlRJ?=
 =?utf-8?B?aEFmQ0lxbHJWS0xjZFFRdW94cTBPSDMyK0NmWEpRLzl0R2EzbmUrL3RXNDR6?=
 =?utf-8?B?RFZWRVZBYzlkNTYyUXBWTVBHcnh2cmtqT1RTRFptS0h5d0NOc0hMZE4vY1cr?=
 =?utf-8?B?c09HOERNaGNka3ZCby9kcyt5aUw1STFLZE9SMHd3bllqK3NORm1RZVh1Wlk0?=
 =?utf-8?B?bkF4VDZtVldPOVpNcS8vWkIvck9jOHFUb3JOaEMxZExIUyt1OU1JOEE5UnJh?=
 =?utf-8?B?T3ZERDYybTZVTHNBZFhucFF2ZWMxeTNsSlQ5ZGRJbWUzWGRnL0xuSGsrSkRp?=
 =?utf-8?B?NERlbU1mVVRmNldqSFhyNHdwdUp4dmdKN1praFFrMHNoYXFCV1BxRjNZdjcv?=
 =?utf-8?B?MHd1UURmTVBaYXFuZHZwcE0rVnpQa2tqMGRUM0hzek1zaGViV1N0Y1FEREFG?=
 =?utf-8?B?TVFuT2d2dWhrQmo4UVlSTGY5cnFDTC9BY2p3MlV6di9FL0VIMWYyNnZQNjBn?=
 =?utf-8?B?YjZmb2JSbHU5M3dvc1A0U1hwdlhIT2RnS3FXcTd1enhrMVRpZXg5YUZZWGtS?=
 =?utf-8?B?bnMyMkpTYmdhWncybUdhaGJDcUNYNy81SHlmZUkvdExyamFKTUQzeWhzN0Z3?=
 =?utf-8?B?R2c3bjdxMEVVWWJkcGdsK2YzZDdhSHFXU2Mra01pTkFSUFFFL2V0SUtFVXpv?=
 =?utf-8?B?bi9wNmhhL01VTk1EQ0gyRXAwVGRrM1RsRUw0R0ZWeUgzakJYMm00OG43UnMr?=
 =?utf-8?B?ZFJBME9qbGFLMGdFYkR6SlMraUJEeFdmN1FhcUEvTENwMUl4UHMwQmx0TTVl?=
 =?utf-8?B?bHZKZFVqYXd4aENtanpGNkpBNktGZUMzZEwzYUFDVm5xaFVUaGhyelV1S1VW?=
 =?utf-8?B?VHBtb3ZsaDk2Ymo2TTZ3Vnp5R25DT29ycEJXMjEzdU5ka3lOSWJSMkljVVlO?=
 =?utf-8?B?QmlMZ05ocUtLOGF5NEpCa29OKzRXK3U3cDB5NWI3SStsL09CTmc5eWJFTjFo?=
 =?utf-8?B?OWNqZnp1K1FxeStSODRzZW02aHNKdVZFeHpqUWRGWmdRQWRBS0hsTHFxNVVI?=
 =?utf-8?B?UUdSUTNNZm1ScDdzZFNuUG5xbWhLU2JNUmQ3K3JjdDB4RlBKcmk4bkNkcjh0?=
 =?utf-8?B?TC84OUk1TDZTUVNuNWpGbm5CSnFIYU1WU3ZMV1lYMjFpTTJmNnhZc1dTc0dB?=
 =?utf-8?B?REV5djJiSFhyaEN2Zk5CUHRORm9kNkNiTkJzYTRrWU5iTGo3NXg3R1ByMWhO?=
 =?utf-8?B?NkRPSFBUMUo3bGpML2U3bGpPanMwRDhWYXZKa08rNCt3cTI2SHViMmNVKzEx?=
 =?utf-8?B?dnM0MFpPNmJBZHdUNmU1K0E0N0lsNDdLU1BtRHlRVFNjNTZGMFNLZkNnTlIz?=
 =?utf-8?B?dXZuell0RE9QZDJGZFNGRVE2ZDJPWDF3MVo2YW05cVJXVkFrTE5hUUYyTFhJ?=
 =?utf-8?B?NTFESFdSSW5zaXlTRGh2U3pyL2xldTlyT1dDdUJnUURFMVIra285VmxYTkRs?=
 =?utf-8?B?dDJaNlRQSkFEcTFoODBmaWx4SzhES29lWWFoY1g0V2FwbU1GSFl4VHcwVHNS?=
 =?utf-8?B?bFQ3dklRWmFMa0RuQUdLY1U5bDd2QWtuUkxXZTVzNFNHb2VWc3EwR2lleUdK?=
 =?utf-8?B?Q0tUdXJyT0lPRFI2dVBRRS9YOEdlMzNxZExIMWxZeGdTMmVYaG5FY0lBSnJ1?=
 =?utf-8?B?cDA1K3JiMWNia1V0TVlvNW1YT3lDNHJFZVBLeDBsMWlXbVJhK2g3QW5HR1hx?=
 =?utf-8?B?Wm1uYjJEejZCRjlZT3RZYkdhTENwamIxZWNXNWF2YnkveDFCYXA0Mng0MkIz?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f14677af-aa95-41da-bb60-08de02588ac0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 08:40:44.4044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fe6OnhIsI3igIvkmXB+lbo424HQr4M3bUzG4QCFM1tO7zX7+OxvZG5J8PnG6idKx246SmryMQ6+qshiQr4uWw4cET18XAtpBrmVlK/qQIck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5232
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



On 10/2/2025 7:53 AM, Matthew Brost wrote:
> Add xe_gt_recovery_inprogress helper.
> 
> This helper serves as the singular point to determine whether a GT
> recovery is currently in progress. Expected callers include the GuC CT
> layer and the GuC submission layer. Atomically visable as soon as vCPU
> are unhalted until VF recovery completes.
> 
> v3:
>  - Add GT layer xe_gt_recovery_inprogress (Michal)
>  - Don't blow up in memirq not enabled (CI)
>  - Add __memirq_received with clear argument (Michal)
>  - xe_memirq_sw_int_0_irq_pending rename (Michal)
>  - Use offset in xe_memirq_sw_int_0_irq_pending (Michal)
> v4:
>  - Refactor xe_gt_recovery_inprogress logic around memirq (Michal)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.h                | 13 ++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 22 +++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
>  drivers/gpu/drm/xe/xe_memirq.c            | 48 +++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_memirq.h            |  2 +
>  6 files changed, 93 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 41880979f4de..ee0239b2f48c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -12,6 +12,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_device_types.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_hw_engine.h"
>  
>  #define for_each_hw_engine(hwe__, gt__, id__) \
> @@ -124,4 +125,16 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>  		hwe->instance == gt->usm.reserved_bcs_instance;
>  }
>  
> +/**
> + * xe_gt_recovery_inprogress() - GT recovery in progress
> + * @gt: the &xe_gt
> + *
> + * Return: True if GT recovery in progress, False otherwise
> + */
> +static inline bool xe_gt_recovery_inprogress(struct xe_gt *gt)
> +{
> +	return IS_SRIOV_VF(gt_to_xe(gt)) &&
> +		xe_gt_sriov_vf_recovery_inprogress(gt);
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 0461d5513487..c2be8fc14c88 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -26,6 +26,7 @@
>  #include "xe_guc_hxg_helpers.h"
>  #include "xe_guc_relay.h"
>  #include "xe_lrc.h"
> +#include "xe_memirq.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_vf.h"
> @@ -776,6 +777,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
>  
>  	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>  	/*
> @@ -1118,3 +1120,23 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>  	drm_printf(p, "\thandshake:\t%u.%u\n",
>  		   pf_version->major, pf_version->minor);
>  }
> +
> +/**
> + * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
> + * @gt: the &xe_gt
> + *
> + * Return: True if VF post migration recovery in progress, False otherwise
> + */

hmm, I'm little concern about the mismatch between function name and it's logic

> +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
> +{
> +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	/* early detection until recovery starts */
> +	if (xe_device_uses_memirq(gt_to_xe(gt)) &&
> +	    xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc))
> +		return true;

as here it may return true even if the recovery didn't start yet

> +
> +	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);

and this is actually the flag that indicates that driver actually is recovering

maybe (depends on the actual need) we should either:

* rename this helper to:

	xe_gt_sriov_vf_pending_recovery

* or provide two helpers:

	xe_gt_sriov_vf_needs_recovery
	xe_gt_sriov_vf_recovery_inprogress

> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 0af1dc769fe0..bb5f8eace19b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -25,6 +25,8 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
>  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  
> +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
> +
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 298dedf4b009..1dfef60ec044 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -46,6 +46,14 @@ struct xe_gt_sriov_vf_runtime {
>  	} *regs;
>  };
>  
> +/**
> + * xe_gt_sriov_vf_migration - VF migration data.
> + */
> +struct xe_gt_sriov_vf_migration {
> +	/** @recovery_inprogress: VF post migration recovery in progress */
> +	bool recovery_inprogress;
> +};
> +
>  /**
>   * struct xe_gt_sriov_vf - GT level VF virtualization data.
>   */
> @@ -58,6 +66,8 @@ struct xe_gt_sriov_vf {
>  	struct xe_gt_sriov_vf_selfconfig self_config;
>  	/** @runtime: runtime data retrieved from the PF. */
>  	struct xe_gt_sriov_vf_runtime runtime;
> +	/** @migration: migration data for the VF. */
> +	struct xe_gt_sriov_vf_migration migration;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 49c45ec3e83c..2391993634b5 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -398,8 +398,9 @@ void xe_memirq_postinstall(struct xe_memirq *memirq)
>  		memirq_set_enable(memirq, true);
>  }
>  
> -static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> -			    u16 offset, const char *name)
> +static bool __memirq_received(struct xe_memirq *memirq,
> +			      struct iosys_map *vector, u16 offset,
> +			      const char *name, bool clear)
>  {
>  	u8 value;
>  
> @@ -409,12 +410,26 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
>  			memirq_err_ratelimited(memirq,
>  					       "Unexpected memirq value %#x from %s at %u\n",
>  					       value, name, offset);
> -		iosys_map_wr(vector, offset, u8, 0x00);
> +		if (clear)
> +			iosys_map_wr(vector, offset, u8, 0x00);
>  	}
>  
>  	return value;
>  }
>  
> +static bool memirq_received_noclear(struct xe_memirq *memirq,
> +				    struct iosys_map *vector,
> +				    u16 offset, const char *name)
> +{
> +	return __memirq_received(memirq, vector, offset, name, false);
> +}
> +
> +static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> +			    u16 offset, const char *name)
> +{
> +	return __memirq_received(memirq, vector, offset, name, true);
> +}
> +
>  static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
>  				   struct xe_hw_engine *hwe)
>  {
> @@ -434,8 +449,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
>  	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
>  		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
>  
> -	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
> +	/*
> +	 * We must wait to perform the clear operation until after
> +	 * xe_gt_sriov_vf_start_migration_recovery() runs, to avoid race
> +	 * conditions where xe_gt_sriov_vf_recovery_inprogress() returns false.
> +	 */
> +	if (memirq_received_noclear(memirq, status, ilog2(GUC_INTR_SW_INT_0),
> +				    name)) {
>  		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);
> +		iosys_map_wr(status, ilog2(GUC_INTR_SW_INT_0), u8, 0x00);
> +	}
>  }
>  
>  /**
> @@ -460,6 +483,23 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>  	}
>  }
>  
> +/**
> + * xe_memirq_sw_int_0_irq_pending() - SW_INT_0 IRQ is pending

maybe we should add "guc" to the function name?

	xe_memirq_guc_sw_int_0_irq_pending()

> + * @memirq: the &xe_memirq
> + * @guc: the &xe_guc to check for IRQ
> + *
> + * Return: True if SW_INT_0 IRQ is pending on @guc, False otherwise
> + */
> +bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 offset = xe_gt_is_media_type(gt) ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
> +	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&memirq->status, offset * SZ_16);
> +
> +	return memirq_received_noclear(memirq, &map, ilog2(GUC_INTR_SW_INT_0),
> +				       guc_name(guc));
> +}
> +
>  /**
>   * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
>   * @memirq: the &xe_memirq
> diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> index 06130650e9d6..a6fffdadef88 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.h
> +++ b/drivers/gpu/drm/xe/xe_memirq.h
> @@ -25,4 +25,6 @@ void xe_memirq_handler(struct xe_memirq *memirq);
>  
>  int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
>  
> +bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc);
> +
>  #endif

