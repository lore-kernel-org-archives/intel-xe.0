Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAD4C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 21:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057601137FE;
	Wed, 17 Apr 2024 21:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/EyQRUB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B691137FE
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 21:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713390479; x=1744926479;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=rRTySaOWl9O/naIGjER3gNOyd6gkeYXyawlGJ+DhYkM=;
 b=S/EyQRUBqW3LLUP8lIqL5abjsNS6/9ie7Odnz7iNSu7+6/5flxXKtABx
 ko4s0MICEbmkJMNdr1jn+BKLZmMGDr0j/RAUgQs23fP3bFWP/ufHmBES+
 XPGuhWuv38SoqwiUJIkXXoVhy6rJsixuIO6GEfJBmH3WuA1aYmF4n42lV
 G9MaHG7hnY+gjhnHvbQ9aiIhPdHAe0zvzwshnFJG1rEOF1IciKHlrBXvM
 Tdcgc9FRrUIJZf5ccm6RnfH31/CBwJ3fqTFaEyoJYfn37MIMPue24XCjf
 PT6zO6PHW6CLzvXaDa90Wa7FJDx96Mxk16Cv3/0U4boZaD7UZfPSyWSo5 Q==;
X-CSE-ConnectionGUID: ZLyJzAovQSuyoDHs16H4Fg==
X-CSE-MsgGUID: fpPrUEzXQZ2wwl/U32O4cQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12691915"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="12691915"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 14:47:58 -0700
X-CSE-ConnectionGUID: eLQkwJtPRm+KCEoOUR6rrQ==
X-CSE-MsgGUID: HgtlhQRMQnabS4VZd6Q3xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="27335702"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 14:47:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 14:47:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 14:47:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 14:47:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 14:47:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOMkpCe52rvv/GjWfCJtPVzkYUJMOewyKq75bSf1BMt3pltLyUVZjGfhUV+s0VLEXHCu7O1vTQ1lam2+sAMA9TbxMTylCEBMxiYRyrW/eWA1pg2HwWuxnZlmRq3J/6OfT3GY1Dq6UtwZLGTKAvBYj9oPn1/VrkH8QZOV4H19ZS2Wdi4NxB/qKFCSP9WB1tQVWIJqABQb+bHZGFvoMrmqmNw2vnD6zZp5MoJztHNCS+YF3AD7mltCluazeYIjLcJ80XfN85OKdPgyTUwwZnqECLYSUtjazFy3HYjygjDgjrx38mHtuxbkbQkoivYwlHUkDPKH0+KCO3u+wAu1W2L4HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yr7IRkPjeYE69dkWtD6jKl9rSK0VXhEbYkP7sP6xqU=;
 b=LU3IdNWez8BDK8tnw2eXOBmM3J0j0JkY8VsQ9iajrhSmIUTAm//eBppzj8YfsDPXWps9rYGrqQKDVapO2EQm3YqtPCyVTX6FwuVpACcbepTIDtMYfLP66zu0mO+BhsvrnGwDmipGEoNIkDs9UFa206XYS3ax7vbmLDG9Z0GH2UZx8sP/E0NH7fGkniaM0nW2hRJuoCmdbCa4wScgEIKLtYb0mVvp903CIuBUrxvZhKDIVR6/kD8YIiWvjqU0Vhhik8vTQH/sUaGyZkqLN2hXtS5LkDifj7VyEViQJ4wKAQ9qrG8R2nRdXuo3sP50d3KcuSoUpg5VdChX8Hf1su1YMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS7PR11MB7951.namprd11.prod.outlook.com (2603:10b6:8:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.28; Wed, 17 Apr
 2024 21:47:54 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1%4]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 21:47:54 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240417212501.312346-1-gustavo.sousa@intel.com>
References: <20240417212501.312346-1-gustavo.sousa@intel.com>
Subject: Re: [PATCH] drm/xe/xe2lpg: Extend Wa_14020338487
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.de.marchi@gmail.com>, Matt Roper
 <matthew.d.roper@intel.com>
Date: Wed, 17 Apr 2024 18:45:47 -0300
Message-ID: <171339034765.54602.16408540374552896913@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0292.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::27) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS7PR11MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e5e786-f0c6-4407-942f-08dc5f280974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG9jaEw2MFV1ZW9WTjc5c0pYdE5LWnBGMHRXZkR4Q1ZCejlxZHVleTlnTGhi?=
 =?utf-8?B?WGNNejE1b0pScC9KejNTaUVJMjB1eEoyckZ3SEJkR3k3QWpOc1NXRUVZR2tP?=
 =?utf-8?B?N0p1eG5CRXZRRlhjaEUrTy9vQjhxeVVza2QvZ2R6RmhNT0U1R2xicFhub0sr?=
 =?utf-8?B?Z2pwSGcvb0dTOStKbDY1MGNmQTdTUENXL0hSaWpJYUxrN2xNcVZWNGxxR0ZS?=
 =?utf-8?B?M2M5djVlQVBIbmpnYkl6Nmd1NVQxTVk0cWFoV3ZIV1IxVzNickJRSDgzc3Bh?=
 =?utf-8?B?Uk9BK0lURXEvUnJsd2hndkgwbE5ZV1h4Tnl2ZlFyZ0FwQ3VISjFGdHhhTkxn?=
 =?utf-8?B?M0kvcm9qYVNhSmJ5RXZLZWlYb0VUVEpHRC9zTkxNUzBJVWppckJ3RVVOaWY2?=
 =?utf-8?B?U3o4b2VXajJLcFozR3ppelh0QU4zcWhFVVg5UGl2c3VjU0luTHEvZjYwekVs?=
 =?utf-8?B?cHIyMUZTU1RqeTB3VWFYYkZuNTJGQXduOGx2cWt1NWJLVUtDNkFWZmpVTmg1?=
 =?utf-8?B?QlAwb1dlTVY4Zk1jcTdpZkxQMXNHelFTUDVMWVZKc2JxWS91VU44TDlSb3lh?=
 =?utf-8?B?c3kzdzBNZzFNQ3NsaElUbXJtRmdpYlBDVnQ0ZW4yQ3dkT3FSMW1UUm8wZ2dV?=
 =?utf-8?B?c0VpRnJwbXpjVTdNbm51bkVkdDVZV2ZSb1loWk5PUEZ3WThVY2NIZkVPSWdo?=
 =?utf-8?B?VG9QdXUyaTJMQzFVOEhjc2M4dzhBdGE0ZFR3TTlBSEtmTXNwVFA1NGxhMUFH?=
 =?utf-8?B?Wk95WjcvVVkwT3dqd2RzQ0plZXAyY0IrRk5wZ0xmUHN1a2hCek5laTY3Vk9P?=
 =?utf-8?B?OThPTzdBV1ZLS1NWUkg1dFc1U2VzZ0VvR25pRktZSDQ1RWEvQ1FjZ0ZZdHFz?=
 =?utf-8?B?aHZORTV0S0ZUcFJVa3BIME5yWjAyM281RERDQndPY0svMjlSWXB5S0kvQzdM?=
 =?utf-8?B?eHhyWUdHUTl2ZC8ySUdzcU5OYzRCeFozMUNNNXhUVXE4U1ovbzZVaWNkeVIw?=
 =?utf-8?B?Qmx4dDhRT1F4WnBJeDRDVlFUbmxBWUN1RE4xR1N0MURjRkMrTCtYVzRiVS9C?=
 =?utf-8?B?RzhxcFl6UWorNm9EU2VVOCtDUGtjWEVCR3Ayc0laUlZ0bnFDcWxicUZJMUk3?=
 =?utf-8?B?b1REQk9DbWt1OG9ta0hneUU5MVZYa0xvSWRVeXhGTVpyOUpxb3drWWQyNk01?=
 =?utf-8?B?WEExNDZMVU9vR0JmU3ZtVEErK2gvWlkvcVp4UkdzS3FSK1oxWk5zSi92Qmd3?=
 =?utf-8?B?UGxIYjRubHFlWnJ1SGFRSEJEYkVWQUlUY2pyTGhoVGs2TEI4S2F1YjRVWWx3?=
 =?utf-8?B?a3Z6Y3QxV0xYd0F0OVc1cWNLRVF5WnFoVDRsVFppZ1NsbGNUdXh4ZDFGbEkv?=
 =?utf-8?B?Z2hrUkljVU1zWWVLcTJQWEFvM3FsOHBYK3d1dFJYYTltQTdyUFFyZ0FhOFFh?=
 =?utf-8?B?R0gxWE5PQVIzcndqaDR4WS9FMDB1eFJpRS9zMDcrT2VXdUV4Zy9IaTJHWm9w?=
 =?utf-8?B?VE5wbWpHeXZBbmVWd25XWklwZ1lDUmpWRXNKcFVLSnJsZStLQlE0NmtIYVhU?=
 =?utf-8?B?eGdqWDBTaWUxWkd1cW12eU40aU9FV1dGbE80MTdEWGpRY211cm5hL09rUGdi?=
 =?utf-8?B?dlA0MDZUYWRUeGpPQjV4QmJqQTllOUlsQkk1aEUyNWR3Y0hpNlVJYWJSTHQy?=
 =?utf-8?B?ZWtBam9ubzIwd3ROTUpNY2w2dVlMZGNkYkdZUkFFdXNHaTMybWtkSGdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2l1M0Q1dVlyWW5keXhJYjVFT2gvczJveDhhMVh4Z1hod2xzSGhpYjlxOVhF?=
 =?utf-8?B?UXo0U2JuRVVtNTR4MVczVkxycFpzT3o5SzRnbkpzbURGUitVUXhIaHJ3Y0RY?=
 =?utf-8?B?T3pqYVZ4T1BmSVhZdzhJRGVXTUJES3JXb2pMUkpESFV6Um5iQXJwditIK3ND?=
 =?utf-8?B?YjhMZFlLaGwwYnc4Um8xdjc0d1dDVnBzUjdUc0M3d1JGK2Z5ZzJWTnVCMlFh?=
 =?utf-8?B?bUhUYWc0cWMyMGdkUExFdE53eWpZY051NFNrek5zMzZRT25mbHpkQWtqUE1S?=
 =?utf-8?B?Ym1ORmlkZHp5emhnVTdtOFVpTnZGUGk0SGdpbUl5RGRRQUxzaWw0VHlka2w3?=
 =?utf-8?B?ZFQrSzVtdnk2aFMrc1BZNC9NRkF2dWZOKzdTY2ZmT0JuMC9tZUxucnJ6bnA4?=
 =?utf-8?B?M0g5T0hlbVdGR3Z3V1JXUUxDbjNjTm9hUzhvZkV0QkhlMmRscWFFSFE4eVgw?=
 =?utf-8?B?NjJVdFBKYTlueE1WaXdvbk10SFREcmZSNzN3UmZKYVZGNUFvRHBFR2N2Q0lm?=
 =?utf-8?B?RFVycW00WHYrdEg5ZzlGbm9pNjMvY2lVcU1VS0lMTFBKbE5ZMXA3OUg4bm5W?=
 =?utf-8?B?eXA0ZUUvUXJNZmYzYmpvSk1HMUpqWENEMXRnNDd6NmxoTE04U01wSnNucnZR?=
 =?utf-8?B?NzI5WjdoU3BWc055MkJhSGlaV1pDNGRXcmZ5VG5ObHVGSTVrckFPOFdYVEEz?=
 =?utf-8?B?dkI5WjloRDNjY3I5Ym9XMzZTODl0Zzk3VVBHeFd1L2tJdVpnWVhVU0JHZnI0?=
 =?utf-8?B?QWliL1R3ZVRYRjdaempvOEt5dEIwcDB5ODhQcWlVRE9qbnByY0NkY3FqVDlU?=
 =?utf-8?B?Y0hKMmtzam0rVkVZaysxRE1HcVNCbE1yOVdRUmFPQXhaY1h2dEVveG53Zldm?=
 =?utf-8?B?ZUFydHUyN0tOWEJxTm5mdTlwaFBHZ1E4STloeFgzZC9JRW9JYk5SWHdmMWxB?=
 =?utf-8?B?ZVozUjBKUG8vblB3R1ZiSjhGcXhrT21OQVVnb2ExMUlsRHRGRFA3b2xSaFMz?=
 =?utf-8?B?SVpQTmsrWE9uT2xKR2FzODJ5am9KZjZyL0ZTYVBHWkJ4U1pOZkwwNEU4WmRF?=
 =?utf-8?B?Y2RveGhTajZTMzBvTjZVelgzK0JrREJHTmQrb0NzaVNsdlIxcW5RUzR1c1RU?=
 =?utf-8?B?aFJyclowajM1UFNtTXBmWWZRWU1wYmhiVXhmalBCNlpvbmV5c2E0N2REa241?=
 =?utf-8?B?T1R0ZlU4NDRVZHR4ZmFrQUptRUxHZFg0M3FqTjRMWVMrWDlTekRrVDZqTExi?=
 =?utf-8?B?VzdYakIvN2FaMHpiYXYvUldVcCs3SmtXOGFEcE1MWDIzUEFnU0VHRkFkOVg5?=
 =?utf-8?B?VjRZNU1PSnZpVlRybXBpN0FzOXFVbFFGZ2hReThjd0wyaHk1THFsNGhFQ1Fr?=
 =?utf-8?B?KzBHNnNpN2JZZ1J2eEllTVBOb2NSYzRtRGRQKzJjWStyZnBzdHVtb2IyaVhq?=
 =?utf-8?B?UzZwUDhFaGNGZWNlZjJTS1hhamI3eTBvVXF3WENqNGlYa2U0R3VXdlJEdk83?=
 =?utf-8?B?UURXY050SCt4OVE3L1NvZkxRb0RoeU51MDZ1T3MzUFdwQjJkcUJCMTN5TTlt?=
 =?utf-8?B?Q1RZTjNJOXF0ekZlL3VqWDM3d0pEQzNxNDlVSzBRUkYvSVRpRmlEV0d5am5a?=
 =?utf-8?B?dzJtQTE4ZVQwTm1IQVUvdVB1bmpRYm9yOEVXVmpzS0hYR1FrTUhMcnJOMm5o?=
 =?utf-8?B?VUNueFVwUlJlaUkrLzJPSWEyT0Q4QUtIMFFUZm14NXR0VG1WVUZRSFBzTy9l?=
 =?utf-8?B?N0RtaXlZVi85OFVTQVJPZCtmc29VWE12UXR4c091UDRTYXlQL0V6SmpsajQx?=
 =?utf-8?B?czNYaEhpRUovVkMzbk9tcWFzcjFFY05oSWFCNmJYWjR6ZHlHN0xKTjUyZFNz?=
 =?utf-8?B?bC9UREZwVWdTZ0tDb2FwQ21icDFkTGNZWlpMM244dU10cUJNbmlnUlhGVGRS?=
 =?utf-8?B?bjR0OXp6QWZyRTl1bTNqd2ZFSVRLMzNwTm9YaUZkdnRJRDRBTzNVczlRdG9G?=
 =?utf-8?B?R0FEczBQSGZReWVWSENscDdZTXdzamhRRG5lVTJnK3RQOFNTQ1VxR3Z4OW51?=
 =?utf-8?B?WFdWRHplVnBMcGRDeDhRUUlMU0ErZUpVYjYzTE1OUVk4MEhJVE82SmhMVHQy?=
 =?utf-8?B?VksyUjYwY2ppMEIyYjNlcVJBRVdidmlaaWt6S3RyOTM5VmFmNGxOYzlXWFFz?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e5e786-f0c6-4407-942f-08dc5f280974
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 21:47:54.2720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1soRtLSf8OBTNsrfv/9VR/JhWdm3j7o1ztkjBqzBy2nGhTwYg6gMsf+C/UXy/GWK7oCuTutisqxLkX0UJm8+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7951
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

Quoting Gustavo Sousa (2024-04-17 18:25:01-03:00)
>Wa_14020338487 also applies to Xe2_LPG. Replicate the existing entry to
>one specific for Xe2_LPG.

I would also like to take this as an opportunity to discuss the way we
are currently arranging the RTP entries for the workaround. Using this
one as example, created a copy of the entry and edited the argument of
GRAPHICS_VERSION() to match Xe2_LPG. There are multiple cases already
following the same pattern, mainly because we are grouping entries by
IP release.

Do we want to continue following that pattern and keep the code
duplication? Or should we think of a way to avoid code duplication here?

A very simple approach that I think of is having a single entry for each
lineage. But I guess that's not really feasible today because I guess we
do not have a way of expressing logical disjunction in XE_RTP_RULES().

--
Gustavo Sousa

>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> drivers/gpu/drm/xe/xe_wa.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 632bd9066f8d..dcf7ed51757c 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -445,6 +445,10 @@ static const struct xe_rtp_entry_sr engine_was[] =3D =
{
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>           XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5, DISABLE_SAMPLE_G_PERFOR=
MANCE))
>         },
>+        { XE_RTP_NAME("14020338487"),
>+          XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_re=
nder_or_compute)),
>+          XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>+        },
>         { XE_RTP_NAME("16021540221"),
>           XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>--=20
>2.44.0
>
