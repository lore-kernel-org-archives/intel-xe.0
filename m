Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889F6EE498F
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 10:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FD410E85B;
	Wed, 11 Sep 2024 10:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="neyOHY0m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB4E10E85B
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726051218; x=1757587218;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=g/GeoU7kJnRPlYByn8bnDOCAhQOLvdzvMhvyDqKRkmw=;
 b=neyOHY0m59HMUH7zFNGllbMOq/5VEAKrQK0JATN7qamRRerNYAEt3qbu
 uX769f+VnR7kCcDTS8Y0me+X2FyKXLhcqcnq7hb2XsFyJI7n1TtUfn+t0
 2j9AHLq3EUlatx0k0+VC3NGM/8+QdvTKwEk30KL+usYoew5cYzBkCzPbw
 00OT/qLYbQwHq2U9EZ0CWYfn4PvLhBVBw1tIza//MZUrh8JXIK4zDXGbG
 OY8Mq4otpa6vE8ffVYqemnaAX6qsIdp1WFW6D+ZyeIxgpt+9Fw0xk1etH
 4QeSsMDXOjWKiqzxS8LnMK2K/S78ndfDiwJSPhvHovzJyBpWlNJPFJP5r A==;
X-CSE-ConnectionGUID: jJAXgwiPSjW29yNKpt1FGA==
X-CSE-MsgGUID: vNOkX4GzROqtM0W/bR4sEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28729588"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="28729588"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 03:40:16 -0700
X-CSE-ConnectionGUID: IE37GfrGRnyrwDLlpXoM1A==
X-CSE-MsgGUID: E3re5MRdSZWAIzL/OhOOlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="72318401"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 03:40:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 03:40:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 03:40:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 03:40:15 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 03:40:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnG9fVyb3vf2TRd/aDsq9ZsFwOxH14tsJZpDAgdskKuZlGk5qfSQxdLiUQOmTosqseh963+X7T+Zoik8pjPtzeIk0ZX6UEdIT7nCAzB+695xbdpr1jJ5WTOfHA3WX52G9TX9Kew/t4KG03wPmpjCXR7hMpEr7vj9kqPStwy4nukCxv8qgvcT4MdOTLqvG6O+koKMhiHkSFX8agwhKEYgfo8dlEyxo4FIriIYXGjUNGCxrLeMBTL6jTLsvweS7afEr9wHB6LKolyrCyxZN7opOpjy4OUl7p+SPNor2pzkvR8hZ/Ic8PgjrJVJCcoc59HL4dtUWBHLmLomzG3VBljmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m89utky9bBRNwIEi6va/078E1pKFwql7teRkt2T9cK8=;
 b=kGeOa6bbi1wFPgmR/LR6TTyZtlW4pL/aTm+bTeoEKKDpvqmoKSpaVNBs24CIo7m/MD02KvVcnw3rVMFzwjG7/lZOD01TvnUtSAhF8mH4eY+wVh0cHsS3UsPKLDscfsKKsh5tnyRvW/jy/CglT8WdiD+oXUNRis4KI7TAYV+HnJ8Ibn6D5UqJ3WkpI2ffygtyVkWx9C/7oDQBDf0VzFd2/6Tykh9/hKL5AAgmxZ68e6Swo1BtN25BVDCMeTDCxmz00uTLfAS+JL0qiPriDfWBoH9o6BuING7NSpP673QBq6/ArtCnJaTEZTHZOzqQWjHNcgneSERVEupuGz/A4wa7ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB6567.namprd11.prod.outlook.com (2603:10b6:806:252::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 11 Sep
 2024 10:40:12 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 10:40:12 +0000
Date: Wed, 11 Sep 2024 12:40:04 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v5] drm/xe: Add driver load error injection
Message-ID: <ZuFzhBHH3TKDAPel@fdugast-desk>
References: <20240910152241.1554435-1-francois.dugast@intel.com>
 <ZuC2BiKnZEaXAY1N@intel.com>
 <tpweqdb7sux3pfnz6762omn5jate6xugqfxmm7wcfq3gf7qfmv@5ukqvov3au42>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tpweqdb7sux3pfnz6762omn5jate6xugqfxmm7wcfq3gf7qfmv@5ukqvov3au42>
Organization: Intel Corporation
X-ClientProxiedBy: ZR0P278CA0109.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::6) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 12cd90c9-c92e-4f2d-dac7-08dcd24e1d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmlSR3Fsa293ZU5IRU5FVFJUUnhsRmJRck54REt5eVFwNnhQNnNxU3VTNGJW?=
 =?utf-8?B?dlJja0dRRDNsV2p6T0gxenUzQkxxeHlsNHZCay9tZjZGUHk4VU5CM2QxckEy?=
 =?utf-8?B?UjZXdGYyYmRLTjgrVU5aYUZ6RE5zc1F2Vk1MRGJYdVNRZlJSeHFoU3lCQUNp?=
 =?utf-8?B?RFdsOHBSSVJUMTRFY3hXQzlWQjZCMElWNnNEcUlOWmplSkp1VmlFTGwxUUdG?=
 =?utf-8?B?MDV4eXRzTWFBZnVLS0xRRmN2TitFS0ZTVmxGNTlXZjRPUC9TY2ZNOTFaalQ1?=
 =?utf-8?B?cHlONGZ2R29tdnZVRk5WcGhFby9TRXJ1TGhPclozc24rYkFIWXBjTGpqdHJF?=
 =?utf-8?B?cWcvTFE1SUdVSXptdFRScDRoRVVGZTdrRFdhWWlaKzVWRG5xL0tjMisxTzFw?=
 =?utf-8?B?elNGYXY4VnFkMTZGQ1NBUmtIcHJBKzJCUi9pSnd1RlRXeit4NmlhbUN2YzVj?=
 =?utf-8?B?T0hLd1Z4YXVGY1d2NitkdkcyV1dsZTBjS2NSYUczeFdJSGN0TENPckRXeXEw?=
 =?utf-8?B?RGxOQk5oWTI2ZkI0blFXdjR3a2ZBRnZrb3hMb2U0bW5pcXhHejVpV2dvWjJ6?=
 =?utf-8?B?WktBY0VOckp0L0NkQnJOTE5GQ1BrOGdMQ1M4M0Nyclpqd0ZnZDB5ZTRQN3Zh?=
 =?utf-8?B?TmZybEVZL3FvWHhDVDBzUURub0EvTEZZUHZLODdzK044cUpONEgybC9VeEJ2?=
 =?utf-8?B?QTk4N1N1eEJzaTZqMGRiWE1jU1JNTXMwRlNXL3NaMGlQaThpM1Rtb1RWRzNX?=
 =?utf-8?B?UzhkaCtOUWV4RDNySXR2cVhtZXdVMVhPbkpMSmo4a3F1VjRnaXYrbEpUckZN?=
 =?utf-8?B?S2NiNlNaK1crN05yUFpFVWkraTQzVmlPYlpUZ0w0a29ZRjhrQ0dqN0x4bDBj?=
 =?utf-8?B?M0JhcGpzZVhlUVpFaU9FNC96aU90cEtpQmJZeWJyeG00ZU16Y1JwbzdhOXVY?=
 =?utf-8?B?T3RnMklnclFCRGlGQ29MTHBIaEsxVnp2MXRKbjZ6TVNyUnNGclJCMzNMWmE0?=
 =?utf-8?B?YjZESDBaRWJqODB3T2lkcEhaZXFETmtuQnlyMUJwN09CT0VESENubyt6QjFW?=
 =?utf-8?B?UkhBSEhoV25mWmRPMlRHbng3dlFqQ2t4Z3hYQ0tzN1duajJMbC9VYzRCd1Bn?=
 =?utf-8?B?eTF0bElmRmlBNVFQRks1SVY0eXRxRE9na3Jwc1ZNQ2d6TktJWjdKb3lGMjhK?=
 =?utf-8?B?QnJuRlRRZk04ZDJmU1ZIcm4xMDhtSlBmTmlKNWtJekxrZ0grajIxdHhCdEdt?=
 =?utf-8?B?R1AvTnI2d1h6UklPK3hhc3lYNHI4cjg2V2s5T21qVmNXNVE1bGdLRWVrbTNa?=
 =?utf-8?B?T2NGekNpUmIvQXlJUFBtZDBxYTRPZHVFOXZEcmEwVGFTb2d5dnIwVnBOSU5q?=
 =?utf-8?B?RDZkNkxXT3VyRVVTUEdIblRoU1RIS2hOY25HNERRMFdNcHZhdTB4S3pIbFlu?=
 =?utf-8?B?NzBnNVl6SURxMEJIbHIwczh0VUUwNmpUd0pwQTJHdDg3T1RKSnVobHQzRG0z?=
 =?utf-8?B?by9KOThDcTFpR0VQcFRvNFhUdmZZQ3ZJSjBvZ0lYbmE1RXIvTVdlcnI2djJO?=
 =?utf-8?B?WmZUNTF3YmRrWkp1Q3ZTcThFSTFxa0p0VVdtdFo2dGxhY3RHVWFZYjZUU0Vi?=
 =?utf-8?B?YWZXZktmMGx1SjRYNGJ5aVBhaHd5NWh0cTdvbU1rVnhUNW9NRVhneVEwS2d3?=
 =?utf-8?B?T0hlSHd2aStHamgvMGYwR1RleDhCS2VmNmpZUGVFd0tESldpVUtsWlczTWg4?=
 =?utf-8?B?MHRPcjVuTk1paTYwRGxySDVEN0EwRGFoWmtlMTlMQzJNSmZWVERHdTdvOEdq?=
 =?utf-8?Q?mjdRjtcoOtIHVZkMf/PW5XdLfChEU4SlLz8Jc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1AzeHRDS3ZiQkpTaENiaVVHR2pndmYza1JuS0hUUFF6bHpod1psbjFOdjJl?=
 =?utf-8?B?WDJlTFZqTElGaEhNTGgyYVAyMHEydFlNMTJEczl1a09kNlhJb0htMURTdzRi?=
 =?utf-8?B?eTR4dEhvTVV0dEFDYWVvU0t6Z1lKREpEd0xCRUR6K2JkeFh6RDVJVXRJdUhN?=
 =?utf-8?B?M01CbnFvWXRHU1Y1R2RKcUMzYkkyMU1HSjJUM3dIYkp6SmNXaUxwSXJ5MEtH?=
 =?utf-8?B?dC9xT3IyWWNqSzFWaExneUlaTmZUZTFFWmppdzIxak0wZXpBRkxTMjZjZjBL?=
 =?utf-8?B?UGgrNDkvZHhQSVVtTS8zaCs1Tk5Tb3V3VXY0RGRDTS9PUVR3Ymg0Mng1U1ZB?=
 =?utf-8?B?MFFJSFZJeDBaM0hYbnNGZzFDWnpNQktxRlFhbGNFR0cyaklTa2tTUEtEZmN3?=
 =?utf-8?B?MUpwU3lyYU5UekphZ2cwbnhsdFVVSm94dTlSTzVXMm5iaWdEcWx4emlKQllw?=
 =?utf-8?B?SVRXMEJlS0JZUmkyRElkTXRxYnBUcjhQVUwrY1o0VGFqMlc2dExNRjNCcW5q?=
 =?utf-8?B?TWlva2UwQWd1Mzg0VVJVSCtPNldpUVVyanF0ejJVRCtvWUlWTWozUmhkbGRM?=
 =?utf-8?B?SHFXZ2FCRXZ6RGhoa3RrQkIvWGN1NkRjWjAzOUZUdmdrUU9yN1NiVjdMSldO?=
 =?utf-8?B?cFd4dnZHNTBGMCtKTUdrRi9zemZQZ0EyaHBMSHA0b1kyZitab29PVjdyamJH?=
 =?utf-8?B?cWtXNnU1bm9YSWE3MVczUGJvTkpsWDRkSi9sdkZWK0VDcnlxaE9hUTlzWFQ5?=
 =?utf-8?B?UkE2U0dabTZSMzdRbmlteGk1NEpNOFBWWk10UndEUm5RNkdTcWs4N1lESmRS?=
 =?utf-8?B?TEJ2elZUU3l4R05oNVd6UVpqcTBrcERZbFRBRksrbDIzSXZ6THUza2puOHRj?=
 =?utf-8?B?RitYYVpsblJBTDlXLzFNTmtkaExBT0R1R3QvOUpWNXZ2Q0FyVEwvcng5UmNO?=
 =?utf-8?B?RDZXUUxQTGxKenBOQmtGbHRFY2FiUTdGWDFNR1FuZFVFWm5LSlAvbVZlMWZl?=
 =?utf-8?B?OXdGSTVPNFRsck4xUUtKQjV5bjRNOUZ2L1pLWm5IdHE2UlE1K3R1THgwSklv?=
 =?utf-8?B?dEtmSWpRdDhUcHp5YmhTOWRvNm1rcnU1WlFRSFAyNWdTai91Mys2S3o1TW1W?=
 =?utf-8?B?R2RSMTlSZ0JyV3JNZUppU3NCUUlFQTFYZU1zL0J6MjF3MU1LNjZ2VHFOK2dT?=
 =?utf-8?B?WTZxTHFDdmkwTzdmTlJ4aVovaXpnOFdnWHFBcWJkb3hzbjhtZDRLUTcrQVRE?=
 =?utf-8?B?aUloUWJuU0RMbkZhOWdrdWk2akcyZzlwRjJuaEZaWmxoZHgvcXp2UlRTK3A2?=
 =?utf-8?B?dHhkRzA2SXQ5cmZnRGcvY2Z4ZEIzRnQ0S1dZbTRHbFo3YUUvQktzSHFSUERE?=
 =?utf-8?B?Z2dHR012d0lUMG12YlVPQmszYmtNNG84dUlVakxxT2laYzJsY0VYblVDVUkx?=
 =?utf-8?B?MktEdWRWTkI4eXp2ZG5vL0dkcEgwV3VUa3Y1UFRKdTNFNTJ1SDk2dWwxOGhP?=
 =?utf-8?B?YWdQdzhKZGdKR2dkWGRPaTVyYjRLck92d2xUd0EyWC9TeEx6SG92ZUJqb0xq?=
 =?utf-8?B?R3g3Ukpwd2Eyc21lQktNcFJ6TWFCQ3dpMDBzS0RadDZUOUI5NS9GczluTlZU?=
 =?utf-8?B?WEpvOWp6Nldwem5YdHN4WEcyQWJMQlFkd0NxSUl3SjdFYXo5TjJxOHBPdnlW?=
 =?utf-8?B?NTV4NGF4QTNiYzlxaGI1SktRc0c2SDdKS2EvWWhxM2lwUXF1bUNsbEpVa0hT?=
 =?utf-8?B?aVNJSUxtS21Sb0RoMVFWUmR3L0xoUmVFYU9ic3JJUm5kM1lEeGFmOTBENytj?=
 =?utf-8?B?eFpJbVh5MEJ4UkwvSTVVbmFkMitzMk40WXFxNCtiTS8xRVJTSHA1V3k5V2hC?=
 =?utf-8?B?c2dDRkpFMHBObkgwM2d2dzJyMjdqOGtSMzh1aTgwWitoaDZFSE9tdlBhQzhC?=
 =?utf-8?B?dzA3anU1dGZzM1ZtVFRuQmNtcDN4NjBudXhERVhzSVNkcklCQ1ZJREVva0di?=
 =?utf-8?B?NkZsQ1E2Y3FuQjZCQ1B0OWRwV1Q5ZC9tUHU4aFcxOFMvRUxXZmpEY3NXbUdM?=
 =?utf-8?B?Y256K1BQOHN5RlRCU1A0cmJta3dWTWwrZ2tZZlg4cEs3TWxBUWQxNzd3TENO?=
 =?utf-8?B?cDdmMnlWL0ZoZ3RjY013elFxOTJvSkJqMDVJQ1g1cmRLZytKMGI0dEt3U2RG?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cd90c9-c92e-4f2d-dac7-08dcd24e1d88
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 10:40:12.7434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHnQZyG3jN2MLk98YMWowKiFvXCYXJdbRxe0wX4xTTHR7lRz6ISfBylsKrJFlCvSNs65cb12nPhC631mcIjkooOaxRsQQ+dZpgPMy7R6alg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6567
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

On Tue, Sep 10, 2024 at 04:33:21PM -0500, Lucas De Marchi wrote:
> On Tue, Sep 10, 2024 at 05:11:34PM GMT, Rodrigo Vivi wrote:
> > On Tue, Sep 10, 2024 at 05:22:41PM +0200, Francois Dugast wrote:
> > > Those new macros inject errors by overriding return codes. They must
> > > manually be called, preferably at the very beginning of the function
> > > that will fault, otherwise if not possible by turning this pattern:
> > > 
> > >     err = foo();
> > >     if (err)
> > >         return err;
> > > 
> > > into:
> > > 
> > >     err = foo();
> > >     err = xe_device_inject_driver_probe_error(xe, err);
> > >     if (err)
> > >         return err;
> > > 
> > > When CONFIG_DRM_XE_DEBUG is not set, this has no effect.
> > > 
> > > When CONFIG_DRM_XE_DEBUG is set, the error code at checkpoint X will
> > > be overridden when the module argument inject_driver_load_error is
> > > set to value X. By doing so, it is possible to test proper error
> > > handling and improve robustness for current and future code. A few
> > > injection points are added in this patch but more need to be added.
> > > One way to use this error injection at driver probe is:
> > > 
> > >     for i in {1..200}; do
> > >         echo "Run $i"
> > >         modprobe xe inject_driver_probe_error=$i;
> > >         rmmod xe;
> > >     done
> > 
> > can we have an IGT test so we ensure that CI is tracking and we are working
> > to close the existing issues?
> 
> yeah.. that would be great. I think it would make more sense to use
> bind/unbind in igt.
> 
> > 
> > > 
> > > In the future this is expected to be replaced by the infrastructure
> > > provided by fault-inject.h
> > 
> > I was taking a look at the fault-inject again. It could easily be a
> > global fault_attr with a module sysfs entry, then during the test
> > you load the module, then unbind the device, then change the fault-inject
> > probability and time and then bind it back what will reprobe, but now
> > with the fault-injected.
> > 
> > The only problem with the fault-inject idea is that it would require
> > a very granular thing with multiple fault_attr, one per failure.
> 
> when going with a real fault-injection, I'd actually try to cover it per
> function as described here:
> 
> https://docs.kernel.org/fault-injection/fault-injection.html
> 	/sys/kernel/debug/fail_function/inject:
> 
> 	Format: { ‘function-name’ | ‘!function-name’ | ‘’ }
> 
> 	specifies the target function of error injection by name. If the
> 	function name leads ‘!’ prefix, given function is removed from injection
> 	list. If nothing specified (‘’) injection list is cleared.
> 
> Integration via ALLOW_ERROR_INJECTION() is similar to the
> KUNIT_STATIC_STUB_REDIRECT() we already use.
> 
> In my review I didn't bother to go with fault-inject directly because we
> will probably need to refactor the code so the failure points are in
> their own functions. Something we don't have today. Short term it's
> important to fix the current/unknown problems. Mid term we can convert
> things piece meal.
> 
> Are we on the same page?

It is also my intention with this patch, get something in with minimal risk
and changes so we can soon focus on solving potential issues it highlights.

In parallel I am preparing a RFC based on fault-inject with a proposal how
we can use fail_function with a few real examples from our code that we can
take more time to discuss thoroughly.

Francois

> 
> > But at least this really ensures that we are really testing all the cases
> > with more reliability.
> > 
> > I just realized that this i915-style probe injection might have an issue
> > on platforms with discrete platforms. Well, the pci subsystem won't
> 
> one more reason to go with the bind/unbind. Then you control where it's
> happening and where.
> 
> Lucas De Marchi
> 
> > probe in parallel, and likely it will be the same order of probe on
> > every module load, but if it doesn't the Nth point of the failure
> > won't be the same everytime, so in every load you might stop in a
> > different device and end up with not covering every single entry.
> > Unlikely I know... And I don't believe this should be a blocker
> > to move forward with something...
> > 
> > (more below)
> > 
> > > 
> > > v2: Fix style and build errors, modparam to 0 after probe, rename to
> > >     xe_device_inject_driver_probe_error, check type when compiled out,
> > >     add _return macro, move some uses to the beginning of the function
> > > v3: Rebase
> > > v4: Improve commit message and comments, keep if/return rather than
> > >     change the flow inside the macro (Lucas De Marchi)
> > > v5: Rebase, add comments, keep existing return points (Lucas De Marchi)
> > >     Add finish wrapper, move to function beginning for all xe functions
> > >     (Michal Wajdeczko) Bolt into i915 error injection (Jani Nikula)
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/display/ext/i915_utils.c |  4 +-
> > >  drivers/gpu/drm/xe/xe_device.c              | 48 +++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_device.h              | 30 +++++++++++++
> > >  drivers/gpu/drm/xe/xe_device_types.h        |  5 +++
> > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c |  5 +++
> > >  drivers/gpu/drm/xe/xe_guc.c                 |  1 +
> > >  drivers/gpu/drm/xe/xe_guc_ct.c              |  1 +
> > >  drivers/gpu/drm/xe/xe_guc_pc.c              |  4 ++
> > >  drivers/gpu/drm/xe/xe_mmio.c                |  5 +++
> > >  drivers/gpu/drm/xe/xe_module.c              | 17 ++++++++
> > >  drivers/gpu/drm/xe/xe_module.h              |  3 ++
> > >  drivers/gpu/drm/xe/xe_pci.c                 |  5 +++
> > >  drivers/gpu/drm/xe/xe_pm.c                  |  5 +++
> > >  drivers/gpu/drm/xe/xe_sriov.c               |  7 ++-
> > >  drivers/gpu/drm/xe/xe_sriov_pf.c            |  6 +++
> > >  drivers/gpu/drm/xe/xe_tile.c                | 13 ++++++
> > >  drivers/gpu/drm/xe/xe_uc.c                  |  4 ++
> > >  drivers/gpu/drm/xe/xe_wa.c                  |  8 +++-
> > >  drivers/gpu/drm/xe/xe_wopcm.c               |  7 ++-
> > >  19 files changed, 172 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > > index 43b10a2cc508..11d8377a125f 100644
> > > --- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > > +++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > > @@ -4,6 +4,7 @@
> > >   */
> > > 
> > >  #include "i915_drv.h"
> > > +#include "xe_device.h"
> > > 
> > >  bool i915_vtd_active(struct drm_i915_private *i915)
> > >  {
> > > @@ -16,11 +17,10 @@ bool i915_vtd_active(struct drm_i915_private *i915)
> > > 
> > >  #if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
> > > 
> > > -/* i915 specific, just put here for shutting it up */
> > >  int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
> > >  			      const char *func, int line)
> > >  {
> > > -	return 0;
> > > +	return __xe_device_inject_driver_probe_error(i915, err, 0, func, line);
> > >  }
> > > 
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 449b85035d3a..f22d94ff302e 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -319,6 +319,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> > >  	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
> > >  			      xe->drm.anon_inode->i_mapping,
> > >  			      xe->drm.vma_offset_manager, false, false);
> > > +	err = xe_device_inject_driver_probe_error_override(xe, err);
> > >  	if (WARN_ON(err))
> > >  		goto err;
> > > 
> > > @@ -477,6 +478,7 @@ static int xe_set_dma_info(struct xe_device *xe)
> > >  		goto mask_err;
> > > 
> > >  	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
> > > +	err = xe_device_inject_driver_probe_error_override(xe, err);
> > >  	if (err)
> > >  		goto mask_err;
> > > 
> > > @@ -498,6 +500,11 @@ static int wait_for_lmem_ready(struct xe_device *xe)
> > >  {
> > >  	struct xe_gt *gt = xe_root_mmio_gt(xe);
> > >  	unsigned long timeout, start;
> > > +	int err;
> > > +
> > > +	err = xe_device_inject_driver_probe_error(xe);
> > > +	if (err)
> > > +		return err;
> > > 
> > >  	if (!IS_DGFX(xe))
> > >  		return 0;
> > > @@ -750,6 +757,8 @@ int xe_device_probe(struct xe_device *xe)
> > >  	for_each_gt(gt, xe, id)
> > >  		xe_gt_sanitize_freq(gt);
> > > 
> > > +	xe_device_inject_driver_probe_error_finish();
> > > +
> > >  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
> > > 
> > >  err_fini_display:
> > > @@ -1000,3 +1009,42 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > >  	for_each_gt(gt, xe, id)
> > >  		xe_gt_declare_wedged(gt);
> > >  }
> > > +
> > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > +/**
> > > + * __xe_device_inject_driver_probe_error - Inject an error during device probe
> > > + * @xe: xe device instance
> > > + * @err_injected: the error to inject
> > > + * @err_real: the error returned by the actual function
> > > + * @func: the name of the function where this is called from
> > > + * @line: the line where this is called from
> > > + *
> > > + * This is not meant to be called directly, only through xe_device_inject_driver_probe_error.
> > > + *
> > > + * Return: err_real if != 0, err_injected otherwise
> > 
> > Not just otherwise....
> > 
> > Return 0 if this is not the Nth iteration of the requested iterations from
> > modparam.inject_driver_probe_error
> > 
> > Return err_injected if in the Nth iteration...
> > 
> > > + */
> > > +int __xe_device_inject_driver_probe_error(struct xe_device *xe, int err_injected, int err_real,
> > > +					  const char *func, int line)
> > > +{
> > > +	if (err_real != 0)
> > > +		return err_real;
> > > +
> > > +	if (xe->inject_driver_probe_error >= xe_modparam.inject_driver_probe_error)
> > > +		return 0;
> > > +
> > > +	if (++xe->inject_driver_probe_error < xe_modparam.inject_driver_probe_error)
> > > +		return 0;
> > > +
> > > +	drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",
> > > +		 err_injected, xe->inject_driver_probe_error, func, line);
> > > +
> > > +	xe_modparam.inject_driver_probe_error = 0;
> > > +	return err_injected;
> > > +}
> > > +
> > > +void __xe_device_inject_driver_probe_error_finish(void)
> > > +{
> > > +	/* After probe finishes, stop checking for error injection */
> > > +	xe_modparam.inject_driver_probe_error = 0;
> > > +}
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > index 894f04770454..c410e55b6b09 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > @@ -178,4 +178,34 @@ void xe_device_declare_wedged(struct xe_device *xe);
> > >  struct xe_file *xe_file_get(struct xe_file *xef);
> > >  void xe_file_put(struct xe_file *xef);
> > > 
> > > +#define XE_DEVICE_INJECTED_ERR -ENODEV
> > > +#define xe_device_inject_driver_probe_error(__xe) \
> > > +	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, 0, __func__, __LINE__)
> > > +#define xe_device_inject_driver_probe_error_override(__xe, __err_real) \
> > > +	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, __err_real, __func__, \
> > > +					      __LINE__)
> > > +#define xe_device_inject_driver_probe_error_finish()	\
> > > +	__xe_device_inject_driver_probe_error_finish()
> > > +
> > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > +
> > > +int __xe_device_inject_driver_probe_error(struct xe_device *xe,
> > > +					  int err_injected, int err_real,
> > > +					  const char *func, int line);
> > > +
> > > +void __xe_device_inject_driver_probe_error_finish(void);
> > > +
> > > +#else
> > > +
> > > +static inline int __xe_device_inject_driver_probe_error(struct xe_device *xe,
> > > +							int err_injected, int err_real,
> > > +							const char *func, int line)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > > +static inline void __xe_device_inject_driver_probe_error_finish(void) {};
> > > +
> > > +#endif
> > > +
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index ec7eb7811126..582b8b7cdee4 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -487,6 +487,11 @@ struct xe_device {
> > >  		int mode;
> > >  	} wedged;
> > > 
> > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > +	/** @inject_driver_probe_error: Counter used for error injection during probe */
> > > +	int inject_driver_probe_error;
> > > +#endif
> > > +
> > >  #ifdef TEST_VM_OPS_ERROR
> > >  	/**
> > >  	 * @vm_inject_error_position: inject errors at different places in VM
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> > > index 0e23b7ea4f3e..b5da321bbbea 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> > > @@ -12,6 +12,7 @@
> > >  #include "regs/xe_guc_regs.h"
> > >  #include "regs/xe_regs.h"
> > > 
> > > +#include "xe_device.h"
> > >  #include "xe_mmio.h"
> > >  #include "xe_gt_sriov_printk.h"
> > >  #include "xe_gt_sriov_pf_helpers.h"
> > > @@ -275,6 +276,10 @@ int xe_gt_sriov_pf_service_init(struct xe_gt *gt)
> > >  {
> > >  	int err;
> > > 
> > > +	err = xe_device_inject_driver_probe_error(gt_to_xe(gt));
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	pf_init_versions(gt);
> > > 
> > >  	err = pf_alloc_runtime_info(gt);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index 5599464013bd..eb764b44ced7 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -353,6 +353,7 @@ int xe_guc_init(struct xe_guc *guc)
> > >  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
> > > 
> > >  	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
> > > +	ret = xe_device_inject_driver_probe_error_override(guc_to_xe(guc), ret);
> > >  	if (ret)
> > >  		goto out;
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 4b95f75b1546..51ffb05605bb 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -202,6 +202,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > >  	ct->bo = bo;
> > > 
> > >  	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
> > > +	err = xe_device_inject_driver_probe_error_override(xe, err);
> > >  	if (err)
> > >  		return err;
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > index 034b29984d5e..d27d843057e7 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > @@ -1064,6 +1064,10 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
> > >  	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> > >  	int err;
> > > 
> > > +	err = xe_device_inject_driver_probe_error(xe);
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	if (xe->info.skip_guc_pc)
> > >  		return 0;
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > index 3fd462fda625..a4cf082d3261 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > @@ -136,6 +136,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
> > >  {
> > >  	size_t tile_mmio_size = SZ_16M;
> > >  	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
> > > +	int err;
> > > +
> > > +	err = xe_device_inject_driver_probe_error(xe);
> > > +	if (err)
> > > +		return err;
> > > 
> > >  	mmio_multi_tile_setup(xe, tile_mmio_size);
> > >  	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
> > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > > index 77ce9f9ca7a5..3de603e0438f 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > @@ -56,6 +56,23 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> > >  MODULE_PARM_DESC(force_probe,
> > >  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> > > 
> > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > +/*
> > > + * The error code at checkpoint X will be overridden when the module argument
> > > + * inject_driver_load_error is set to value X. By doing so, it is possible to
> > > + * test proper error handling and improve robustness for current and future
> > > + * code. One way to test multiple error injection points:
> > > + *
> > > + * for i in {1..200}; do
> > > + *     echo "Run $i"
> > > + *     modprobe xe inject_driver_probe_error=$i;
> > > + *     rmmod xe;
> > > + * done
> > > + */
> > > +module_param_named_unsafe(inject_driver_probe_error, xe_modparam.inject_driver_probe_error, int, 0600);
> > 
> > we need to break this line... or perhaps get a smaller word for the param name?
> > 
> > > +MODULE_PARM_DESC(inject_driver_probe_error, "Inject driver probe error");
> > > +#endif
> > > +
> > >  #ifdef CONFIG_PCI_IOV
> > >  module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
> > >  MODULE_PARM_DESC(max_vfs,
> > > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > > index 161a5e6f717f..47cefaf8d79b 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > @@ -20,6 +20,9 @@ struct xe_modparam {
> > >  	char *force_probe;
> > >  #ifdef CONFIG_PCI_IOV
> > >  	unsigned int max_vfs;
> > > +#endif
> > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > +	int inject_driver_probe_error;
> > >  #endif
> > >  	int wedged_mode;
> > >  };
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 3bce0e550a63..9bb60b300727 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -644,8 +644,13 @@ static int xe_info_init(struct xe_device *xe,
> > >  	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
> > >  	struct xe_tile *tile;
> > >  	struct xe_gt *gt;
> > > +	int err;
> > >  	u8 id;
> > > 
> > > +	err = xe_device_inject_driver_probe_error(xe);
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	/*
> > >  	 * If this platform supports GMD_ID, we'll detect the proper IP
> > >  	 * descriptor to use from hardware registers. desc->graphics will only
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index 9c59a30d7646..a059be07a11d 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -258,6 +258,7 @@ int xe_pm_init_early(struct xe_device *xe)
> > >  		return err;
> > > 
> > >  	err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
> > > +	err = xe_device_inject_driver_probe_error_override(xe, err);
> > >  	if (err)
> > >  		return err;
> > > 
> > > @@ -276,6 +277,10 @@ int xe_pm_init(struct xe_device *xe)
> > >  {
> > >  	int err;
> > > 
> > > +	err = xe_device_inject_driver_probe_error(xe);
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	/* For now suspend/resume is only allowed with GuC */
> > >  	if (!xe_device_uc_enabled(xe))
> > >  		return 0;
> > > diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> > > index 5a1d65e4f19f..c7512d8acc28 100644
> > > --- a/drivers/gpu/drm/xe/xe_sriov.c
> > > +++ b/drivers/gpu/drm/xe/xe_sriov.c
> > > @@ -102,11 +102,13 @@ static void fini_sriov(struct drm_device *drm, void *arg)
> > >   */
> > >  int xe_sriov_init(struct xe_device *xe)
> > >  {
> > > +	int err;
> > > +
> > >  	if (!IS_SRIOV(xe))
> > >  		return 0;
> > > 
> > >  	if (IS_SRIOV_PF(xe)) {
> > > -		int err = xe_sriov_pf_init_early(xe);
> > > +		err = xe_sriov_pf_init_early(xe);
> > > 
> > >  		if (err)
> > >  			return err;
> > > @@ -114,7 +116,8 @@ int xe_sriov_init(struct xe_device *xe)
> > > 
> > >  	xe_assert(xe, !xe->sriov.wq);
> > >  	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
> > > -	if (!xe->sriov.wq)
> > > +	err = xe_device_inject_driver_probe_error(xe);
> > > +	if (!xe->sriov.wq || err)
> > >  		return -ENOMEM;
> > > 
> > >  	return drmm_add_action_or_reset(&xe->drm, fini_sriov, xe);
> > > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> > > index 0f721ae17b26..8d75bb6570f0 100644
> > > --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> > > +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> > > @@ -80,8 +80,14 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
> > >   */
> > >  int xe_sriov_pf_init_early(struct xe_device *xe)
> > >  {
> > > +	int err;
> > > +
> > >  	xe_assert(xe, IS_SRIOV_PF(xe));
> > > 
> > > +	err = xe_device_inject_driver_probe_error(xe);
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	return drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
> > >  }
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > > index dda5268507d8..774668ac67b4 100644
> > > --- a/drivers/gpu/drm/xe/xe_tile.c
> > > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > > @@ -114,6 +114,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> > >  {
> > >  	int err;
> > > 
> > > +	err = xe_device_inject_driver_probe_error(xe);
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	tile->xe = xe;
> > >  	tile->id = id;
> > > 
> > > @@ -127,6 +131,15 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> > > 
> > >  	xe_pcode_init(tile);
> > > 
> > > +	/*
> > > +	 * xe_tile_alloc() and xe_gt_alloc() only fail with -ENOMEM.
> > > +	 * drmm_zalloc() is used so resources will be freed even if
> > > +	 * an error is injected.
> > > +	 */
> > > +	err = xe_device_inject_driver_probe_error(xe);
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	return 0;
> > >  }
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > > index 0d073a9987c2..6eaef7a3c58e 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > @@ -135,6 +135,10 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
> > >  {
> > >  	int ret;
> > > 
> > > +	ret = xe_device_inject_driver_probe_error(uc_to_xe(uc));
> > > +	if (ret)
> > > +		return ret;
> > > +
> > >  	/* GuC submission not enabled, nothing to do */
> > >  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > >  		return 0;
> > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > index 28b7f95b6c2f..8baad6106968 100644
> > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > @@ -825,6 +825,11 @@ int xe_wa_init(struct xe_gt *gt)
> > >  	struct xe_device *xe = gt_to_xe(gt);
> > >  	size_t n_oob, n_lrc, n_engine, n_gt, total;
> > >  	unsigned long *p;
> > > +	int err;
> > > +
> > > +	err = xe_device_inject_driver_probe_error(xe);
> > > +	if (err)
> > > +		return err;
> > > 
> > >  	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
> > >  	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
> > > @@ -833,7 +838,8 @@ int xe_wa_init(struct xe_gt *gt)
> > >  	total = n_gt + n_engine + n_lrc + n_oob;
> > > 
> > >  	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
> > > -	if (!p)
> > > +	err = xe_device_inject_driver_probe_error(xe);
> > > +	if (!p || err)
> > >  		return -ENOMEM;
> > > 
> > >  	gt->wa_active.gt = p;
> > > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > > index d3a99157e523..70674b30c4c6 100644
> > > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > > @@ -206,6 +206,10 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> > >  	bool locked;
> > >  	int ret = 0;
> > > 
> > > +	ret = xe_device_inject_driver_probe_error(xe);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > >  	if (!guc_fw_size)
> > >  		return -EINVAL;
> > > 
> > > @@ -252,8 +256,9 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> > >  		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
> > > 
> > >  check:
> > > +	ret = xe_device_inject_driver_probe_error_override(xe, ret);
> > >  	if (__check_layout(xe, wopcm->size, guc_wopcm_base, guc_wopcm_size,
> > > -			   guc_fw_size, huc_fw_size)) {
> > > +			   guc_fw_size, huc_fw_size) && !ret) {
> > >  		wopcm->guc.base = guc_wopcm_base;
> > >  		wopcm->guc.size = guc_wopcm_size;
> > >  		XE_WARN_ON(!wopcm->guc.base);
> > > --
> > > 2.43.0
> > > 
