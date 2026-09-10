Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311C1C79FB7
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 01:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1A410E220;
	Thu, 10 Sep 2026 01:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFu48ekt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1C510E220
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 01:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789002540; x=1820538540;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=21V3ZUVsV6gq83Yh3OH8WX1uq4tRchCxoVJkbz2GSs8=;
 b=JFu48ektoshERVy84vimm6hkRlrxny1/oOEmT8oRufCdc/exXGYThuI/
 DJVZqIByPQesm7OgBKe9idNbLUDzHBAm3KNctMMWL4S0RiD435i7I9L4o
 mqQWuzQCAnZuBnAxx+OpA7j439PVYQIitpurxEEsxD1jqa7yjSqRzZn8n
 01okxozRkV/XMrSncimizGDiVvgCJG2qKNgFhZ9GwGjh062GHrmbJSbHA
 9syyNFB25kOpUA7CmSyjdxAZIljgt2V/e/nDsHTDCbsNWMuGS1TT9Gbnx
 aN1BfhfFrQ0k1EXSW5AetqZZY3LQDA8z/ylhF7CVCk4gSkiJ8GLnqVbax g==;
X-CSE-ConnectionGUID: xyq/qzmPQJS7g0W/EPaIJA==
X-CSE-MsgGUID: h6sBBtZ/SteAiM1fQyE5GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89569922"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="89569922"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 18:09:00 -0700
X-CSE-ConnectionGUID: xqlXmqGHRi+O+bpysoxmTQ==
X-CSE-MsgGUID: 5U/xUORGSGSKVVAv6SxeVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="309733867"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 18:09:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 18:08:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 18:08:59 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 18:08:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S226K/WrenT7/QB3Vi6sgEHmvC0zcCDDXqnGYca8Qg9tTtX1GSuepNk2sD+AnJ/gtVX2sDHVrVFlbo3pjER4EFGxnyErpTcgLz/gKdwSHKg+aruiiB7FbNieVdex94XnXFtxLoof0UD53Y3RC8FLCbYam7p1OIr8FHx2lUFmWF49rHZLgHwvNrwxIb/hhP6UfRFIX0PR6s5EWnx5m8JM1jnTNCgYNW5eXpzjPxtwT22d6uIx/tqxx/0zqAgJSkY9i2v3X8RFZ7MHsKWBsYQXBoGvMt7SZluTOyj4oKx1jpQipEBRGvD77PVVw+TBaTwC34U+JVVrYVXFdLEJ4CUm0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6t5YT7EarJgCYEAJyo5C1Q/Mj1OE6v6WJZZDrwfXwE=;
 b=zPo2ReAqMdmLtfZcLQSut6thHqZ9qAimB1KZXwAGrLrXux3IyWPEMy6108BuqPKu3OXZWJP/ecZtCf2bcvqA8076zFYdZo5treAe3a6QynIVdbRBJZEGLT2u2jw9GMhplzsS2Wap34TBuSyjJ0evp7HGP2hWQu1wKesIfAARKr29IhBqMy95bhouuUysKev2B4AQRpjPHkNM7SQ0ESWpk1mST4cE2dl2bffGx7/6nhuDFV3vdwtQdHHMXN5dj6mh59OgGIobzpHzEYJ4XAJBkiLuNmjyKiwclMscPO+lht/u+IqzQSHgZidg2Yhspm50b9j1EApvqFCPGcYaanRULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 01:08:56 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 01:08:56 +0000
Message-ID: <a85a2c63-8153-4924-8a0e-8db327021b15@intel.com>
Date: Wed, 9 Sep 2026 18:08:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/debugfs: Expose per-engine idle status
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260908060103.999079-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260908060103.999079-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::14) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA2PR11MB4985:EE_
X-MS-Office365-Filtering-Correlation-Id: cc00e60e-868c-4c79-8a1b-08df0ed81689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: J+RCrtERzWSATgfKojpNYt67sfEUCObk1iaK9yE4FR6JJ5eOpUukxbrl1h6aqYJyc7Kcb12+ikE7dGlmzOEgGE4XesfifwqeyKG8UGOsJ2KjXG0QoG3fbY745TN5R6s1/Ed/bxLonwDrkJjtJd2euHwkVV1e5EOW5YPDdGMlteh9wQ7LlNKjHmCDxhnJKmolrWQU4Fm1LxxIRHvliRuXt6o2+QZPdaIELf9EUFNfuoQQj0WxagjP0FANQ0wJgJqMOxm12urL+NSNiTddkkzvogOOyidZL+f6wXVtv6FXeXeSVjveHNHpuVIGvhtCibvdvq79sPqPrnv4Q+nwl+ZekZ5VYjTm5X/kYNkzsQyTShod/5nob4+9/X5PSEmbNgaU2Yw9jGRoZjYPFyECNYoZvoYFrLTOGOKAwxKdDSAhWJlQTI5iFWZcMVwBWGeVAfgiRPYLThXDAfrWnqgMX2vJ47+K8Is3fo0TRtfah2KXn5GSuqQiJm2qEUsyt9Q2Cd2dKguB4OI9aNhMxahGKWXbSKQ012Ai/pqJxs2yHV8w9+CGzsHbIW7sIrVL2UWLW5PY8cZvq3pZKTyLyqo5WvWQY1efWGLrz/AKyq62VM2FERsF69D6GIZdF+UEpSpv1WK2qMeldG5jkO0i8Ok6YRTzG+QornrqTqEkAiuKJFLgjkc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXVBUk9yRStIRFZtSFV0dVZ3VDNJY0hQT0pIMnEwczVQTzB1ODdJNGV1T1FJ?=
 =?utf-8?B?Rm5QY1Jvbnh5NjhqVHQ2ejZLT21BRUd3ODBiQW5vRUxvNlU4elU2UU8zWGUy?=
 =?utf-8?B?VWs1azJBeEF1ZFFhbElVbFJJa04ydGt0MjN6OTJLTUZaWGhsd0puc2F0N3dh?=
 =?utf-8?B?ZlUwWkFRdTlyRllVenJTVERma1p3Q21YQ1BUdkx1ODJJWk45YmNXUmpOTEcr?=
 =?utf-8?B?dDNNMWtLUjUyczF0RHRFUzA0MlhTQjRLSzByK2tFQndLejdoWXE5WDRGU2ZH?=
 =?utf-8?B?d1p6WDlTUWdOa2pLeWZtOEZEZGNPY1F6NUt6TmJKa29iTnlCaWt5TkFaZ20w?=
 =?utf-8?B?UVhoOXRQQW0xSkdNK3V6eHd0WFhDa3FhcEp3ZUxJeFNJVjg1Y2dqNytoelpE?=
 =?utf-8?B?Z1NJUGdPdVVCSzNEeElVbTZyT1hOTzJwRlloQXR6YUphS0g4VG5YN0pmM3lX?=
 =?utf-8?B?RldrZW9kazdlK2laaVluaDFrbzBqN2Z4QkNlQTZTRWc4YitiMVdiK3VDWGhR?=
 =?utf-8?B?MjNta2wzKzZLaWkwMERqRjBCVnhqazFDTkE5czJJQ05iTkpUUTZJd3VUUmVj?=
 =?utf-8?B?UjFPcVZRYWRFRGtjdlIxcFFCUzNuTzN3MWcyeEtkbmZwSEpRR1BqYjJLTUk5?=
 =?utf-8?B?clhHVjRxV3FqN1VTVW5WWlZkZEhGSE1VV1ZCTlVNTThYRGNsanBBMklLaEU5?=
 =?utf-8?B?LzBqZi9WTFNGUmFaN3NjTytVbFVSTjI5cHVNRlNZZkZFQ3JxWU9DcU44QWVP?=
 =?utf-8?B?anlMOWNQWjBldU5sRUNGd1B0U09ZR2pCRHp2U0l1dzhDb2ZvTzRGMDdQdmRt?=
 =?utf-8?B?dFpaRWM4c3RLcHFYeHpwNXU5emFscUJMNFFSSFJOeDNwUW1mV1pJaURFY2M3?=
 =?utf-8?B?MCtyS0Vzbjk4N2JFTlZJL3daaDFBdUJsVk5YQUtMWGF3VmNCajBMNEtVeDRa?=
 =?utf-8?B?c1dnYjU2NW5qeE82Y1RpUWYvZVlGd3hjYnBIaTUvREI2Si9qY0I3Z3RDL3VG?=
 =?utf-8?B?Y2hJUTV6TzU0Y0pTZGp0QjVoVDJUNnd6dncwUlVCTHl2MWhVaFQyaTJ4d2l2?=
 =?utf-8?B?M1ViVkJVK1Y5SFZDdVNqR3dPRUZQNWFLRVlUNmpjQjhRL25GRXRrMmRWZXJ6?=
 =?utf-8?B?VkZsWHJ0OHJvZzhTSTlOdm94a0xGQUxxWm83cHo3Rk8zdVJxYi9ScC9iRnFp?=
 =?utf-8?B?b08vVVhkQ1pHSGhvOHNEYld1UXNodTZtNWxadks4d01xRk9GNk0zb1BwQzRZ?=
 =?utf-8?B?U2hTQmgwYklmOHFoMC9sSE93cVRUQXhoZWJ0Y25PWVVWVDU1TU1xeTEwdk5P?=
 =?utf-8?B?NGV6V3dFTXVaTzdrMkZBT1BIcUtFd1FLbDhzdW9xRFZmYVFqaGw5dDh1T0ls?=
 =?utf-8?B?UWs1Uk9BRk8vb2U5WUgzdDdnQ1hRQXk0S3Uxa1FhWG95M2ZIOWk4eTZIRUtC?=
 =?utf-8?B?dTJ3Qk15TW1YSjF4TTlqM0VXdERJaFUrUk1KdU5HYzVjNGNNY2I5SFJKckFU?=
 =?utf-8?B?Z1M4Y2htZ2QzUmhuWGxUQytoUlNDcXdnV1VEOHRxeVZZUitoNkhOeUpuUk1Q?=
 =?utf-8?B?VkhuMWlPSTRHYmxnd245RWRRYXBKbGRKWWx3NkRNRmFEbmwrRnV4QlRJWFBB?=
 =?utf-8?B?em9RQ1JPM1VnUnpiVFRPMVd5bXFtQzZrNHpLSjdLWFh1bnM0QVBWTHhlbnIy?=
 =?utf-8?B?M1hCU0VvTWJSVVVqNnFBR3MrbllUOXB1VExyYWZuTFVIN2dTWW9DdEVicnFp?=
 =?utf-8?B?Ty84Yk9reFc1QlVUMktMdHAySXpQWVRaK2U4TGtlSFF5Vjdlb0pUeHBKdjQz?=
 =?utf-8?B?SlA2T1VSdG5SVHVXamE1MU1IZDhLanRLSmpWU3NtdHZqVU96cm9xelJuK3RO?=
 =?utf-8?B?c2hId3dxbkRMTXo5K0g0QTR5ZXJxV0NXdHNGUXl1TlpIS0V2V05KUVhJNStG?=
 =?utf-8?B?NHZvSXBEdWJNK3poTmo4R1lqbHdlbEtUNEVSWGpQZ1JWelR2RWZUcVNJc2F6?=
 =?utf-8?B?YzdFM2R6dVZONldDVERxZ3NONEppMlpGNFFEU0VJRTh3emYxQ2RnVUQ2T3dH?=
 =?utf-8?B?N0NTemFQbWJZUWdIeFhPcHgraVFvNFFRbTR0d0hSbkhuQUxkYlg0b0I2a3VE?=
 =?utf-8?B?VFYwaVFRTW5pUys3Y3c3Nk5CZllUU2pzV1ZFUHMrY0lyVXpHNnIreVZLbE1N?=
 =?utf-8?B?RTVRY0tiVE5FS2c0MkkzMlduLzkxQTNVRVROSHdJUnhUTktXWXkwUDU1WitF?=
 =?utf-8?B?YnBLQ1Z5YXJKVkVRTHlGSXQ4OUNSUVgydFlQK2pncjQ1T1RKeUVKRGZuTzdL?=
 =?utf-8?B?Y1NNUkdMelBGN3U3OEdaeEpBLy8xQ2JGQ0FOYUcvOXM0YllpbVZSb0hnRFB4?=
 =?utf-8?Q?rHUqiiJLM0r97WEo=3D?=
X-Exchange-RoutingPolicyChecked: Bj3FjqY8J7retS4/jNMTtZRGJWHc5gEtzlmxMJhNkAUmfIgjyF3UBXrlrYRQqhp0763bdIz5H7+Ii5Qpuc1NJX51NSfm51swDfvWF7vP18gEQGviv/GAdn1dswr3iaizG65Vs+rGxE/Yjwk9Rm43aesW4Bkznj4duFAwCU9euY+Op6Odt+hA5Ze5dF/5IrbTwqKaOi586bVIjL2Aym4qhQ5B3ugFuGA+OYkuwPmOLZlO3e4uiaTgypBRTEGjiNTh1r4dm0gkLdlmZKSie9tP6rKToBTieLKxEyZj1vOZSyZnO5c1XKuLj8gx5sBJGrekWU+e6RcVc4Z2cQ5Ey38Zvg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc00e60e-868c-4c79-8a1b-08df0ed81689
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:08:56.5594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRCaex7Yu8puyWp+570bnHCvyji1TylRRJv5wcLgXx1pkpc2FY58uwjBBd7gx2ci+MpvzR+s5Rc+kLJ6nWP0MT2tXdzXplHVsvO2PorGtDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4985
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


On 9/7/2026 11:01 PM, Sk Anirban wrote:
> Extend the existing "hw_engines" debugfs to iterate over all hardware
> engines and dump their idle state: whether the engine pipe is idle or
> busy, whether C6 entry is allowed, and (where available) the forcewake
> request status.
>
> v2: Use existing debugfs (Matt Brost)
> v3: Rename macro (Vinay)
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 27 +++++++++++++++
>   drivers/gpu/drm/xe/xe_devcoredump.c  |  4 ++-
>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 52 +++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_guc_capture.c  |  2 --
>   4 files changed, 81 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 48c515d91882..933fb880f09c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -196,6 +196,33 @@
>   #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
>   #define   FAST_CLEAR_VALIGN_FIX			REG_BIT(13)
>   
> +#define MSG_IDLE_CS				XE_REG(0x8000)
> +#define MSG_IDLE_VCS0				XE_REG(0x8004)
> +#define MSG_IDLE_VCS1				XE_REG(0x8008)
> +#define MSG_IDLE_VCS2				XE_REG(0x80C0)
> +#define MSG_IDLE_VCS3				XE_REG(0x80C4)
> +#define MSG_IDLE_VCS4				XE_REG(0x80C8)
> +#define MSG_IDLE_VCS5				XE_REG(0x80CC)
> +#define MSG_IDLE_VCS6				XE_REG(0x80D0)
> +#define MSG_IDLE_VCS7				XE_REG(0x80D4)
> +#define MSG_IDLE_VECS0				XE_REG(0x8010)
> +#define MSG_IDLE_VECS1				XE_REG(0x80D8)
> +#define MSG_IDLE_VECS2				XE_REG(0x80DC)
> +#define MSG_IDLE_VECS3				XE_REG(0x80E0)
> +#define MSG_IDLE_BCS0				XE_REG(0x800C)
> +#define MSG_IDLE_BCS1				XE_REG(0x8680)
> +#define MSG_IDLE_BCS2				XE_REG(0x8684)
> +#define MSG_IDLE_BCS3				XE_REG(0x8688)
> +#define MSG_IDLE_BCS4				XE_REG(0x868C)
> +#define MSG_IDLE_BCS5				XE_REG(0x8690)
> +#define MSG_IDLE_BCS6				XE_REG(0x8694)
> +#define MSG_IDLE_BCS7				XE_REG(0x8698)
> +#define MSG_IDLE_BCS8				XE_REG(0x869C)
> +#define MSG_IDLE_GSCCS0				XE_REG(0xA62C)
> +#define   MSG_IDLE_INDICATION			REG_BIT(0)
> +#define   MSG_IDLE_C6_ALLOWED			REG_BIT(1)
> +#define   MSG_IDLE_FW_STATUS			REG_GENMASK(13, 9)

Is this the old version? Still not updated to MSG_IDLE_FW_REQ as 
discussed (here and below)?

With that nit fixed, this is

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Thanks,

Vinay.

> +
>   #define XE2LPM_CCCHKNREG1			XE_REG(0x82a8)
>   
>   #define VF_PREEMPTION				XE_REG(0x83a4, XE_REG_OPTION_MASKED)
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 5f2b90b18f97..b918f046ae15 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -127,8 +127,10 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
>   
>   	drm_puts(&p, "\n**** HW Engines ****\n");
>   	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
> -		if (ss->hwe[i])
> +		if (ss->hwe[i]) {
>   			xe_engine_snapshot_print(ss->hwe[i], &p);
> +			drm_puts(&p, "\n");
> +		}
>   
>   	drm_puts(&p, "\n**** VM state ****\n");
>   	xe_vm_snapshot_print(ss->vm, &p);
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 361a70234d1f..27ee20b03d4a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -117,6 +117,38 @@ int xe_gt_debugfs_show_with_rpm(struct seq_file *m, void *data)
>   
>   static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>   {
> +	static const struct {
> +		struct xe_reg reg;
> +		bool has_fw;
> +	} msg_idle_reg[XE_NUM_HW_ENGINES] = {
> +		[XE_HW_ENGINE_RCS0] = { MSG_IDLE_CS, true },
> +		[XE_HW_ENGINE_BCS0] = { MSG_IDLE_BCS0, true },
> +		[XE_HW_ENGINE_BCS1] = { MSG_IDLE_BCS1, false },
> +		[XE_HW_ENGINE_BCS2] = { MSG_IDLE_BCS2, false },
> +		[XE_HW_ENGINE_BCS3] = { MSG_IDLE_BCS3, false },
> +		[XE_HW_ENGINE_BCS4] = { MSG_IDLE_BCS4, false },
> +		[XE_HW_ENGINE_BCS5] = { MSG_IDLE_BCS5, false },
> +		[XE_HW_ENGINE_BCS6] = { MSG_IDLE_BCS6, false },
> +		[XE_HW_ENGINE_BCS7] = { MSG_IDLE_BCS7, false },
> +		[XE_HW_ENGINE_BCS8] = { MSG_IDLE_BCS8, false },
> +		[XE_HW_ENGINE_VCS0] = { MSG_IDLE_VCS0, true },
> +		[XE_HW_ENGINE_VCS1] = { MSG_IDLE_VCS1, true },
> +		[XE_HW_ENGINE_VCS2] = { MSG_IDLE_VCS2, true },
> +		[XE_HW_ENGINE_VCS3] = { MSG_IDLE_VCS3, true },
> +		[XE_HW_ENGINE_VCS4] = { MSG_IDLE_VCS4, true },
> +		[XE_HW_ENGINE_VCS5] = { MSG_IDLE_VCS5, true },
> +		[XE_HW_ENGINE_VCS6] = { MSG_IDLE_VCS6, true },
> +		[XE_HW_ENGINE_VCS7] = { MSG_IDLE_VCS7, true },
> +		[XE_HW_ENGINE_VECS0] = { MSG_IDLE_VECS0, true },
> +		[XE_HW_ENGINE_VECS1] = { MSG_IDLE_VECS1, true },
> +		[XE_HW_ENGINE_VECS2] = { MSG_IDLE_VECS2, true },
> +		[XE_HW_ENGINE_VECS3] = { MSG_IDLE_VECS3, true },
> +		[XE_HW_ENGINE_CCS0] = { MSG_IDLE_CS, true },
> +		[XE_HW_ENGINE_CCS1] = { MSG_IDLE_CS, true },
> +		[XE_HW_ENGINE_CCS2] = { MSG_IDLE_CS, true },
> +		[XE_HW_ENGINE_CCS3] = { MSG_IDLE_CS, true },
> +		[XE_HW_ENGINE_GSCCS0] = { MSG_IDLE_GSCCS0, false },
> +	};
>   	struct xe_hw_engine *hwe;
>   	enum xe_hw_engine_id id;
>   
> @@ -124,9 +156,27 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>   	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
>   		return -ETIMEDOUT;
>   
> -	for_each_hw_engine(hwe, gt, id)
> +	for_each_hw_engine(hwe, gt, id) {
> +		struct xe_reg reg = msg_idle_reg[id].reg;
> +		u32 val;
> +
>   		xe_hw_engine_print(hwe, p);
>   
> +		val = xe_mmio_read32(&gt->mmio, reg);
> +
> +		if (msg_idle_reg[id].has_fw)
> +			drm_printf(p, "\tpipe %s, C6 %s, fw_req 0x%02x\n",
> +				   val & MSG_IDLE_INDICATION ? "idle" : "busy",
> +				   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not allowed",
> +				   REG_FIELD_GET(MSG_IDLE_FW_STATUS, val));
> +		else
> +			drm_printf(p, "\tpipe %s, C6 %s\n",
> +				   val & MSG_IDLE_INDICATION ? "idle" : "busy",
> +				   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not allowed");
> +
> +		drm_puts(p, "\n");
> +	}
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 82df19b304e1..5a4d085660a2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1868,8 +1868,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>   		snapshot_print_by_list_order(snapshot, p, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
>   					     list);
>   	}
> -
> -	drm_puts(p, "\n");
>   }
>   
>   /**
