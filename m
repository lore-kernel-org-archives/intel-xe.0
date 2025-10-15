Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882A2CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 09:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4494D10E286;
	Wed, 15 Oct 2025 09:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bUfS1KUW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704B810E286
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 09:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760522227; x=1792058227;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3A5MdlrRY7nsbY+YAudOQKxEI3XVNa6G6BHYWaPP+fw=;
 b=bUfS1KUWSydHZAfu6SkLVoVbwqRtN4EY6EAFhP3Qc6uYeD64JOTG7vsS
 0SFdyuz1lgmSquLBR0HpUyofWeAoW+TNttNV/e97GERquTq3Ot5C+tq7f
 HeUE/yxE3apDDCIfwrcrFpnNbA5b6H2FBnq3hmqSFPoPPXAaqiKQ64+W+
 DbhiezRA7ZJ36X/cOdCdfre/LWESJls8uPXde7VUxz638Kr8v0Akn4RE+
 WGufa/DycJuSHjL+/Wi77tiaEJHT5NMZ14TYXPUQ5jrkvRR+99+hwx1yn
 PW69gcOSol7NyPRo0e2C14N0VogUE8rgHoRm9GYJUNmwJm6obdBlI9ntp Q==;
X-CSE-ConnectionGUID: WViAdCnPSEWyqytNlo0Ssg==
X-CSE-MsgGUID: W1chy37HSZuFa7147TF7BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66520765"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66520765"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:57:06 -0700
X-CSE-ConnectionGUID: PHfle8TqSNuVQ2616YzSgw==
X-CSE-MsgGUID: 5MZReCcLRYyngt/LiojQMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="213076172"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:57:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 02:57:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 02:57:05 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.35)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 02:57:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGYx+hSv4RAwaWpa8bNCdns+ggXYX7lsmsyib9FPLQanUh51K+IEejQM6Ryz1thn7wJe6d3+ECb0kzlNnSuCkZRCPsHOoSSELcGCXVBXqe5coxNy1xsiwiJ/9BX1waXv+PScohwMF1mLMPXhNynsGkGgeFbDznfBxI+TgmQg+E3KpzpN01aVAGAjWBsv3tK3m3R42KSgBD+KovRkt4wunFZZe5Ie2shBXXxOUvWthIn/ZIq5CpXLCaeYztSaH18V/nUpWaewkx9/gOiOXLw3Tox6Ys4Mc9bdQhBjvcW+WJ2PlPjiUM3i0ZHmoqfLFa4DQlNyS7ckeCqkNxwgBYtj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoR1Qr2EOINNWFlUKDUe+XTFSMaYsiHFj/CGsP3H6q0=;
 b=PoVcuhN055xb5l7kUwzhgzXGiUpV6koDWvSKoIFhS5xV1IxOC7fRnHUlJI+QhdXD8fgstJGyclRAxBjTUN04hGcdwMU1OXVlUp8vUwvv++9xmwxigdHTlS2GkOtPAKED6yZsy5qgyfuppbQ/gxE0DHVNp3N7Nudy57cxdkRqtblXkZNKg0AT8P3h/+UZ1nx7L5wfvFdewUkWq0YsAhHMh1OXbncFFidnF2Y5yJVUIsh64bj2MekZVweFcuhMj7bBtAE5UwZ4Zvy9fN9hd9qFxBZbG3Kmujl3Yd6vDLDwlTF2dRiBA+intgDPY+Znt1+ng8lt1nm14UlLrt1ra7RGJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS0PR11MB7214.namprd11.prod.outlook.com (2603:10b6:8:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 09:57:02 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 09:57:02 +0000
Date: Wed, 15 Oct 2025 15:26:55 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Shekhar Chauhan <shekhar.chauhan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 07/23] drm/xe/xe3p_lpm: Handle MCR steering
Message-ID: <aO9v56fugMdv8qCf@bvivekan-mobl1>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-7-bfb74f038215@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-7-bfb74f038215@intel.com>
X-ClientProxiedBy: MA5PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::16) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS0PR11MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 563b13e7-9676-43da-51cc-08de0bd1309e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUFhRzAyWUhtU0dOdmFhSzQ1U09qeVNEN3NIaFlpcVVsWWtGUGp2NnBFbGVH?=
 =?utf-8?B?R0RHYUFhSmUvczk2blExcGdwUTJWQTd5TmduRCs5WEVlMGFHcTZJT2dCdEdv?=
 =?utf-8?B?bWt5V0VKUmwrZVhtbHRhcnA4Q2g0KzIyN0grUlcyYWhZSnlkRXIrelkwRjV2?=
 =?utf-8?B?R0F3eVJhbDc0Wm5SYnU1cjZyVmd4SEU4R1RjdS83VFY3K2JRUmVaYVFVQVcx?=
 =?utf-8?B?UXpLelRiMzZ1a2Q1OFJNb0ovYnIwdERNUCtDV2MyOFJNVU5YWVp6SUpQbjk5?=
 =?utf-8?B?Nzl4NHk4cUZJZHQ2WWNVNzB4QTNjd2kxZEFEMlFlcVcyRHEzMWxPZEtJOHBF?=
 =?utf-8?B?R1RkSGsrRTRQSzRmb0drY0s2blh5VDBqaTBPS3RxVVY0UmR0UGVnOHFlSk5j?=
 =?utf-8?B?L2c4SERpWDltaTk4SHh1YjRKQ2FNY3VFUHg1YkZ5bG92UndmUnBHQ1drMFY0?=
 =?utf-8?B?YXFvUzhIVW5OWHdiQWxkWVFBY1RxTkJpRjF0cGlDeStLYXJQSWJSQ0JwSG02?=
 =?utf-8?B?bnJKcWNUYUM3VGV6Y05YdWw1cVJyeE1jUVBmSE5aaDVZZ0VuOHRZT1Y2NUlZ?=
 =?utf-8?B?b1Y1SmQ3YVBRUlpicm1vOFlqekpEZGs5aGNOdm1UNzhvejRENG81TnRHc0RB?=
 =?utf-8?B?ZXg5dEhTSnVaM0l4OXI0bGpKRS9GS2I2TkFOc3k1Wm93V1lzelNzSG9haXE2?=
 =?utf-8?B?cm1aaW5XK3lZdWNvOU8vWjVFSVFIcnhiRTMwaVlLa2FnQWZoTC9sRkJIUVdU?=
 =?utf-8?B?K2NHMVNSWXZYaDU3WVR6U2JDb0g4M2kxclBYRlVydFZFWURTdUw0cllXTU0r?=
 =?utf-8?B?V2wyQWtLUW5pZWYxNGczb1BkRFVqYmE5aGZqSzVsRG1FQmE1SnEydlQ5R3VQ?=
 =?utf-8?B?amh3eFIyaklIaXRpMmlxRzMrdk01U2g0SFJlSGs2UE9oY3BpcUliTytuK2dZ?=
 =?utf-8?B?Tis3dzlhMEVoMUczMkdxZ1E4TWxtZDdiMzVGT09EVDBRaEpyUFk2Q0dUTnJN?=
 =?utf-8?B?QzJXVzlaUDQwNEpiRFdjS0ZsVW9ZQ2U2cDZIQWU0V0ZlZUJ1bHZWQWtha0gz?=
 =?utf-8?B?aEZGWW5VN1ZkRERHZDBCL3Bmb3RKWlJLUTJ2dENPNktsTFVsZkdaMnhrTW5M?=
 =?utf-8?B?b3RxcDBQcTlCczkvZW1BU2FkKzN0SmJSU3kwZTZkMWZjK3BsT2xqSkJzSWtp?=
 =?utf-8?B?VzdGYmZEcWZnV3N0aGNVMys5cUtEUjd0ei9pYW0zaXBta2lFQUJqeWp2N2ds?=
 =?utf-8?B?MzJDbnBwNVVESzBKbWhDaEdUTVZGblpxcDNNTUROcitoOHllREx1TGxtUmU2?=
 =?utf-8?B?WEtzUU0vbHlLaHc1WStNMmczT1Y3N1BxQ1NDdjFNaHNkWlNoRUNzbnJMVUtz?=
 =?utf-8?B?WDlqUnlpUThkODgxekpLN3I0cWdtbjJqY3NnaEYxNTdZR05hdDF3VFdIYW5x?=
 =?utf-8?B?RlRZZU9LbWpQSzdCSkhWKytTSjlXVVYxd29qUUw4WGZQRWN4Q2RlWDAzbmoy?=
 =?utf-8?B?eVYzYmpYdDdrVkxnM0gwYlFxbFpqaS9PNU1oSlc5ZSswZGQ3T1orNVBtc0w2?=
 =?utf-8?B?KzJwRTRhZkVZSFRjQk95TnBiai91c2k4K0MzbFlFQ2lLaFlrVWJ6VWcwZzBo?=
 =?utf-8?B?SmU2dnFjcE0rZVh4eldpOGEvNXFLMDk0Sk80QXIvd2lnbEE3QUtkQzByQkp2?=
 =?utf-8?B?MHdmU2ZldCtQNGdCeUNhYTFhblBqQWE2NDJGcVk5SEhVelJmMnZrWFdjSG9T?=
 =?utf-8?B?RTFlY1hMYm56bHF4djNPKzdUM2s1enJONjNDbnovYlJ0ZEswSW5NMlEzVjlO?=
 =?utf-8?B?cVN5dnA1OW5UT3ltSWtWdGhLWkhwQnJQUm5JN0pTWTZKMlZjQkJUSitoWlAr?=
 =?utf-8?B?MTlkeGREaFl6c1hraE81eXUxVkZGUmFOcDRXZ2Nyb2VsRFM4TU5ZbGZQYWhq?=
 =?utf-8?Q?iPCe2zRInTbIKjEgMTmPA86wTJn6XcPB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkNST2MwZUt6T2wxZERTeE1ZdEdLcXEvYVJ6ZHVWL242cnRGR0pZczJnandS?=
 =?utf-8?B?a1U3aTBkcng0eXY3VjZySWg5NTkxL1Qwa1ZzQ2oxMU5DSGxJaTV0em5Oai95?=
 =?utf-8?B?eXI1SFpwS0lacWlTdC9ncmhxY3FoVHpqaE9OeGlhMVNGbWxYcDkzQmQrTTBL?=
 =?utf-8?B?ZDM1RzRicjRwY1Z1a1pGL3ByTXBQV2wrTUxaQ2lMRTI4THRudDNOK1ZCY2R2?=
 =?utf-8?B?RVBGdndKKzN4Ym5pSElXa25DYzFRRElORG5ScGxQR1I4RStCMUpZeW81dVFk?=
 =?utf-8?B?Y3lpcGZnT21Ha0ZrakxQaW9zZWtTUW5LRitSbUhRMXNQNVBxTGFGSVMyQ2x0?=
 =?utf-8?B?NjhmWTZGRHNMdW5ocVNnM1JPNVd5eVJQM3IzczVKY3NSbjhjYmMyVHRjQmY4?=
 =?utf-8?B?T2xLa0JrRUhOVVZEaHVIV2VkcHdvbFdIVEFUL3A1LzZURVozWEpPTFhiYWdI?=
 =?utf-8?B?Z3hRRWxuUitDa3BuU20rRTk1a0RTQlZncHBxN25SS3pVZ3lPU2xpUGRzRVBJ?=
 =?utf-8?B?bDZrMlQwWUFhczlLb3ZoeDBFNFllS3BPMEdTTnJhYkhKaFVwaWU3S29IN05z?=
 =?utf-8?B?bkF4R0U1bFpNby9CdGtJV0twbnd3YUVNNEplWmhNT2JiWmN1aHVqcVdRWVlV?=
 =?utf-8?B?UE9CRXZIZndnSkJBZmdQM3d2R3doWlFISW1TSlZmaktoYlRSNFNSbkh6VElp?=
 =?utf-8?B?WnZoazdDa0pOeG03TlE2TUxQT2xmK3VWd1lNRUNLZEpzNTFja3p6dlYzM0ox?=
 =?utf-8?B?THVueUxHYzhkVmtDbVMwMENFTDBKTW4wSVRmMktDbzB6NEtCUk5pcElhZEJP?=
 =?utf-8?B?VzJDMENsSVZnYldsUU5udm1mTEw3QkcvK2ZSTGdCb3gyVzU5YTBqVjYxUEN5?=
 =?utf-8?B?bEI4ajZRQlljQm9QemFEZWxNM1BFMFU1bWc2cXNNMXBNV0VYd3ZEK2hYMFJO?=
 =?utf-8?B?WURXWWxZdEhUakFIYUdGUFNFRGVIU3JjcjhGRmc2L1Mzam9rNjRVS3o2NXFC?=
 =?utf-8?B?bmJkVVhMbndtaVdONXBCcGw4eWliNCtTNUQ0TnlLQ0U2REY5dGhaYTBIYWZ5?=
 =?utf-8?B?Sk1ramRZK0NFek0ybDcrL0tCM2dWQnNpejdJNmo2S0N1UWVxSkkxTzVkc3Jx?=
 =?utf-8?B?cnFaOGl5dWQyckx6WWRDUHk1YkZnbkFDVzYxTUdyNjAxM0pCWTR3aUN6SFo0?=
 =?utf-8?B?Kzd5K040UEFYTk51Rk1uZ1d4aXlmeVlLY1VTN2hWM2VPcExTTC8wVjQrSWxU?=
 =?utf-8?B?MTVKUnRKR3B0SjI4RXJZdGk3clZZZWIwb0pJVWVmd0pQSGRUbTA5emM3RDJE?=
 =?utf-8?B?RnNUVEFKN2R5QjN0TnRaSzlhTDk5TUZUNThuczR6OXF1U2ZBQVY5VTdETXlY?=
 =?utf-8?B?SnJpeHdmYSsxT2NtbTEyd24zZVU2ajB1dXR4cWZuQzg1SUk4QlFKT0s0SzN1?=
 =?utf-8?B?di9vdEtRZkFocE5SQXluSlhiSS9hcUlGckdwdVF5eXNaSW1wdG9LUXN0N0xQ?=
 =?utf-8?B?M2lPZmxQRVVRdkZJZ3N1WC9XbVV5UEk0RFRJMUwyL3crMDFIdzAzbmZTdDht?=
 =?utf-8?B?MGJIbi9hbVluSVpyWE1oN3dqWUQ1bzgvOXRjOUJ2NnhydFhwQTN4Sm03cExa?=
 =?utf-8?B?ZzJwcndOelM3V3d1OGpLYy9BK1hKVjJMMzRCRmN2RnJRNlNxSTNGejhKNDN0?=
 =?utf-8?B?N0lOTUFtWmZWKzFFSVI1Q3NLNjlJbUljdXkrK09lc0NKenRXa1ZsTDg0TjBJ?=
 =?utf-8?B?L0wyd3ZYVG91cGdRZElXWUhNSzJGa2VaSExDL1gyeU1La1BSOXFsejJ3MjM4?=
 =?utf-8?B?ZGhQTGxRZEJtQnhQaTdtL0J6WGkwWS9yWHpJUk56Z0crRTNadWNyZ2dIWGNy?=
 =?utf-8?B?UEhDQXZMeTRHUDRMZUdKZkx4MFJhSXBOa3VhZ1NKMENFMTBWZ3Axa0dtK09p?=
 =?utf-8?B?VW5TNG93OVBuRUxlRFlQMzRNY3pjRWxXeGNnWkI3OStPamFZWlhwTkJFcFpF?=
 =?utf-8?B?MUZaNjc1UTRQM0FMeTRNWDJPU3JIenZsTEQyMkZHWHE2Ykl5Y2xsQk9GQ0RS?=
 =?utf-8?B?MjlWajJ1QysyRVQzOWFvcUZUcDdld0Z0d2VWcEZSU29mS3ZSN2xKcGJGZ0t1?=
 =?utf-8?B?NjJJL2k3cnpXV1RuZFRYbzc2c0RFTHpTV3NEbFNnOWVmUVJXVjgxSENDQkFx?=
 =?utf-8?Q?HFbuLzzDz83t9Uxe6nev+oI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 563b13e7-9676-43da-51cc-08de0bd1309e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 09:57:02.8030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6Qcy6zD1vRuddpaziFX+HOvBTrBdmVMot8Nx7tLThYNTFdbvMez+9o2z5OW1tMwAD6yN7zI/sZ2qpT+46Z8Sx34i0UF9N0HGd60CPLLZXaxJTCC0uGKqvgCdN162387
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7214
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

On 13.10.2025 20:24, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Xe3p_LPM's MCR steering has the same ranges and behavior as Xe3_LPM.
> However one register range that was reserved on Xe3_LPM has now become a
> unicast range (0x384200-0x38427F), so we need to stop consolidating the
> adjacent MCR ranges into a single table entry in the table.  With this
> change to the Xe3_LPM table, we can continue to use the same table for
> both IP families.
> 
> While we're touching this table, take the opportunity to fix a
> whitespace mistake and clarify that one of the other consolidated range
> entries includes a reserved range.
> 
> Bspec: 76445
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 8fb1cae917244..e1a2b38fc2a86 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -236,12 +236,13 @@ static const struct xe_mmio_range xe2lpm_instance0_steering_table[] = {
>  };
>  
>  static const struct xe_mmio_range xe3lpm_instance0_steering_table[] = {
> -	{ 0x384000, 0x3847DF },         /* GAM, rsvd, GAM */
> +	{ 0x384000, 0x3841FF },         /* GAM */
> +	{ 0x384400, 0x3847DF },         /* GAM */
>  	{ 0x384900, 0x384AFF },         /* GAM */
>  	{ 0x389560, 0x3895FF },         /* MEDIAINF */
>  	{ 0x38B600, 0x38B8FF },         /* L3BANK */
>  	{ 0x38C800, 0x38D07F },         /* GAM, MEDIAINF */
> -	{ 0x38D0D0, 0x38F0FF },		/* MEDIAINF, GAM */
> +	{ 0x38D0D0, 0x38F0FF },         /* MEDIAINF, rsvd, GAM */
>  	{ 0x393C00, 0x393C7F },         /* MEDIAINF */
>  	{},
>  };
> 
> -- 
> 2.51.0
> 
