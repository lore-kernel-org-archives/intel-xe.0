Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F29CF34C0
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 14:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2CB10E159;
	Wed, 19 Nov 2025 14:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVyWdMb/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252BF10E159
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 14:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763563643; x=1795099643;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AgCJn6UTVatX3EuCB2qcS38Gczwkeg1jrNNpmguBxNU=;
 b=dVyWdMb/j9hU2FvEI6q/St9tbEt1TRDhDig7a0zB2GkO6Hj1k8h60JWv
 fkfPjxVCBpl0goJ8gp6Bm81QIFfcNWWK5cCkzMqu0BuRojw+K6Esr4eg9
 wqvjNkuC8Tmlkpg8D8rhjiX1n2BrVnymCc5L+JzJ34psBFoPK7yOowrSc
 ZoCGasN3O+nk7kMg+NNInmQH2Sp4MExOxtgrtM14gDYq75zvupyVZ7Tic
 gt9zSRvnB3Jh6qH+Y/03WOB9zfMssf0AKTvfBUsLQY4Br3g8oAHnO6om1
 tz9w4ywi9gDPuFW+DrUmdL+hDShWfOGIx0N9M62WlxjWvLjapwyluxR3b A==;
X-CSE-ConnectionGUID: OHBWncBoTNSZLs5Mn+E5Fg==
X-CSE-MsgGUID: L+7KJY3GTQa1BC/+XsG19w==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69472671"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="69472671"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 06:47:23 -0800
X-CSE-ConnectionGUID: 5JiVrZmiS2W//Plw1m0wHA==
X-CSE-MsgGUID: AQWLbQ2OSSmLWHZhjjRXHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="191521172"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 06:47:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 06:47:22 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 06:47:22 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 06:47:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFkwCAJNCjQlx1aoNHtSDCPQPyASMtmoYs7Q/Ex2O4m9eaVprLNrI+CIEguCxr12x8DSoMgk74o9HYPExONhsiEpORwrvRGrc84lvz5DnMbs0xqUF++6/icl5T7PGjuqhJ7bRFVhI8eOoqeYMUjndgOd0YcqlxfnLtxaqJHKwtLULnJObYPWQU939139P3KaDozS9Txk72g/TuElvwK88mtlqF39oVPCXEnq5FzEUzKL4WR0VC1RVFV7KgWCDxHt82PGaoKF8eB6cLtaatWJUmJwS9vih0qAAjTz0ZGKCgWdMgBUNjUcS7wapodFIdPfWNL9VzI80E8dH31wsXcMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWOt2u6s6B0eUax07tw4AqYYbqBfj8sgQwCHkNb3nAA=;
 b=y9zv/jqOlGN4c4bgQlFlU9LiGKi0J2p9RdorreGLX5BXWK2e4GetC2EbYa9MRiJvDRqRzKxv3ZOU8eAp0H+xKAHEyiXZfSwnGlXLURvQ+vFmVjRvfobLadB7UdFvlGi1s8vHtMTJWzpZ/eOKxjhnQkcdwgFXKoZjcBy7Qslde+Zl6/B9HM+H1XMHR2BjGA0wQGnfoyrpXPzW2+IXIWrvaocU9teEvGH6pyD73Hkn23f/hicUXb/2BVnbjbX4bVA0M4qjNZsl/oPNFbZXu+nCd5Qud+VZ60wsAPFvq05Fi1Hh/Lsye/Q9uAdbngrHGEsBGmDWjGpewHA4r2SOFfg5AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PR11MB8735.namprd11.prod.outlook.com (2603:10b6:0:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 14:47:18 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 14:47:16 +0000
Message-ID: <852d2d8e-e54b-40ed-84d1-23e6bd8a3a5d@intel.com>
Date: Wed, 19 Nov 2025 15:47:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/xe/vf: Enable VF migration only on supported
 GUC versions
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251118114116.3429730-1-satyanarayana.k.v.p@intel.com>
 <20251118114116.3429730-2-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251118114116.3429730-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PR11MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a74f34-d19a-4abe-8bf9-08de277a8862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFFXbEszUU1KR01BLzNkT1duYS8xM1oySzRJamJNdWlpUStoZ0RWZm9yS0U4?=
 =?utf-8?B?Mm9mVXhXM0txbUJHek5JRmJMTDZDVTE3NllqZWhtc0VvYVhSM3ZQcFJNS2F3?=
 =?utf-8?B?b0d6SkxxQWpEdU5ZZXFqUENYZUNMeUdhditFN0FoaVZ2NUh4VThaNGtyVXpr?=
 =?utf-8?B?cE5BN216ZVoxeFh3emRzbzUvWURiNkJnazNhWEZlVGlJb1dYTk1xMkpxdVE1?=
 =?utf-8?B?bnM2MHZWNGNqcnYwYnFUQkU1R3ZBOWQyY05RSGJuTzRjZkFGRkdtNlRqRXlN?=
 =?utf-8?B?NEhHa3hJSEhXWTZyT2lFRXZ6Sk5iVmRrTEM1bUk0eE51U0JMVFBsVjE0WjhT?=
 =?utf-8?B?ZzFGUnJTOE9EK3RCM0dQUnhueFJaMDFxZ2FOY3hYRDJLRlRWVmI5dlBNUitC?=
 =?utf-8?B?TFJEREhYSHpEQ1RHQ2c1Ylg4Y2l3UE9KM1FoRHpSUDVabk9obCsyTkROT01L?=
 =?utf-8?B?azhCNytEaWprRm1HV0k0MGg5VDFyTWZGSTBtcHhpRFJmalprMVVIcVN2RjVO?=
 =?utf-8?B?cjFoM3hia21LU2Y2ZFI1azB5OXpqbDFRZnZrOXZlRUxXZkVDMlg3UVNxemEz?=
 =?utf-8?B?azBjMHRXRFVjSW5QQnp2aHE1WWlpTzdPVnJHV1k5elhUbkhqY2NaKzdxemNY?=
 =?utf-8?B?YU05WjBoL0JadkphejhZNVJCSTAxMk9iempBdFFRTUExV2gyaFYxU0xIM1dD?=
 =?utf-8?B?RkJvMWk1ZnlLYzRLVnRnS3RncmVPOFhKcmpjMXVPbXpGLzVRd1pkRzFhN2Vr?=
 =?utf-8?B?djJZYUtiMWtIdmpSOHpMQ1FVN0xXNU00Z1kwNk1nODBrem1CbDI3cENYK3dB?=
 =?utf-8?B?QjhMdGo2N01mOUlaVk9FL3hncDQwdCtwZ0hFUDNCN2MyWHA5VWtxYmlrdG5E?=
 =?utf-8?B?ekpBNkNiUWxnUENaMWNQMTV0bzZ5YzNkU0JyOGxENG1udTVCaUVhSmR0QzJV?=
 =?utf-8?B?MTN4dTdmR2ZVSUlBQXhGaWZObVZXUlo5T1JJcC9raENBblkrclJRYzFRdW5J?=
 =?utf-8?B?ZUM3WU1DMUVZMHRYOENXc3NhRCsrd0RLSG1mYy85N0hjelVidFpueXl3V1Nk?=
 =?utf-8?B?RnNocWRuUzl0dWR2YnNUbHpuSW1WdWR5L3pzZFRDcHk3aFJRTFRMNHY5SS9p?=
 =?utf-8?B?RFh1TFJOZXNCNFBxUUdGOWsyd3FJNGRFTXFQVlRhd2RlMHloTUJ6a1ZGYXpW?=
 =?utf-8?B?bHRNV2VldlI0RTJrVUN3MU4rdjVCWEoxcUZwSENBMXY2NWcxazRSSndUVWN4?=
 =?utf-8?B?YmloRitQRnJLcFY5NFUrMldUbzNIK21JU1A4N25IS1NUcVRwUmU4bjJUU1h5?=
 =?utf-8?B?MENFbUpYY3p6bDdFQ1NrVVhkVUJqNWlaWWpxUWppNmdoN3lKRDBZOU81TFcx?=
 =?utf-8?B?M05nNThwaExhb0NlWVBYbmp5U3FPL0RFcHErT2R4NDFDZTA0WnB0NzRQWTlX?=
 =?utf-8?B?bm95SktqK21INmoyb0FIeC9qbHN2ZXJhelRCOFQxWVExWkVhQW5KcWpNYzNq?=
 =?utf-8?B?Ly9vSlZ5Y1p0SS8wSXFnT0VVZlFMUVpIY3VWYXVndSs5Qnp5NFA5UGpsOU9X?=
 =?utf-8?B?YzRUM1crR0lla2hxdFdjQ1YxMEpadko3cndoTVQ1aWYrN3FZaFRhUXlUZHI2?=
 =?utf-8?B?TDAyM2wweFNET1FncGV0QUp4NVUrSlZYb0JZQ2pkTWZnTG05WWxSZ0JrUzRs?=
 =?utf-8?B?YWZIU2NqeEtNY21ZRFlSeWdTQUdrUHZOSkRBRGlqc21wMlhFVVBVb1BFQ2R6?=
 =?utf-8?B?MzZpN1VXNDlPeFpHaUJYMFZPOVd4NmExUTBhdXFDOHcyS0gyRDNPeE4velk2?=
 =?utf-8?B?MkV2Q2hoanU5U3B1Z3gyd1dBbXdIM1Y1RjNpclJCbDJobWZBZGVwQ25IVnA5?=
 =?utf-8?B?UWk5K0E5blNrMFBzdGlWTmVTZ3N5aE14VlVFR2EvTjVQV1pxYnMwVHhaZ1JW?=
 =?utf-8?Q?NgBuY9Z751MWNf7I+54kvgVQvBV3uoQJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFBnK3FOVXlEd0hhbmtPTXAvQktkQVMySmwwWUNyOVQzeGE4V05jT3VqcUo3?=
 =?utf-8?B?bEtmb2N1d2ErRjIvN20wcm9odjRNcUtlYW9kdmVrR0phZWFtR2RRekE4TmdN?=
 =?utf-8?B?RmlFSkl4eEZURTdscVo3UEpUQTFSNS9ZcG1UeUxQR2xHWk5PSVF5QzY4TVBY?=
 =?utf-8?B?UnArd1ZUdjd6eTNQU0hTNTFxbmlad1RacDRqK285UVJwbVp5V2QrM0FDcTcv?=
 =?utf-8?B?SGFIZXZ2bzVzVHdXNUxQdGpiZWtVaDBLV1haeFIweHMyYzdpSmsydG41TE11?=
 =?utf-8?B?U2JSQmxadTNpNFdka1YxQnY2OVlqbWwxOFh4cUJVSmJFaEhMdEc0NnUrNjVF?=
 =?utf-8?B?M0gvdjVPVGlUelhjQ1lrVWwzWVVaRllpd050RzlrZ0pJNHhQSGM3RXJHaVhE?=
 =?utf-8?B?ZGwrME1WUURYV3N2N3JwT2NsN3NIR2RTeGt5cWJ2Y0xwL2hTRUtJNFFmU0Zj?=
 =?utf-8?B?UXVPa0ZZZmdvQ21UQXpvbnB6VFpnWWdjV0prRU9ETWdkNjFyTlFFUTQ0OWpY?=
 =?utf-8?B?aU1GSC9FOEhnR09nVWhnTitadHp5ODB4dGZQa3BKMXRRUTJheWg5SzQ4WGo0?=
 =?utf-8?B?MkQveGRPWWtKRmM3QkxKQXJhVWN0LzRrcFFHTnhwd096cTdVLzFJVDMxZnB6?=
 =?utf-8?B?M3ZjeUozQ0NPVUdVVmQrcFQvWFhadWNWYWxRc1lDd1kvNjZlS3pNaDlWVFp6?=
 =?utf-8?B?RUFkNVlaU1RaK09OWVdoYXlzVkgya29pSGQ0NUdzaUcyQ2Q2aWY1OG9wVXY0?=
 =?utf-8?B?dFhmVTQ2VnArWFRaNFFJV0twN2lrN0FQUE1CL1hnNTBDS2lscDRVZDB0dWVC?=
 =?utf-8?B?bExUZ2JBY1hJZXBRU1duSlRKMHVxWEh2RDkzU2M1dm1HaVpNVU1jd29UcG80?=
 =?utf-8?B?MFI0ZkNObDlDRFE0UktvZVdQOHFsM21SajVrN3RKaVAzUjV3MGV6TnoxNnp0?=
 =?utf-8?B?MDVQWDFrVXNKU2FrcTBUMG8yK0Z4R3hRcm1qWFMwSytOWTFJMUNVSk5WZFBX?=
 =?utf-8?B?dkora3FXQnZjRmZEVHRxRGtnZWZxcUlXejNKTUgrUFdDUVJlM2pFdTh1bXF5?=
 =?utf-8?B?N1VjZjFQUGVHTEw2VkhVckVxRlhNQURNdEdFWEJOMFJOYXExRTd6ZVd5VGJk?=
 =?utf-8?B?VGRFaC9mZUlHRlBaRHRjWThTditEZS9CWnA0SXJmbTd5T1NqNXNrME5pMGdu?=
 =?utf-8?B?Y2FCa1RLQ2hIbVlKOWl2QmhxRjk5UGdONkcrcEFlVlM3aFpXZUM3Z2xmdjVK?=
 =?utf-8?B?UkxFT0djUUViOGtWUkUzTnlxck1McUFYY3FLV01QOHV1cnpZVWZGUHBIZzh0?=
 =?utf-8?B?c05mcGVlTkEzOFRhTEMyQmFpZEszaWpWUUNkMWNCTHJkTlBwakJrOWZncXNp?=
 =?utf-8?B?eE15MkZFZ0p0b2FydExTdnNIbVlKRnUyN2M2aWdTU3dWT29jcENMYVdkZzJw?=
 =?utf-8?B?dVppSzB3KzA5VDI4WEpSb1NCaTJmTng0dkhKRGx2OVRiN2VpNndPZWk3YWlu?=
 =?utf-8?B?Z01ScFZwL3lmZ2R4NjV3ZGFsSU96ZCtCdW9VWU9QYjd5eDV6cGR5QW42SzZi?=
 =?utf-8?B?ZGhZOHpjNUlkM2ttZ29ibnZzcGZLMkhONVhzOWErdzhBSmlWL3FGcGpBUHVk?=
 =?utf-8?B?cms0cTNDSkg2MGRQeWp0dkVMOGVzY0xiKzlvQ2FnSlF0V1ltNEdWRUp1MmVK?=
 =?utf-8?B?blhxQXJWalA4UU14ZU5UVE8zZlJLR1ZZd0JJTzNGMzZETHF5VlYyNkVjNzZt?=
 =?utf-8?B?Mm13TzNaT0pxZHFrVHc2eXBLNzdoQVF0dWtTcHU5d29yRzlad3RCT0hOUE41?=
 =?utf-8?B?U2RnUHhZaFBocDBFVFo0d2RYYjg5ZC9LeldEUG02cGFpZkt5ckRBN1k4VThX?=
 =?utf-8?B?eFRackQ5NlpaOFB3SWh1Q3FBcHQvV3FsMzFxU3ZtbXJoa21xU0oyeXl0U0Zs?=
 =?utf-8?B?UXJ0RjZvZHJWbzhJalJoWDNlVkVrR1hMSzlKWTdGaUh4SXBVYmJaaVNWSzFI?=
 =?utf-8?B?bnVLMVN4VDlMVmh0VG5KWTNna2FiSUFGY0UwQkFLQWRkZ1BZS3B6bXBGMnlQ?=
 =?utf-8?B?ODRWSk5PTjVQK1VDcHA3UGYrWUJOVDUyT0tQajZ0VFVDSVZKcWpSZHFNeTdK?=
 =?utf-8?B?c1ZZSjlsd0NWZGs0Q1dNR1Q4NzNXYU9jUW1GQWNhZUtFM3liQXRyM0FaN0R5?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a74f34-d19a-4abe-8bf9-08de277a8862
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 14:47:16.3449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjPYR18vfxwk43rF46TXu67zpZrseZ+3IxeEUHbyjUlDfPuwO8seqyHdwcr4a+fT1V+sLowUsqMhBvK6RffUnsYEZtn/YZrdF4bIit7RLVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8735
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



On 11/18/2025 12:41 PM, Satyanarayana K V P wrote:
> Enable VF migration starting with GUC 70.54.0 (compatibility version
> 1.27.0). Gate the feature on the GuC firmware version and keep it disabled
> on older or unsupported versions.

hmm, do we need this second sentence?

and please use "GuC" naming everywhere

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V3 -> V4:
> - New commit
> 
> V2 -> V3:
> - None.
> 
> V1 -> V2:
> - None.
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 284ce37ca92d..b73498097df5 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -180,6 +180,18 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>   */
>  int xe_sriov_vf_init_late(struct xe_device *xe)
>  {
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	struct xe_uc_fw_version guc_version;
> +
> +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 27, 0)) {
> +		xe_sriov_vf_migration_disable(xe,
> +					      "requires GUC ABI >= 1.27.0, but only %u.%u.%u found",
> +					      guc_version.major, guc_version.minor,
> +					      guc_version.patch);
> +		return 0;
> +	}

and move this code to the vf_migration_init_late() helper, like
we did in xe_sriov_vf_init_early() and vf_migration_init_early()

> +
>  	return xe_sriov_vf_ccs_init(xe);
>  }
>  

