Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A81E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 15:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDAA10E5EB;
	Wed, 18 Feb 2026 15:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xi9MdjRC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EB010E5EA
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 15:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771429935; x=1802965935;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=epe3GVQ+FrNa6S5k78FUVbVJjNKqz6KW4fUxtthlYw4=;
 b=Xi9MdjRCpbggw4ZYLXQ44RnQFbfuEle8B+QmVks7rzRnvaVlyR5a4Wse
 vLl/u9Jlfj9bVXMkj0Jywy1ihn6ieftEILqVX0jUuL0FiA+nYp46fNKM4
 9lpl30VEZQK47qW9s9ZgNY8+a9kRq8gan0ttmi8IAvO4c9Fv/x3F5cNaj
 7AitpOFS764tmUyu5YM5yXPpAKC0xG2El0/xB4/GTCipAnF2HnSGLsO3A
 t0NwVjw0QajgOVix9+cBAedTTISRQs59QRDIzF177EzY9XJ0H8TW6pPrz
 4WubSh+psi3Pxb3e9vgzwfsNHAYpperzSLx+JHfpCqDEEughsXoI941RP A==;
X-CSE-ConnectionGUID: zuH+iC+zR2y2VrMAUPFVEg==
X-CSE-MsgGUID: iPHKSTcuSlOSuu5Ofwi7ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="97967679"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208,217";a="97967679"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:52:15 -0800
X-CSE-ConnectionGUID: HzsYUokdQCSPKkQvHfFtsg==
X-CSE-MsgGUID: bKlclSi1T/WMwbm0EdRljA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
 d="scan'208,217";a="214072587"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:52:15 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 07:52:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 07:52:14 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.40)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 07:52:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxeGsT3d/m9g22e7XYXevOnqCWvB1jiM9lFIa1q699QpYiVhl1p8qytP1TTa5+TRU7MFcvRMGp4IYOpQAGtBv5mFS05r0KQ6qDassak281k8nk08qGV18UayQOTdertggwm9Q84HOTuejVMyPSAIsC/xZvL5RGz4yiS8Bj1QrwGAQg2aqhwdiA0sFPt2AiUpRYYHc0auazE/O5nZJamKixQW0yptUt6+5zNzsprIv8LrtOyS5DNBnaS/2wTgh7aWbhJX3iO13qnm5XqtLU9cBNCph+z184eMDdxgv0Q4cZdhyKKhJk6XP/zGylWuGq8VgznCMQi7O3v07L6yAhIJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6k8SiSa44umwppeEYtRBuOc5UmWJjOoz4IaZOT6P2W8=;
 b=MOnTn0tJDhSlulK8OhREhNjtV6dISbHc9ZZL07cXAqjvyDmwSWMcwE+vC43KI6i2TN9TA09VWb5X685tC1/YZuJ6riQWs9RDP9Jn1xLU/nIns44P+Wq/LPttGaACV3zH8ERTlpm2omAn54/Hdr7XYAwyDsw2rDsgclCSWk4lM1qXeEUweeEfARRJakQxyzpRwZ7mW0G7hdcNlyAiwXadKN2LM/giIBwPh8nAMdeBgw77d88Ut2562gW4rOCoIEXFY1liIuEWnTC+fIQ7aJTnhXGu6cqJFM8zsedd1pdSBKZE7yOU/cMX3Qv8ErDym2p1eVeD/9VZeETiTQoEJO3sVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 15:52:11 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%3]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 15:52:11 +0000
Content-Type: multipart/alternative;
 boundary="------------lYniKR073CmRxGs8DkoY0gHh"
Message-ID: <8f0f751d-da58-4c8e-80e2-6e6bff27424a@intel.com>
Date: Wed, 18 Feb 2026 21:22:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v5, 2/3] drm/xe/vf: Fix fs_reclaim warning with CCS save/restore
 BB allocation
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20260217120745.1074232-7-satyanarayana.k.v.p@intel.com>
 <4215aa02-6854-4be1-9ae7-418af0752482@lankhorst.se>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <4215aa02-6854-4be1-9ae7-418af0752482@lankhorst.se>
X-ClientProxiedBy: MA5P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::15) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|CO1PR11MB4802:EE_
X-MS-Office365-Filtering-Correlation-Id: 2215c4d1-a18c-4460-b14d-08de6f05ad2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlBVQko4YjlKUEUvc1pjK1R3dDVSYmJMNVhCOTIyTWFrcEpWZElySnlKcDFv?=
 =?utf-8?B?NUU3RW56d2QyaFFWSzFXZ0FzNENJTUlQYWhaSlJiYXJqWjhPV29NSC9KdndC?=
 =?utf-8?B?VHI3Zm1FOE9RU1RXWVduQ0dTZG1FTFpmMUdMQmtmdXU0aEkxS0NxelpmUmhX?=
 =?utf-8?B?R3VZSHZQWGRkS0pLaUtrTmRsNkg5RUV5akJNOURuY3dWRzMwaExsRkdCdHZp?=
 =?utf-8?B?Sk04SFF5ZnZHUk9zeTFhUDBMM0xxckFFdCs2T2RhU0J2TXV1b1ZkY0tNS2xE?=
 =?utf-8?B?dHZCTTNDaEFkTVo2bkpBOWZLRXNmaUNmbURvb2d1NDNoQjJMdmhOaDExdDRV?=
 =?utf-8?B?UmkrekZqam1NTnY1bjI5UjVzMXhhTjZoQzdCQTlzQjhCRUVSMjhqUkJrK2NL?=
 =?utf-8?B?V0FJZlBmUHdSMGZHeDdTREN2clBzWXJkKy9lT1JJc3JaUS90STlSaFFPamZr?=
 =?utf-8?B?b2hobDA3SU5IUjh0bDE0RU1DcURmelRLWEd4ZHBRN1dCeG9sZnMxSVFOcS9a?=
 =?utf-8?B?bDFRQ0RadXYwL0h2eUlNYmlML0d2dXY3Q1JaaU1jb3FSeGM4TzN3azlBa20y?=
 =?utf-8?B?NURhaU1RZjJUSjcrR3h6N1ptSUZTZ1RtMGtVTkpLSk5wTURzZGVld2xpMHFN?=
 =?utf-8?B?bHRaTkpQR3Vqc2NCYTNJMmp2dXpmbUZUa3duKzM5V2tzVTk0VWxld21KTGYw?=
 =?utf-8?B?RkJGWTBCRUM4VncrZjdBeW5mbW5RMzJseHp5cktGYWRVRzhPZXNNbTRrSTk4?=
 =?utf-8?B?Qy9GR2lNTGlTMHI4NFRDdGYvMFpaQ2IrOEtGY2JlNVhJZzA3bE1FOGg4L1Uy?=
 =?utf-8?B?dUZTK1o1UjRmemV0N1NGUkJaL09BaG9KL1lvallYeXJ0Y2tsYWRObU4wN29i?=
 =?utf-8?B?am1vby9aazhoM1pOSVRHUWN3b0FTbWdmaWl0K0g5TkpuMzU2cENGclNjaGY4?=
 =?utf-8?B?TThlUHZ4cnNKSG1xQnRkTWZsOEJlcGs4VHUvckNnaW5xeGg2LzZCYk1TWFc1?=
 =?utf-8?B?a3E1RTRsclRUcFQvbTRGdWlMV3NlaWkrQWNlNzAwblRBZmdOS1ZLcnovcVdp?=
 =?utf-8?B?ZStVQXBvOEpjdUttU3pReTlvNlJPQjBudVQ1dCtlM2VZYUVkT0xNN2hvb3Ny?=
 =?utf-8?B?UjB1eFRTaU9tejA1VUExME04dmplRkNTNlRRTzJ5MUNGc3ZheFVUUWR5Y0Zt?=
 =?utf-8?B?T1J4UUE5MmRUb0YyOGpuWGhPbDkxaEEzSWhaM2pNcG9hQ2lCQ0U4cHNRT2xn?=
 =?utf-8?B?Tno3QXNUQk50MEJ2d1RUVFJnSnNwbjVHZHpjR0lTQnZvMGRuV2g4R1N4SDZR?=
 =?utf-8?B?WEVXc2tNS1AzKzNGd2t0OG05NUlxbFM1Sk52ZzQ3Rjh5VllGOEtGTm00Q0g5?=
 =?utf-8?B?L0hiSnMvRm9EZDNPQUJlTUYzRkpJeWNrajJJRlQzYWZiN0tEeUNUeFZhOUti?=
 =?utf-8?B?OGc4aWRhRXlZU1pVSCtpdjZBTDZVc3VjUW1aY2doaHprR2JIT2gwSWFNZFFl?=
 =?utf-8?B?Nk40SmhXSW9ydytMSVRnSXk1K1VGR1VnMWhHbkg3SHo3ZUdnV3lTOXpqcTNB?=
 =?utf-8?B?MUdleGpGVTNoc3g3ckRiRW1IN29wRlpsdHF6VjVvRDZWZ205ZE9BYVJiN0lC?=
 =?utf-8?B?TGR0YjdUdzFKVTZQUS9vVkJKMUo3bXBVMGdQZDN4L0d1ZDJBdGg1V3ZsaXd5?=
 =?utf-8?B?SkRZWFZ2dkp1cG53N2FMMXpTSE9pUFg4NTMvS1JiTE9MMmVBN25IcVRQTW9S?=
 =?utf-8?B?QWM2Zi8zRHJCZkNJbk5UcUVNWjNEYVRENThlaytQbkUzdUNGVjcwNEVFQlJz?=
 =?utf-8?B?Sy9qWnRYUWJLaUdOSnBocjR3ZkFFL25JcTJMZ055QzhZM2FaM0xET1p6cWUz?=
 =?utf-8?B?WGt3R2ZuMUxwNXVUQnBlSUNLd1pPbEZTWXNadnNxUDB3TGRlMFR2NWZReEM0?=
 =?utf-8?B?b0pEdlE1TkFiUWQreC85RkplbGRGZExyU0Z2Mk01U3BtSUh0YXovdTVnN0dt?=
 =?utf-8?B?c1NFMFgvSnQ4S3prMTdFQis0b251eEc3R3dLeWFHUFpkN3VzdmFvZ0xvV2Yx?=
 =?utf-8?B?MGxqTVgyaVdEMXYvOTZXMCs3THFGUFJGbVg0dHordG91VGx0YnNOKzVJTWlD?=
 =?utf-8?Q?MqCk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0JjYk9VUk9ObitLUWRqajkwS1pkUHV2UFFZM3ZpSEIzQlptUlQzMGM5Vi9F?=
 =?utf-8?B?aWpFdXhuVVFzSHBZNXVORGtKVFZVNzAzQ0dOOG5VdHhYaEdvbGwzRmhDUzhS?=
 =?utf-8?B?a0RKVUsyaUVxa21FaEpSTDBqbXB3TnpldDM4VHBhNDVUMStWa1UyTytHTmlQ?=
 =?utf-8?B?b1J6aGpENlRmSG9qSjlUZk1NbjJYNEdzWStqV3NXc1ZDUFdLQzMxZlJRSTJv?=
 =?utf-8?B?UXc5UmEzZUhOYWwva3Q5RjEveDlYbHZBNlMwVG1ZNE0rRU9CeHlmdXJpN05j?=
 =?utf-8?B?S0w3dXVoUWs5Z24rcVh6VU14Wm0zZG54ZXg2bXl5Z0FYVHlVWXMzRHBOcFF0?=
 =?utf-8?B?N2pwWTE5UVljSlZlOTNVbUhZT1JwazNuRmo0UThhQ0N3bmUwTStTay9Zc3pE?=
 =?utf-8?B?aGxuSGZvVDhhR2sxN2p2MlU3L29zZE5yTUxJeVJlUGxxcVM5djVsL0VjRzVw?=
 =?utf-8?B?aDV3M01OMStnOXdlc21MQmJmMDBLNjY2cEhDTk5tOGdsVjVmUWxYNHJqWHpi?=
 =?utf-8?B?dUpIZUlsTHdDdVlSM05mNU8wa0RKY2ExVHA5ZHN5WTVmZ0JJRkw5QkwzNll1?=
 =?utf-8?B?Y05INjl5eE5nSlFGL3MwbnpaMHNXR21mbWcvN0RGTDFTVDRJZ2tZbHNZaXpy?=
 =?utf-8?B?RmF2aWtrTVNFQ3JMb3IySDFRV0duaFMwVlBLTDM4dEtxUkNDZEluRXNJTmM1?=
 =?utf-8?B?K0FOSldVRzBKQTB4TVk0M29IZnVXK3BBOExhempvV3F3Z0l2eUg0WGR5RzFW?=
 =?utf-8?B?YXB4ejZRT1lCZVkwdXoxb3pla0RkTUw4TzJPNERMdGhxUnQzaXNCenpwTTQ3?=
 =?utf-8?B?ajB3aitNdEUvYVVtUEM0dTFQSk53SU5sc1FtNVpMZ0c5N204NWhVUGpqL0l3?=
 =?utf-8?B?R0h5aWVyYkRkeDloT1pnUjRzdUhVNzlQaTNBV2hlSzhEUkg3WEVra0xqdnZi?=
 =?utf-8?B?Vkd6eWVUc1c1bWw3NVdHK2JlWmJGR1ZnRHVWSHVFbEduMktTdVhEWDF5WW13?=
 =?utf-8?B?a3ZuaFc2U0JKODVmY1hGUk84dmY0dTJOVisxMGZmUWxzNDJDUHpqYUlra0tZ?=
 =?utf-8?B?bVhQK2hYeGJBUjJkOEVlOE1Mb1ZGMmlMSm5HemZqOEdIanBnSy8zMWtpZDhD?=
 =?utf-8?B?UUdTby9qQW1EdFBCa0l1RnJRWm04bmYwUkZQR2s3Y3VWbjdCeDRXL2FmNHQv?=
 =?utf-8?B?c1V5Y2hUK1BpVDRaZjAxM09IRFFZVjhFR3Jja1YxUGZwNmlOMndmYlpXT1Jm?=
 =?utf-8?B?dEc4VzIyTVBCK3R3Q2xPaHV2K3AxYWxxZU9yZHZ5UWJDcmdhWEdLcXgxT3JO?=
 =?utf-8?B?U3ZiN1ArejR3S3VSakJoZEJrY2g3WjdrbFVPaVF0M3VRY0p3bDhBVG1nK3pw?=
 =?utf-8?B?Zk1JTm1MUWV2MnMwZ1pteWxsUS9mZjJYQkN2czk4TW5nVFZtMVRoSUx3anpJ?=
 =?utf-8?B?Y09LajZTQVF6cG0ycXA3M0RzVVpTNndpWGJIaWc4YXlJcnR6UDNoTDI0RU91?=
 =?utf-8?B?UU1FYStzK0JObjNPYkFRQ0ROemxmbmQ1czhXbi9lMzhtQS85UU5DN3d6U1Zz?=
 =?utf-8?B?SGdNWnM2bTR4cWVCaXYvTEF5Z3loWU54RTVMb3NYcnRhMjNLb1hScW1pRldJ?=
 =?utf-8?B?dDBLNGhKMHJQT0ZBaHdNVkRUMUdzK0QxTkpPbzlJSEJzUVJZMmZtckF4L2pV?=
 =?utf-8?B?RGZSVXBuYXp0eEl5T3R6S3I3TzhKNFdhTFZBY29NTmtpNytTNXJveFJ6V2cw?=
 =?utf-8?B?Y251UzAvWTNmNUt3VFg3YkNzNGkzV1prY0d0RVAxWHVmN1FYTllDRmdwU205?=
 =?utf-8?B?WUhkajlMWFJZZHNWM09ueTBnZitKR2x2THdub21MenZ4ZDNLcDFMdHlQdFd5?=
 =?utf-8?B?VmpUOVBocC82WHg5dFJWMWVQT1VuMm1tUmxVMXN3cHRUNnRBSWo3V0NqYXdV?=
 =?utf-8?B?TitOd3pPUTlBVUdIWWRnQVUxNWNYeVd3QjdTaEpwbG5KRURsVWtCbHZPcFhO?=
 =?utf-8?B?N2pseVFTbFo3RkJ4UzBFTDRnSTJxS0dzYU9mTkFrKzdzcjExOXNvZmQvV0lY?=
 =?utf-8?B?YTd4UnVkMnpuWUlKbUY1eEdhOEtpeGZGb2ZUclpydVpzSlhTd3FxNU5qU2hr?=
 =?utf-8?B?RkM2SGpTaGFZVlJwKzRrQUw3Y2dZQXVIcVhTbGRYWWp0SWp0b05yZlhRVVlk?=
 =?utf-8?B?YU9VTDFNakNKQk9EalBKSW5qQXROUjhEbU95QWZySlVqbUJWRFFlRitBbVlD?=
 =?utf-8?B?SVNkUlZhMDJtRkNHeWk5cENSRGJYaDQxSFJCcHpGckFZS2VNQzJENGtZcmhC?=
 =?utf-8?B?YmZFMXY0OTRMNlFRVmVrdmQ0eWZ5S3RDWGlwRmhZaXNlUm82aEphcytOUm16?=
 =?utf-8?Q?PVtNpRYvNP0CiqqA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2215c4d1-a18c-4460-b14d-08de6f05ad2d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 15:52:11.0360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhP4j6C7hglL3FdGtgwZ4fs60s0ISpTzobxR14vsJBX8d0mzjUwutMdm6RsrYK6w+rWuX+LFY9rPqYGW5bfq3Ldk7Qm/zwi+FdP5YlHyB+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
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

--------------lYniKR073CmRxGs8DkoY0gHh
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 18-Feb-26 3:21 PM, Maarten Lankhorst wrote:
> Hey,
>
> A quick look at the series. It's a good idea to separate allocation from insertion
> in this case, but it seems some small issues with the API remain.
>
> The first one is that you introduce another free function. It would be better to set
> sa->manager = NULL in drm_suballoc_alloc(), and check for that in drm_suballoc_free().
> That removes the requirement of adding another free function, and making a mistake there.
> And it nicely pairs alloc() with free()
>
> Additionally, you now have both drm_suballoc_init() and drm_suballoc_new().
>
> I'd recommend renaming drm_suballoc_init() to drm_suballoc_insert(), and optionally
> convert all existing users to use drm_suballoc_insert()
> After that you only have a single API, and made the usage of it slightly more comprehensible. :-)
>
> With these changes, the flow is really nice:
> - drm_suballoc_alloc()
> - drm_suballoc_insert()
> - Error checking, do some stuff here, finally
> - drm_suballoc_free()
>
> And then you convert the existing users 1 by 1, until you can finally remove drm_suballoc_init().

Sent new version with drm_suballoc_init() updated to drm_suballoc_insert().

Will send a new series to remove drm_suballoc_new() later as this series 
is to fix an issue.

-Satya.

> Kind regards,
> ~Maarten Lankhorst
>
> Den 2026-02-17 kl. 13:07, skrev Satyanarayana K V P:
>> CCS save/restore batch buffers are attached during BO allocation and
>> detached during BO teardown. The shrinker triggers xe_bo_move(), which is
>> used for both allocation and deletion paths.
>>
>> When BO allocation and shrinking occur concurrently, a circular locking
>> dependency involving fs_reclaim and swap_guard can occur, leading to a
>> deadlock such as:
>> Reviewed-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>
>> ======================================================
>> WARNING: possible circular locking dependency detected
>> ------------------------------------------------------
>>
>>        CPU0                    CPU1
>>        ----                    ----
>>   lock(fs_reclaim);
>>                                lock(&sa_manager->swap_guard);
>>                                lock(fs_reclaim);
>>   lock(&sa_manager->swap_guard);
>>
>>   *** DEADLOCK ***
>> =====================================================
>>
>> To avoid this, the BB pointer and SA are allocated using xe_bb_alloc()
>> before taking lock and SA is initialized using xe_bb_init() preventing
>> reclaim from being invoked in this context.
>>
>> Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
>> Signed-off-by: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> Cc: Matthew Auld<matthew.auld@intel.com>
>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>
>> ---
>> V4 -> V5:
>> - Removed enum xe_sriov_vf_ccs_rw_ctxs from xe_bb.h as it is not used
>>    any more (Michal).
>>
>> V3 -> V4:
>> - Fixed some nits (Michal).
>>
>> V2 -> V3:
>> - Updated commit message (Matt, Thomas & Christian).
>> - Removed timeout logic from drm_suballoc_init(). (Thomas & Christian).
>>
>> V1 -> V2:
>> - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
>> drm_suballoc_init() (Thomas).
>> ---
>>   drivers/gpu/drm/xe/xe_bb.c      | 72 ++++++++++++++++++------
>>   drivers/gpu/drm/xe/xe_bb.h      |  7 ++-
>>   drivers/gpu/drm/xe/xe_migrate.c | 99 ++++++++++++++++++---------------
>>   drivers/gpu/drm/xe/xe_sa.c      | 39 +++++++++++++
>>   drivers/gpu/drm/xe/xe_sa.h      |  3 +
>>   5 files changed, 156 insertions(+), 64 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
>> index 8b678297aaa2..a991d9db8164 100644
>> --- a/drivers/gpu/drm/xe/xe_bb.c
>> +++ b/drivers/gpu/drm/xe/xe_bb.c
>> @@ -59,16 +59,64 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
>>   	return ERR_PTR(err);
>>   }
>>   
>> -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
>> -			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
>> +/**
>> + * xe_bb_alloc() - Allocate a new batch buffer structure
>> + * @gt: the &xe_gt
>> + *
>> + * Allocates and initializes a new xe_bb structure with an associated
>> + * uninitialized suballoc object.
>> + *
>> + * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
>> + */
>> +struct xe_bb *xe_bb_alloc(struct xe_gt *gt)
>>   {
>>   	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
>> -	struct xe_device *xe = gt_to_xe(gt);
>> -	struct xe_sa_manager *bb_pool;
>>   	int err;
>>   
>>   	if (!bb)
>>   		return ERR_PTR(-ENOMEM);
>> +
>> +	bb->bo = xe_sa_bo_alloc(GFP_KERNEL);
>> +	if (IS_ERR(bb->bo)) {
>> +		err = PTR_ERR(bb->bo);
>> +		goto err;
>> +	}
>> +
>> +	return bb;
>> +
>> +err:
>> +	kfree(bb);
>> +	return ERR_PTR(err);
>> +}
>> +
>> +/**
>> + * xe_bb_release() - Release and free a batch buffer structure
>> + * @bb: Batch buffer structure to release
>> + *
>> + * Releases the sub-allocated buffer object associated with the batch buffer
>> + * and frees the xe_bb structure memory.
>> + */
>> +void xe_bb_release(struct xe_bb *bb)
>> +{
>> +	xe_sa_bo_release(bb->bo);
>> +	kfree(bb);
>> +}
>> +
>> +/**
>> + * xe_bb_init() - Initialize a batch buffer with memory from a sub-allocator pool
>> + * @bb: Batch buffer structure to initialize
>> + * @bb_pool: Suballoc memory pool to allocate from
>> + * @dwords: Number of dwords to be allocated
>> + *
>> + * Initializes the batch buffer by allocating memory from the specified
>> + * suballoc pool.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords)
>> +{
>> +	int err;
>> +
>>   	/*
>>   	 * We need to allocate space for the requested number of dwords &
>>   	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
>> @@ -76,22 +124,14 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
>>   	 * is not over written when the last chunk of SA is allocated for BB.
>>   	 * So, this extra DW acts as a guard here.
>>   	 */
>> -
>> -	bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
>> -	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
>> -
>> -	if (IS_ERR(bb->bo)) {
>> -		err = PTR_ERR(bb->bo);
>> -		goto err;
>> -	}
>> +	err = xe_sa_bo_init(bb_pool, bb->bo, 4 * (dwords + 1));
>> +	if (err)
>> +		return err;
>>   
>>   	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
>>   	bb->len = 0;
>>   
>> -	return bb;
>> -err:
>> -	kfree(bb);
>> -	return ERR_PTR(err);
>> +	return 0;
>>   }
>>   
>>   static struct xe_sched_job *
>> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
>> index 2a8adc9a6dee..5778699149ec 100644
>> --- a/drivers/gpu/drm/xe/xe_bb.h
>> +++ b/drivers/gpu/drm/xe/xe_bb.h
>> @@ -12,12 +12,13 @@ struct dma_fence;
>>   
>>   struct xe_gt;
>>   struct xe_exec_queue;
>> +struct xe_sa_manager;
>>   struct xe_sched_job;
>> -enum xe_sriov_vf_ccs_rw_ctxs;
>>   
>>   struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
>> -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
>> -			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
>> +struct xe_bb *xe_bb_alloc(struct xe_gt *gt);
>> +void xe_bb_release(struct xe_bb *bb);
>> +int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords);
>>   struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
>>   				      struct xe_bb *bb);
>>   struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 078a9bc2821d..d4cfc54d614b 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -25,6 +25,7 @@
>>   #include "xe_exec_queue.h"
>>   #include "xe_ggtt.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>>   #include "xe_hw_engine.h"
>>   #include "xe_lrc.h"
>>   #include "xe_map.h"
>> @@ -1148,65 +1149,73 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   		size -= src_L0;
>>   	}
>>   
>> +	bb = xe_bb_alloc(gt);
>> +	if (IS_ERR(bb))
>> +		return PTR_ERR(bb);
>> +
>>   	bb_pool = ctx->mem.ccs_bb_pool;
>> -	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
>> -	xe_sa_bo_swap_shadow(bb_pool);
>> +	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
>> +		xe_sa_bo_swap_shadow(bb_pool);
>> +
>> +		err = xe_bb_init(bb, bb_pool, batch_size);
>> +		if (err) {
>> +			xe_gt_err(gt, "BB allocation failed.\n");
>> +			xe_bb_release(bb);
>> +			return err;
>> +		}
>>   
>> -	bb = xe_bb_ccs_new(gt, batch_size, read_write);
>> -	if (IS_ERR(bb)) {
>> -		drm_err(&xe->drm, "BB allocation failed.\n");
>> -		err = PTR_ERR(bb);
>> -		return err;
>> -	}
>> +		batch_size_allocated = batch_size;
>> +		size = xe_bo_size(src_bo);
>> +		batch_size = 0;
>>   
>> -	batch_size_allocated = batch_size;
>> -	size = xe_bo_size(src_bo);
>> -	batch_size = 0;
>> +		/*
>> +		 * Emit PTE and copy commands here.
>> +		 * The CCS copy command can only support limited size. If the size to be
>> +		 * copied is more than the limit, divide copy into chunks. So, calculate
>> +		 * sizes here again before copy command is emitted.
>> +		 */
>>   
>> -	/*
>> -	 * Emit PTE and copy commands here.
>> -	 * The CCS copy command can only support limited size. If the size to be
>> -	 * copied is more than the limit, divide copy into chunks. So, calculate
>> -	 * sizes here again before copy command is emitted.
>> -	 */
>> -	while (size) {
>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>> -		u32 flush_flags = 0;
>> -		u64 ccs_ofs, ccs_size;
>> -		u32 ccs_pt;
>> +		while (size) {
>> +			batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>> +			u32 flush_flags = 0;
>> +			u64 ccs_ofs, ccs_size;
>> +			u32 ccs_pt;
>>   
>> -		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
>> +			u32 avail_pts = max_mem_transfer_per_pass(xe) /
>> +					LEVEL0_PAGE_TABLE_ENCODE_SIZE;
>>   
>> -		src_L0 = xe_migrate_res_sizes(m, &src_it);
>> +			src_L0 = xe_migrate_res_sizes(m, &src_it);
>>   
>> -		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
>> -					      &src_L0_ofs, &src_L0_pt, 0, 0,
>> -					      avail_pts);
>> +			batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
>> +						      &src_L0_ofs, &src_L0_pt, 0, 0,
>> +						      avail_pts);
>>   
>> -		ccs_size = xe_device_ccs_bytes(xe, src_L0);
>> -		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
>> -					      &ccs_pt, 0, avail_pts, avail_pts);
>> -		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
>> -		batch_size += EMIT_COPY_CCS_DW;
>> +			ccs_size = xe_device_ccs_bytes(xe, src_L0);
>> +			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
>> +						      &ccs_pt, 0, avail_pts, avail_pts);
>> +			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
>> +			batch_size += EMIT_COPY_CCS_DW;
>>   
>> -		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
>> +			emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
>>   
>> -		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>> +			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>>   
>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>> -		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>> -						  src_L0_ofs, dst_is_pltt,
>> -						  src_L0, ccs_ofs, true);
>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>> +			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>> +			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>> +							  src_L0_ofs, dst_is_pltt,
>> +							  src_L0, ccs_ofs, true);
>> +			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>>   
>> -		size -= src_L0;
>> -	}
>> +			size -= src_L0;
>> +		}
>>   
>> -	xe_assert(xe, (batch_size_allocated == bb->len));
>> -	src_bo->bb_ccs[read_write] = bb;
>> +		xe_assert(xe, (batch_size_allocated == bb->len));
>> +		src_bo->bb_ccs[read_write] = bb;
>> +
>> +		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
>> +		xe_sa_bo_sync_shadow(bb->bo);
>> +	}
>>   
>> -	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
>> -	xe_sa_bo_sync_shadow(bb->bo);
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
>> index b738102575d4..4b3dcc7e5ae0 100644
>> --- a/drivers/gpu/drm/xe/xe_sa.c
>> +++ b/drivers/gpu/drm/xe/xe_sa.c
>> @@ -175,6 +175,45 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
>>   	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
>>   }
>>   
>> +/**
>> + * xe_sa_bo_alloc() - Allocate uninitialized suballoc object.
>> + * @gfp: gfp flags used for memory allocation.
>> + *
>> + * Allocate memory for an uninitialized suballoc object. Intended usage is
>> + * allocate memory for suballoc object outside of a reclaim tainted context
>> + * and then be initialized at a later time in a reclaim tainted context.
>> + *
>> + * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
>> + */
>> +struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp)
>> +{
>> +	return drm_suballoc_alloc(gfp);
>> +}
>> +
>> +/**
>> + * xe_sa_bo_release() - Release memory for suballocation.
>> + * @sa: The struct drm_suballoc.
>> + */
>> +void xe_sa_bo_release(struct drm_suballoc *sa)
>> +{
>> +	drm_suballoc_release(sa);
>> +}
>> +
>> +/**
>> + * xe_sa_bo_init() - Initialize a suballocation.
>> + * @sa_manager: pointer to the sa_manager
>> + * @sa: The struct drm_suballoc.
>> + * @size: number of bytes we want to suballocate.
>> + *
>> + * Try to make a suballocation on a pre-allocated suballoc object of size @size.
>> + *
>> + * Return: zero on success, errno on failure.
>> + */
>> +int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, size_t size)
>> +{
>> +	return drm_suballoc_init(&sa_manager->base, sa, size, true, 0);
>> +}
>> +
>>   /**
>>    * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
>>    * @sa_bo: the &drm_suballoc to flush
>> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
>> index 05e9a4e00e78..156b6e6fa14b 100644
>> --- a/drivers/gpu/drm/xe/xe_sa.h
>> +++ b/drivers/gpu/drm/xe/xe_sa.h
>> @@ -38,6 +38,9 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
>>   	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
>>   }
>>   
>> +struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp);
>> +void xe_sa_bo_release(struct drm_suballoc *sa);
>> +int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, size_t size);
>>   void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
>>   void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
>>   void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
--------------lYniKR073CmRxGs8DkoY0gHh
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 18-Feb-26 3:21 PM, Maarten Lankhorst
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:4215aa02-6854-4be1-9ae7-418af0752482@lankhorst.se">
      <pre wrap="" class="moz-quote-pre">Hey,

A quick look at the series. It's a good idea to separate allocation from insertion
in this case, but it seems some small issues with the API remain.

The first one is that you introduce another free function. It would be better to set
sa-&gt;manager = NULL in&nbsp;drm_suballoc_alloc(), and check for that in drm_suballoc_free().
That removes the requirement of adding another free function, and making a mistake there.
And it nicely pairs alloc() with free()

Additionally, you now have both drm_suballoc_init() and drm_suballoc_new().

I'd recommend renaming drm_suballoc_init() to drm_suballoc_insert(), and optionally
convert all existing users to use drm_suballoc_insert()
After that you only have a single API, and made the usage of it slightly more comprehensible. :-)

With these changes, the flow is really nice:
- drm_suballoc_alloc()
- drm_suballoc_insert()
- Error checking, do some stuff here, finally
- drm_suballoc_free()

And then you convert the existing users 1 by 1, until you can finally remove drm_suballoc_init().
</pre>
    </blockquote>
    <p>Sent new version with&nbsp;<span style="white-space: pre-wrap">drm_suballoc_init</span>()
      updated to&nbsp;<span style="white-space: pre-wrap">drm_suballoc_insert().</span></p>
    <p><span style="white-space: pre-wrap">Will send a new series to remove </span><span style="white-space: pre-wrap">drm_suballoc_new() later as this series is to fix an issue.</span></p>
    <p><span style="white-space: pre-wrap">-Satya.</span></p>
    <blockquote type="cite" cite="mid:4215aa02-6854-4be1-9ae7-418af0752482@lankhorst.se">
      <pre wrap="" class="moz-quote-pre">
Kind regards,
~Maarten Lankhorst

Den 2026-02-17 kl. 13:07, skrev Satyanarayana K V P:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">CCS save/restore batch buffers are attached during BO allocation and
detached during BO teardown. The shrinker triggers xe_bo_move(), which is
used for both allocation and deletion paths.

When BO allocation and shrinking occur concurrently, a circular locking
dependency involving fs_reclaim and swap_guard can occur, leading to a
deadlock such as:
Reviewed-by: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>

======================================================
WARNING: possible circular locking dependency detected
------------------------------------------------------

      CPU0                    CPU1
      ----                    ----
 lock(fs_reclaim);
                              lock(&amp;sa_manager-&gt;swap_guard);
                              lock(fs_reclaim);
 lock(&amp;sa_manager-&gt;swap_guard);

 *** DEADLOCK ***
=====================================================

To avoid this, the BB pointer and SA are allocated using xe_bb_alloc()
before taking lock and SA is initialized using xe_bb_init() preventing
reclaim from being invoked in this context.

Fixes: 864690cf4dd62 (&quot;drm/xe/vf: Attach and detach CCS copy commands with BO&quot;)
Signed-off-by: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Reviewed-by: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>

---
V4 -&gt; V5:
- Removed enum xe_sriov_vf_ccs_rw_ctxs from xe_bb.h as it is not used
  any more (Michal).

V3 -&gt; V4:
- Fixed some nits (Michal).

V2 -&gt; V3:
- Updated commit message (Matt, Thomas &amp; Christian).
- Removed timeout logic from drm_suballoc_init(). (Thomas &amp; Christian).

V1 -&gt; V2:
- Splitted drm_suballoc_new() into drm_suballoc_alloc() and
drm_suballoc_init() (Thomas).
---
 drivers/gpu/drm/xe/xe_bb.c      | 72 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_bb.h      |  7 ++-
 drivers/gpu/drm/xe/xe_migrate.c | 99 ++++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_sa.c      | 39 +++++++++++++
 drivers/gpu/drm/xe/xe_sa.h      |  3 +
 5 files changed, 156 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 8b678297aaa2..a991d9db8164 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -59,16 +59,64 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 	return ERR_PTR(err);
 }
 
-struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
-			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
+/**
+ * xe_bb_alloc() - Allocate a new batch buffer structure
+ * @gt: the &amp;xe_gt
+ *
+ * Allocates and initializes a new xe_bb structure with an associated
+ * uninitialized suballoc object.
+ *
+ * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
+ */
+struct xe_bb *xe_bb_alloc(struct xe_gt *gt)
 {
 	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
-	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_sa_manager *bb_pool;
 	int err;
 
 	if (!bb)
 		return ERR_PTR(-ENOMEM);
+
+	bb-&gt;bo = xe_sa_bo_alloc(GFP_KERNEL);
+	if (IS_ERR(bb-&gt;bo)) {
+		err = PTR_ERR(bb-&gt;bo);
+		goto err;
+	}
+
+	return bb;
+
+err:
+	kfree(bb);
+	return ERR_PTR(err);
+}
+
+/**
+ * xe_bb_release() - Release and free a batch buffer structure
+ * @bb: Batch buffer structure to release
+ *
+ * Releases the sub-allocated buffer object associated with the batch buffer
+ * and frees the xe_bb structure memory.
+ */
+void xe_bb_release(struct xe_bb *bb)
+{
+	xe_sa_bo_release(bb-&gt;bo);
+	kfree(bb);
+}
+
+/**
+ * xe_bb_init() - Initialize a batch buffer with memory from a sub-allocator pool
+ * @bb: Batch buffer structure to initialize
+ * @bb_pool: Suballoc memory pool to allocate from
+ * @dwords: Number of dwords to be allocated
+ *
+ * Initializes the batch buffer by allocating memory from the specified
+ * suballoc pool.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords)
+{
+	int err;
+
 	/*
 	 * We need to allocate space for the requested number of dwords &amp;
 	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
@@ -76,22 +124,14 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
 	 * is not over written when the last chunk of SA is allocated for BB.
 	 * So, this extra DW acts as a guard here.
 	 */
-
-	bb_pool = xe-&gt;sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
-	bb-&gt;bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
-
-	if (IS_ERR(bb-&gt;bo)) {
-		err = PTR_ERR(bb-&gt;bo);
-		goto err;
-	}
+	err = xe_sa_bo_init(bb_pool, bb-&gt;bo, 4 * (dwords + 1));
+	if (err)
+		return err;
 
 	bb-&gt;cs = xe_sa_bo_cpu_addr(bb-&gt;bo);
 	bb-&gt;len = 0;
 
-	return bb;
-err:
-	kfree(bb);
-	return ERR_PTR(err);
+	return 0;
 }
 
 static struct xe_sched_job *
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index 2a8adc9a6dee..5778699149ec 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -12,12 +12,13 @@ struct dma_fence;
 
 struct xe_gt;
 struct xe_exec_queue;
+struct xe_sa_manager;
 struct xe_sched_job;
-enum xe_sriov_vf_ccs_rw_ctxs;
 
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
-struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
-			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
+struct xe_bb *xe_bb_alloc(struct xe_gt *gt);
+void xe_bb_release(struct xe_bb *bb);
+int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords);
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 				      struct xe_bb *bb);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 078a9bc2821d..d4cfc54d614b 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -25,6 +25,7 @@
 #include &quot;xe_exec_queue.h&quot;
 #include &quot;xe_ggtt.h&quot;
 #include &quot;xe_gt.h&quot;
+#include &quot;xe_gt_printk.h&quot;
 #include &quot;xe_hw_engine.h&quot;
 #include &quot;xe_lrc.h&quot;
 #include &quot;xe_map.h&quot;
@@ -1148,65 +1149,73 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 		size -= src_L0;
 	}
 
+	bb = xe_bb_alloc(gt);
+	if (IS_ERR(bb))
+		return PTR_ERR(bb);
+
 	bb_pool = ctx-&gt;mem.ccs_bb_pool;
-	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
-	xe_sa_bo_swap_shadow(bb_pool);
+	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
+		xe_sa_bo_swap_shadow(bb_pool);
+
+		err = xe_bb_init(bb, bb_pool, batch_size);
+		if (err) {
+			xe_gt_err(gt, &quot;BB allocation failed.\n&quot;);
+			xe_bb_release(bb);
+			return err;
+		}
 
-	bb = xe_bb_ccs_new(gt, batch_size, read_write);
-	if (IS_ERR(bb)) {
-		drm_err(&amp;xe-&gt;drm, &quot;BB allocation failed.\n&quot;);
-		err = PTR_ERR(bb);
-		return err;
-	}
+		batch_size_allocated = batch_size;
+		size = xe_bo_size(src_bo);
+		batch_size = 0;
 
-	batch_size_allocated = batch_size;
-	size = xe_bo_size(src_bo);
-	batch_size = 0;
+		/*
+		 * Emit PTE and copy commands here.
+		 * The CCS copy command can only support limited size. If the size to be
+		 * copied is more than the limit, divide copy into chunks. So, calculate
+		 * sizes here again before copy command is emitted.
+		 */
 
-	/*
-	 * Emit PTE and copy commands here.
-	 * The CCS copy command can only support limited size. If the size to be
-	 * copied is more than the limit, divide copy into chunks. So, calculate
-	 * sizes here again before copy command is emitted.
-	 */
-	while (size) {
-		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
-		u32 flush_flags = 0;
-		u64 ccs_ofs, ccs_size;
-		u32 ccs_pt;
+		while (size) {
+			batch_size += 10; /* Flush + ggtt addr + 2 NOP */
+			u32 flush_flags = 0;
+			u64 ccs_ofs, ccs_size;
+			u32 ccs_pt;
 
-		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
+			u32 avail_pts = max_mem_transfer_per_pass(xe) /
+					LEVEL0_PAGE_TABLE_ENCODE_SIZE;
 
-		src_L0 = xe_migrate_res_sizes(m, &amp;src_it);
+			src_L0 = xe_migrate_res_sizes(m, &amp;src_it);
 
-		batch_size += pte_update_size(m, false, src, &amp;src_it, &amp;src_L0,
-					      &amp;src_L0_ofs, &amp;src_L0_pt, 0, 0,
-					      avail_pts);
+			batch_size += pte_update_size(m, false, src, &amp;src_it, &amp;src_L0,
+						      &amp;src_L0_ofs, &amp;src_L0_pt, 0, 0,
+						      avail_pts);
 
-		ccs_size = xe_device_ccs_bytes(xe, src_L0);
-		batch_size += pte_update_size(m, 0, NULL, &amp;ccs_it, &amp;ccs_size, &amp;ccs_ofs,
-					      &amp;ccs_pt, 0, avail_pts, avail_pts);
-		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
-		batch_size += EMIT_COPY_CCS_DW;
+			ccs_size = xe_device_ccs_bytes(xe, src_L0);
+			batch_size += pte_update_size(m, 0, NULL, &amp;ccs_it, &amp;ccs_size, &amp;ccs_ofs,
+						      &amp;ccs_pt, 0, avail_pts, avail_pts);
+			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
+			batch_size += EMIT_COPY_CCS_DW;
 
-		emit_pte(m, bb, src_L0_pt, false, true, &amp;src_it, src_L0, src);
+			emit_pte(m, bb, src_L0_pt, false, true, &amp;src_it, src_L0, src);
 
-		emit_pte(m, bb, ccs_pt, false, false, &amp;ccs_it, ccs_size, src);
+			emit_pte(m, bb, ccs_pt, false, false, &amp;ccs_it, ccs_size, src);
 
-		bb-&gt;len = emit_flush_invalidate(bb-&gt;cs, bb-&gt;len, flush_flags);
-		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
-						  src_L0_ofs, dst_is_pltt,
-						  src_L0, ccs_ofs, true);
-		bb-&gt;len = emit_flush_invalidate(bb-&gt;cs, bb-&gt;len, flush_flags);
+			bb-&gt;len = emit_flush_invalidate(bb-&gt;cs, bb-&gt;len, flush_flags);
+			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
+							  src_L0_ofs, dst_is_pltt,
+							  src_L0, ccs_ofs, true);
+			bb-&gt;len = emit_flush_invalidate(bb-&gt;cs, bb-&gt;len, flush_flags);
 
-		size -= src_L0;
-	}
+			size -= src_L0;
+		}
 
-	xe_assert(xe, (batch_size_allocated == bb-&gt;len));
-	src_bo-&gt;bb_ccs[read_write] = bb;
+		xe_assert(xe, (batch_size_allocated == bb-&gt;len));
+		src_bo-&gt;bb_ccs[read_write] = bb;
+
+		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
+		xe_sa_bo_sync_shadow(bb-&gt;bo);
+	}
 
-	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
-	xe_sa_bo_sync_shadow(bb-&gt;bo);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index b738102575d4..4b3dcc7e5ae0 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -175,6 +175,45 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
 	return drm_suballoc_new(&amp;sa_manager-&gt;base, size, gfp, true, 0);
 }
 
+/**
+ * xe_sa_bo_alloc() - Allocate uninitialized suballoc object.
+ * @gfp: gfp flags used for memory allocation.
+ *
+ * Allocate memory for an uninitialized suballoc object. Intended usage is
+ * allocate memory for suballoc object outside of a reclaim tainted context
+ * and then be initialized at a later time in a reclaim tainted context.
+ *
+ * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
+ */
+struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp)
+{
+	return drm_suballoc_alloc(gfp);
+}
+
+/**
+ * xe_sa_bo_release() - Release memory for suballocation.
+ * @sa: The struct drm_suballoc.
+ */
+void xe_sa_bo_release(struct drm_suballoc *sa)
+{
+	drm_suballoc_release(sa);
+}
+
+/**
+ * xe_sa_bo_init() - Initialize a suballocation.
+ * @sa_manager: pointer to the sa_manager
+ * @sa: The struct drm_suballoc.
+ * @size: number of bytes we want to suballocate.
+ *
+ * Try to make a suballocation on a pre-allocated suballoc object of size @size.
+ *
+ * Return: zero on success, errno on failure.
+ */
+int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, size_t size)
+{
+	return drm_suballoc_init(&amp;sa_manager-&gt;base, sa, size, true, 0);
+}
+
 /**
  * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
  * @sa_bo: the &amp;drm_suballoc to flush
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 05e9a4e00e78..156b6e6fa14b 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -38,6 +38,9 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
 	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
 }
 
+struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp);
+void xe_sa_bo_release(struct drm_suballoc *sa);
+int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, size_t size);
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
 void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
 void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------lYniKR073CmRxGs8DkoY0gHh--
