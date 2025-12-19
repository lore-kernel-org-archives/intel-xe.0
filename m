Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CD6D74951
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 06:15:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570CB10E12F;
	Fri, 19 Dec 2025 06:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrzmCDSq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E26F10E12F
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 06:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766124946; x=1797660946;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5ToXH3QyQTGqod9QGVdzky79GLeQBcr2tt5oLJIkbhg=;
 b=mrzmCDSqirLPxZ3nKQHNPvYgqqrYcsP1oPhFKVFCppDF65qut6Q5fVns
 DDRw58MouID/TmNh1GTIEeUaYyuq+/JDwzbZNnp3nPd+7vKtVeyJ6zj7I
 irEXjoof5yY+Pd9Ns5Tf+i6Y3OyZt7M0qMyOgI0VryBZBvYLuj4fJjG+N
 chQBvfEkQp+DNohfLyWvFnuZ76QHn78rCP492NJMn33fWm+T3HiMBsPTv
 BbJoJh0mVnkAJ/cNXfNyNnbBNfBaWT6hpLNyVTBTAC7fqEDnMbHwPKiSv
 va+CVjR1BEOFNSgmgtdeRLQ0c3pZ5BYmBqc/IG60IHbcFhZUoSkhAjo4+ g==;
X-CSE-ConnectionGUID: KXhPdFIBT+KJ+u2nmfDHdA==
X-CSE-MsgGUID: Wco2CNMRQ8SpjMNloiF8eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78798276"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="78798276"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:15:45 -0800
X-CSE-ConnectionGUID: bT29I57hSM+pVB+bhXvzGA==
X-CSE-MsgGUID: JZqRofGmTH+pP0YB6rowYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="222203254"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:15:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 22:15:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 22:15:44 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 22:15:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTySYfB1kubolPxa+xqPmaWY3XScUi4e89yK7OImPV4vyPLDnYHNxPI7IluaxAkF3H6CSv/rvxL1qQ7eT8TzKi8WZvjubhVIV+aiCThcnUn2pzoYaw7S2ne1y+8aOCSqtX9DcNMZBYpPIv2C4Q34Q8aXreGI1vwvdTGbys3Jsggj0qSCXXLcGoGnvchQoL95nBQ4KhPbkBSvNhCPRKGtcewPtaKWgFtO5pjbtyZa5EJBwVttdHrzoMwRwq5IOuGMGRCx7ptRPNP7gJBA+GuOIX4cDBvY6TGZIdaZolFFKdFAPmNDi7sgNSuZox6UPrdHkrwVUx41N+zDiXtNJv2AHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovBPKswN1R7TlcCUw5mg++UjlO3DniasJ8Sq7c2b/Xw=;
 b=x15FA8GxmGecJce96fg5d4OBR2tHFl+oVwgPE1RdyAwv7mD/MAf9EQSNeAMWmy8OqQ8Jx441Crq+JRbtMW9XfrEx+52h12jKMebpQGRzENBBGMGsN1Z3e8WF8I8VmwicXdxO59PfJ5vx3RX6rzImDRmeY7pAG3RKRfeIhASpTT9ZL2IqJQDNcLojvsIOmGfo0693y09rJtS3XaXvSzcmuF8QnQVboLEe+Trhl8HqELQkIErA9bWBruybB/Rq3pfROkJTgp7Ut/IA1ZXZlPR0qx0XBVzWWSvAwK2YLnijYRGjS1HZyqNQiz+j6tEox2ZghFt0ABsUz+WtN/OVwn38yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB4807.namprd11.prod.outlook.com (2603:10b6:510:3a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 06:15:36 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 06:15:36 +0000
Message-ID: <8d6ba62b-1c45-4caf-9f8a-a61aceefb589@intel.com>
Date: Fri, 19 Dec 2025 11:45:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/xe/soc_remapper: Initialize SoC remapper
 during Xe probe
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anoop.c.vijay@intel.com>
References: <20251216074159.2788534-5-umesh.nerlige.ramappa@intel.com>
 <20251216074159.2788534-6-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251216074159.2788534-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB4807:EE_
X-MS-Office365-Filtering-Correlation-Id: 718876ff-7378-4c34-59fa-08de3ec605cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDRRZXBWSHZnNFYyOHhURTE5RThVWk50ZWk1eG5ueHNkTmhCQWlDU3NBYXdv?=
 =?utf-8?B?bjVDVmE5TkZFS0o3VHhUUUt4RjUySCtreDdWKzRNYW9qWWxEUUZDVjJQcG92?=
 =?utf-8?B?dTQxbTZ5R1lqekRMcUZvS2xlaTE5Q2tsYUhVQ0tlT0lzalJ5K2tiR3N6YStE?=
 =?utf-8?B?U0sxOU5FVWdyOVNkc2F3S28rd0tjRTlMZmt5czV2eDE2eVNKOWJVOVZQNDlM?=
 =?utf-8?B?UVhDMnVvMUdjNmd2dkEyTmVnbVh4UnJWenlLSTZ5OFlIRlNacFJmTFN4UUph?=
 =?utf-8?B?RSsrazk0Q2pTTlFCNUYzYzhOcjkzRmVFMlh5ZFo1ck1ZSk1OVlNVWGU5cEpV?=
 =?utf-8?B?OXVNbHNZOGZjUHpSbFpublNLOC9ZV3ZCU1F5SXpPVHhaQ01CMU9qckxaN1cx?=
 =?utf-8?B?c0pEZFRNVGZ6Q3lCbDNWMnRFc0hXMjhQYXBZcmprTmRUUncxWGdmdUJrU0lw?=
 =?utf-8?B?dkF5bWNxY1FmMVAwUWtZN0d4VkNxYzlvL3pyYkE1SGtjMitYRHIyY2N4SDR5?=
 =?utf-8?B?eUhTNFBZeDFWaHkwR2pSQVRUY2FrUUVwRUp1VlR3OEF6Wmw1U1pZWHJSUDlw?=
 =?utf-8?B?b0Q1OUlrclNKSWpsTDBaQUVCUFVqTnZFYkozV0hUdWpoQmVmZ1NEcEcrSURj?=
 =?utf-8?B?bGs2MW93a0diL1U1T2YrR3l2VGxEemt0R21XVHFaNTRhRWllTkcvZE1qU1RT?=
 =?utf-8?B?d0c0OUd4dGtUbk5JZmdBRStCQU1XbmRwalNYWnNvYjF3bU1VTUgxSHNkd1Jh?=
 =?utf-8?B?dWVJV1NaTXJkNXI3cXhrUHd5V2lFdzRTWEM4UUNEZVNHZFVHSys1YkdPc2cw?=
 =?utf-8?B?M1dFNi9qZ0w4WExZbXFtcGRvRlpUb0l0aWx3RDY5WCtHMVhyU1oxMjBjempL?=
 =?utf-8?B?ZjJaTEo3cU9jVUFGNVo5eEdrUnNaUUtjOXdxM2RTQ2ZlcGdsalNlcEVQamFy?=
 =?utf-8?B?RnBXTE55MWs3aVdYRk1DaWJVYTdNcGlybzN6ZndVZk5uT0NxS0NGelJkNHJR?=
 =?utf-8?B?SzdrSjE1ajQ0NVFqYjFJTDd1WTcvZWoxQ2VrTjRLdVI3bWJmYVk1OCt3K2N5?=
 =?utf-8?B?eURnNUpkV0dTRC9iYmMzYm9vQ3Z1ckIvejUvRFRaWlovQ21qZzhpdWVKQy9G?=
 =?utf-8?B?Mmt1QzRVMnlPYmFVQVNOMlNCeEVHTXNDbThzRDFFcWZyS3NUSitiUEdpdHBU?=
 =?utf-8?B?c040NCtOYmxWVE96RzB0WkFPUlBZdUQ4a2U0dzdNSXdTRitNeFpCZGhjMHlS?=
 =?utf-8?B?K3lPcnNRQkY0Slc1K2Flenc2bGhXNWYyazd0VUNWQnpqTytVL1JhdXdjd05n?=
 =?utf-8?B?b3lBajkzaWt5eXVXMVBxWlBQNWkyeXRIcExXWlNXbWRXNVltVlNsZ25DRUV3?=
 =?utf-8?B?aHNoM2VRazFXb2RRWmpiY1pQbFd0dHpWb0xxZXNYQXNHMG8rQVB2WGxDbDRQ?=
 =?utf-8?B?cVoxNTJMYThDUDNPUCtzY0dzOFJieVdUZ3lwZGlLTmw2c0tnWkkrYkJxajJz?=
 =?utf-8?B?YzYzREQ3SVdjZ1Zzb0VGS3lxbjVUbmMwcS9QanQveUxZWkEra1RWVXRYRzFr?=
 =?utf-8?B?cVEzUGtlZ2l3WjJKa2xvM0pjWHN3S01iVVJpa0h0OERTWmxqejUvaXlicEx4?=
 =?utf-8?B?K0l4TFlmU015RHh2N244WS9KNmVGa1N3eDlIOUx1OTUvTXk0UHhSamZ2NEhQ?=
 =?utf-8?B?dUJxcjdlbnZmaGliVWZuSDdiT05VQjFOeFZLWGNjdzB3ZDZzcjFJd282V0ha?=
 =?utf-8?B?R1Y4TVB6OVV6TW5FMHE0Nm9icWRzZ3owelhXZDh1eWkxSCtkS05ZSmV2cHpx?=
 =?utf-8?B?TnQySkZrck5hbTl4bGplSStSNVdpaFRndFVpTWRGVXRUTTViME1Lb2RBSElq?=
 =?utf-8?B?VUpNU2F6VTdSM1pNSHVzMHlhQnJUcWNhenltZ05zdGRZZS9EL0JVbFJMaDdW?=
 =?utf-8?Q?2TL2hTr23VvlX/l86tIGAAVDrqgZ5VTn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU0vTEJHMEhrRFE2Ry9qNjB6VkJoTVdxdStrMTFnTkt0ZXJEMEk0THNURE9x?=
 =?utf-8?B?dDhKVUY3RUE5dDl5Y2t5a1dwSVFEbGk2M3diNUpjQlV2Y3NHbXlVbTVuY1Jz?=
 =?utf-8?B?OFg4N0xJNHluSVFxZmhENWhpNGZlbGhPUTNjRW52ZUtHeXdmNTEvN1d5T0xp?=
 =?utf-8?B?NUJwN0Z3Wms0SzR6dzN1cmpyTmdlMm1sejAzTklocUJEU2FobDJhdUhENkJw?=
 =?utf-8?B?WnhnTlYvMVpZTEJXdVFTQytLK3QyOE1DYXlrVFV3eXhOanh6NnBKaUNqeUVo?=
 =?utf-8?B?U1NuNW1MUldCR1hqUXRsemtCanYyWTljOXNqVGFWaWI1VzIzbHFZWkZjTTdr?=
 =?utf-8?B?K1RzdFdIMnVOWjQrenJETmIzRWswczZoSW9lSGlUVStlK2FJT2o5T1hhYm10?=
 =?utf-8?B?NEgwWXd2emhCemV5UUs5SUNzQ0Mwd25lVWYzUTVMQ2xGUUQrWXFjT0hsTkdu?=
 =?utf-8?B?bXY3bnZJbm1Dd3o0WUdxOEg3WGVkemFTSXVieWhGdTl5Qzc4THVhZ2R4d2JK?=
 =?utf-8?B?VzNrVnJWd1E2K2FXeUQ5Q0xEd1dhVERWdWdCWkdicmpMTTUrNkNRYzBjcFp1?=
 =?utf-8?B?aW5MUTNsQ2xicVVsNCtmQ0JlbFhCbUhYTld5dDBVbEduRW1ER2Z4dk9tckZO?=
 =?utf-8?B?bEgwemJwSitxc3NTZWZKMUo2SHlzVTIyTVNIUHNNUytpR0hCdDlCUjVhYVFD?=
 =?utf-8?B?eDZ6cnVaTFlhNTVkMGhkcmVMUU95L0J3L0F4UE0ra1ltV00rM05EanlsZDdV?=
 =?utf-8?B?L2JkRkVWd09aRmR3Y1pFVHlRNk5mY2htc1RONTh2clNaVHNhbm5mOWg5WWN3?=
 =?utf-8?B?UGN1ZjhxWUQ5a0ZrTlh2SEYrSTRqWkpLUEtNbmVLaDJoQVlqNnRNSWtaaXVo?=
 =?utf-8?B?bkVYQ0ZoVHlQZ0xLSzdZQmVoRkUwVVlSWlBPanVyWkU0TmNIUnphd3VSZU14?=
 =?utf-8?B?TGJVMzBrdS9lVmxEbVl4TUl3aTJFOG82SHViSHNjRFg0enVhZFZKVWQyR0hB?=
 =?utf-8?B?cXJZL3FmUkRUMmM4MXN5UTBhMEtKU3FqYUhUUnNCd0ZQZVRZb2I0RFY2aW8y?=
 =?utf-8?B?bHJZZHJYQ3BmQ0IxU25SMDk2Q1R0aUdXYlZUUkZoN3hRMU5JQ1lJR1Bxb3Fq?=
 =?utf-8?B?bktlQlY0c0pCN1J0Yk9ZTFdxbDdkNjNmR2I0SnNLc2FiQUVld2Z6OWJyVmZB?=
 =?utf-8?B?RzFpdVNtVUNaNEhaWnhuYytibzNBNDUzVjdGYVNSSTJ4MXlhTm5xTmc4ck9q?=
 =?utf-8?B?Tm1iY2R5amlic0g2cXg2d2QzdkdlOXdhSDVsV1JDQ3BBeDZzWE9vRU5MaGdH?=
 =?utf-8?B?OFJMbGczRitBWEJCUzc3ZkkvTmUvTW1KbGZWYkpJcllqekFjYVFTRHJoSGQx?=
 =?utf-8?B?ZXlMOFZZRzdlMnExeUdOb0pXRlZJTzZrUUtnNnRoNlg5MG94c21HR2NXRWZF?=
 =?utf-8?B?a09oZ3FyQlkvOGdFRm1DcGNMUnpZQkZmMzhxOEMrQ2IzMTU3ZllDeE1NdnBB?=
 =?utf-8?B?RDEvK1A0TXdhMHNVb1VQblJSWU9DY1Myb2xxUTY0VVRRZC9OelpyL1JSanRm?=
 =?utf-8?B?a1UzUzcwZzI5b1hFYUZLdzljbWE3Q2hhUDZPSlROa2g4cjlPNjlxK3BJd1Bk?=
 =?utf-8?B?MnNaa3VEU21HWStFMXhKVTZuRUROZSs3eEhjaVNuUTRjdW85SkdBMGhxdDly?=
 =?utf-8?B?TXlCYlZRcnZ2aGhFWHAzblk4OFY1d1lxNWJoUFRrYzhBcm5XNkt2eWxudFRS?=
 =?utf-8?B?K3FBRjZhc3lTclNPK2lnelB3U3BhNUFSZEJqN3JMWk9NUnZ1cEU0c0pmWERy?=
 =?utf-8?B?RWdwS2QrR1VqQXJPTEhtZTJEQitwRXFZNFA5ZTc3RWtrSzJCdEdXM1BLTmFi?=
 =?utf-8?B?ZW5TZ0xMNUdiUHBxN241WGZSbXdWMmgwZWJUaWtRMGdmOCswTUFZYVFhaUNQ?=
 =?utf-8?B?VkFNREFnMzBqOVl2dEFLSnR0RldlRmo3UXZPc2lxRHFmNlREYkFmb09CSnNU?=
 =?utf-8?B?cDNjUEpVU2Q1bEtROWlhRVV1QkVwSEZpVEpKYmxRWVJJZ3dEYlVaWVJxSEdp?=
 =?utf-8?B?b0hQSDBhTlFRM0RMVFJKZ3NkQ1FlUWphb2h3UFVyR0Zla3VuTTN1dng0aUU5?=
 =?utf-8?B?YTRIVXZ3WUNyT3JDVFB1clRXYTB6WnRtanNmc09ST05hUUx2UEQ1bU03WmlV?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 718876ff-7378-4c34-59fa-08de3ec605cb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 06:15:36.3142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnBvwLpPvzHU6Dq3HI09rsFxp5UbM8S8fnjWTuiidvvY+0U6J+eKZm+vYN1jEoz8Ir9sDz047OfFdwx68bBkkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4807
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


On 16-12-2025 13:12, Umesh Nerlige Ramappa wrote:
> SoC remapper is used to map different HW functions in the SoC to their
> respective drivers. Initialize SoC remapper during driver load.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>
> ---
> v2: (Ashutosh/Lucas)
> - s/remapper/soc_remapper/
> - return status from init during probe
> - reorder patches 1 and 2 from earlier series
> - fix copyright year
>
> v3: (Michal, Badal)
> - Kernel doc fixes
> - Alphabetical order for headers/objects
> - Add has_soc_remapper
> - Drop unnecessary headers
>
> v4: (Badal)
> - Telem and SC need separate has_ checks
> ---
>   drivers/gpu/drm/xe/Makefile          |  1 +
>   drivers/gpu/drm/xe/xe_device.c       |  5 +++++
>   drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
>   drivers/gpu/drm/xe/xe_soc_remapper.c | 21 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_soc_remapper.h | 13 +++++++++++++
>   5 files changed, 46 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
>   create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8b43e391b3d3..fda2e5e9dcc9 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -116,6 +116,7 @@ xe-y += xe_bb.o \
>   	xe_sa.o \
>   	xe_sched_job.o \
>   	xe_shrinker.o \
> +	xe_soc_remapper.o \
>   	xe_step.o \
>   	xe_survivability_mode.o \
>   	xe_sync.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 00afc84a8683..937e43591ed9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -61,6 +61,7 @@
>   #include "xe_pxp.h"
>   #include "xe_query.h"
>   #include "xe_shrinker.h"
> +#include "xe_soc_remapper.h"
>   #include "xe_survivability_mode.h"
>   #include "xe_sriov.h"
>   #include "xe_tile.h"
> @@ -969,6 +970,10 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_nvm_init(xe);
>   
> +	err = xe_soc_remapper_init(xe);
> +	if (err)
> +		return err;
> +
>   	err = xe_heci_gsc_init(xe);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 413ba4c8b62e..6da897b9f006 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -573,6 +573,12 @@ struct xe_device {
>   		struct mutex lock;
>   	} pmt;
>   
> +	/** @soc_remapper: SoC remapper object */
> +	struct {
> +		/** @soc_remapper.lock: Serialize access to SoC Remapper's index registers */
> +		spinlock_t lock;
> +	} soc_remapper;
> +
>   	/**
>   	 * @pm_callback_task: Track the active task that is running in either
>   	 * the runtime_suspend or runtime_resume callbacks.
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
> new file mode 100644
> index 000000000000..8a6749918436
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_soc_remapper.h"
> +
> +/**
> + * xe_soc_remapper_init() - Initialize SoC remapper
> + * @xe: Pointer to xe device.
> + *
> + * Initialize SoC remapper.
> +
> + * Return: 0 on success, error code on failure
> + */
> +int xe_soc_remapper_init(struct xe_device *xe)
> +{
> +	spin_lock_init(&xe->soc_remapper.lock);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
> new file mode 100644
> index 000000000000..1060ad0f5abc
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SOC_REMAPPER_H_
> +#define _XE_SOC_REMAPPER_H_
> +
> +#include "xe_device_types.h"
> +
> +int xe_soc_remapper_init(struct xe_device *xe);
> +
> +#endif
