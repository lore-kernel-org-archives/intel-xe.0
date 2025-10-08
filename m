Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD185CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 14:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7F310E826;
	Wed,  8 Oct 2025 14:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awogT2NZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E6E10E826
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759932387; x=1791468387;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ompkHmFUmHGlqe13Tv0jDVAYatNI4/QaBXt/vE6B/l4=;
 b=awogT2NZiwZ5YbzZeOWJx6xubj7jo4yecRbVtD9N8ox/+zow7pyEFYWY
 VSxrx85o4ruPRJhWKVqpuseE27vNzegXuNm+FxYjvvweM4h4QkzYy4epm
 PclYacJYWIWV8FgDrBTODSJHR3drFTyl28HiqNrawBAsVaJPEV+FBHfFk
 AxDobkJ/sePRQ7XMjpt+JvQ7KxvV0Vs2cv+N2RFMlcvWEjqpDGDWTL+We
 3jZvsz30XBWfNhwj1BSUX52Hg3sEj7La3OhVFJSPGE84PWyie5JHyw1/Y
 +/7lC9vIE2Igl9nXmbh6xHVz+XufxKF9G5ER7eSEsKvr9JmFMS8CrXmki w==;
X-CSE-ConnectionGUID: 0OrtO23QSDuqRy1NecJJKQ==
X-CSE-MsgGUID: 9KAsnuyeSgGMiBojysFrMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62168910"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="62168910"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 07:06:27 -0700
X-CSE-ConnectionGUID: sp+g+UGYTzmiIpiFBZOu7w==
X-CSE-MsgGUID: yxmMm2ZiSoiqsJyhCw47ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="184717099"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 07:06:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 07:06:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 07:06:25 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 07:06:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0GLE92zQ637aTv+IgzagWtEqvjYad0dlr5qhVcqmttMoAkkNXxwujYeIpTWvMANwEWVhHw1zMqJULyWZMtCW58Nq4heosHFO3K7l0cuTzErXSVSIfcsRMup7VhxXpo8W1UA0jR1Rgq5nHmALWBG+MthsP4mr0XqXfpUdIm49OQPDv6F4t07l53mqGMCYLRYUJIQQDeyW/wO6hHHR5BFt7up/kk4CcxoVwzjdILFIn5Gpmbw1hMYU5U0ytOkCnVufGDhgmSktgIOuib7d7KjTcN1uJfqL10oVlk6XMaE2PHNKQ0Mmxt5GvM3sF82yE3k3EsqG0ySHqn9XkDGCJ5hdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uI7sPRjmK61q1x5av/0fO43Uok45GBJfVCzWiKQb6V4=;
 b=tDNfD8Niondkn7awTtJSxSo6nafPJ3HmDET6yoB8I8tS5Vm/Li+xWX1HeqpHieN6Zol4e5fqJcwcZmDxEv0e8VW18VAMIg5eHIWEx4ihzjI+GCqnDJJp5skOFFeY8fBh9m9qiXakljPdcR7HCMHb18uex6K+y8iK+XQK/RQ+sjqwXmG0nheP73Hwdsr/7jA1z31jVnpo9hucwvlPKrtG6YF45OGV1/mRTfu9SS1SdmvQ0NagDc17hCi/Y174skdIl/pGE6XVc5ED/wm9jvcg4w1gYyohD4vM7F5wTJQqZbszXiNdlbCIceS4JfSL6EJ/O0yxNGTRk0+A2qxUxD8Hwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Wed, 8 Oct
 2025 14:06:19 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 14:06:18 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251007204829.1468209-47-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-47-matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 22/23] drm/xe/configfs: Add attribute to disable GT
 types
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Oct 2025 11:06:14 -0300
Message-ID: <175993237464.201562.8329727487094559284@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::34) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CO1PR11MB4851:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c20bb28-9ebf-456b-facc-08de0673d9fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OE51Zm9mUVJDQTVPRkx6dndHZkRrbzg3dDZaVlRtNHRPcHNvYkVhSkpHL2Zi?=
 =?utf-8?B?SS95UFl6bURTUGJsSFlNMXJCdFhBTWJRUk1hQzJjbVNYTUN2Y3I3QzEvc0J3?=
 =?utf-8?B?aFU1VWplSHdtR2w4VmMvR1JzajFzK1ZFK0pEVmx1Z1hBZ2w3anFtVGRjcEtB?=
 =?utf-8?B?alRCWGJMOUtxaENhQ1dpSnVPazBsZzQ5anhseFhOcWxJS0RGUzJqVTkxb2F5?=
 =?utf-8?B?WnZEZE45ZERadlZUK2FzMDNKSUVyYytTWWI3N0R2YytzL01MVmNiZ0E1SS91?=
 =?utf-8?B?SVorTnZIR1NFWTd4Z29PMm1NY3dGdGVoNkJEUnBIeHFLQ1hDNDhWZnFLdTJ1?=
 =?utf-8?B?K1Uxc0tFTWliTCtBN0E3MnBPZjQ5eWlzSmR0SUppUjhGV09sWFdicHFvenNw?=
 =?utf-8?B?YnlaUGhpWDcyZ1JHTWZFQmhGdGQvQ3JRWFcxZ3pndlc2RWJpN1VhM1ZiRzF1?=
 =?utf-8?B?YnJIT0ZaRWdqcnZtcXZ4MWdYRFJTU2NKYjlXRi9sc1pqa05CUkVCTzUzOU1u?=
 =?utf-8?B?algxd0VGdlRBZnJxR2ZyZzQzb3c4STkvWlo2UUh1VEFjMkdmbFptMC85K3Y0?=
 =?utf-8?B?ek1FSzRyTmMvYWZ1bzNOV1NUYk5KUEVJUEk4MWRoOTdEa3VGQXFBK3NwaVo0?=
 =?utf-8?B?SUdRTi9GNm5ZbzVyMVZmQU8zdTl2cGJsWkIzVEZDbUVaRjVTSkF5VmtWTHc4?=
 =?utf-8?B?OUorbkN6VGoyZWhMRTBGWWRkeDJuQnE1dXhYdUZUUHFCb25CVFMxMmFPUmYv?=
 =?utf-8?B?VEp2aUJBWGF5dmM3RTFzWUhnb2RSZ1dXZEZ3UWVuU2pSeUpmNWdYM2xvc25u?=
 =?utf-8?B?S2M2TVRMVWcrcEErMk0rQlJaNVNURWM2d3pQNTQyQjFCcmpyZmlMUXpjQ2Zo?=
 =?utf-8?B?T3EzWU9ydVdRTTRvMS95NGpod25lQ0FyeENNbDR2YjY3eEtVQzBQR3ZtU0FC?=
 =?utf-8?B?YVFFNVE0NDVkS3JvN2svTWR3NWorMjlKMFBXS0gveEwvY3hmTWt2eXUzdzkx?=
 =?utf-8?B?ZGRiNDMvZWRVc0szZlE0WjRWK21YREZkUXhuT3NzTVFJSVNJZStJdjJZVi9E?=
 =?utf-8?B?Z01OSm1Rdzd4Rkl0L2p0aUozZktOdE1pSlR3bWNMUGFzQnlWbThrMXlyb3VS?=
 =?utf-8?B?QzgzTXZvejBvM0JadFhXOERDM1pHYStnbXRaT2hvV0hIdWpvRG91ZmxZQ2hz?=
 =?utf-8?B?cjQvZVc0Tk8zcWNld3ZpSGhYaFhxampSTVE1YStPTHMvc1Y3L1lqVmswQ2s2?=
 =?utf-8?B?ZTNqb3JBU3RsK0IzekhWNGFqcUdBZFRpZ3NPS20xSlBocytYYlRUUUM5bVVh?=
 =?utf-8?B?bkt4Smh6MjU4SjRtb09OcUdTMmRnQTJwdnRGb0VrSVNxMjlmWVpCOGtFcFJp?=
 =?utf-8?B?elFaR2NEbTUyNmxaOXp4UnVnZUthU0poNEcyTnl4aXJZRFB6K1VQYXg0UDdX?=
 =?utf-8?B?b3lNWDJlUlJ6VEtyNjBxYytqVGRnNzY5anBzVEdOeG9kekE0TkFVOVdqU25l?=
 =?utf-8?B?ZTZtckpRVldoakt0bkc5Vk9EZ1IzM2JlWnhRV2tBRmlWUndnelNMWU9hTTNs?=
 =?utf-8?B?eVZNLzh3NDk4SFJMUnJnZW5EcWIxcUFRcWxLb2luUXRjWHpEUkwvYm0wdTZP?=
 =?utf-8?B?Z3VDUGNLVXlUMExkNmdiLzFzSURBU1dFTTAvV25Pc01XT0NGTUhmUDN5YmFr?=
 =?utf-8?B?N2JJV3FMQ24yenlFVVhTN0xramNob3hnQ1lER1hPZWRyTzVYazJsY2lKSEs1?=
 =?utf-8?B?bFRrbHgzMlZVNGMxUExwNXdZdldQNlBLcDdQMlY1N3hnZWkxOGloQnhKbVVW?=
 =?utf-8?B?eTBtckRSUnlvU3cxL0pFbDRyTGIrQlVQZ252TzdPTElod1hzSjQxRDFOQ1JL?=
 =?utf-8?B?ejJ0TnBWYzF4ZTlKS2lzUndTdHFiNi83bmY1VGgvQVJ0OWJCb1FnaVZ2cXpX?=
 =?utf-8?Q?m+VWKa3rQZVgkQRex3e+CyjKrOobSv9D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVRNSzc4UVJkOXJ0V2FhK1RmRTBBNUF1WnZuVldiWXVSazVNRlFQY2Fubyto?=
 =?utf-8?B?T3F0TUo3OG81SGp5Rk1BNmNrOFJxZEZwaEIzcHZhbkFZNmdCM0hJSXRqV0xG?=
 =?utf-8?B?TWw1NTNqaU5mUGpodWh3NXI0K2E3RFhEVzBzK29ZbGVZb0paWDByMjZ0aWxx?=
 =?utf-8?B?Y25rL1NaWFJQMGJHNkRaaVhzZ1U1cmZWaWw3Z0p0cEc0UFBpS1VIOHFTTThD?=
 =?utf-8?B?L1crQkt5dEpHcFJ0RXBsR3pXY3hJZmFueWE4a1d4anllV2RaY2x4bm5ZWlNC?=
 =?utf-8?B?eFN1Q2VrRWp3VFpFSDBBMTczcnUxL01RVTRZMEY1SkV3eEhKdmdBSjU1bDZo?=
 =?utf-8?B?Qm5BSUtnbW9hMlNpckxSUU5MRCtKOHJlcldXeEU4ejJhT2ZIOG82OGxvaERR?=
 =?utf-8?B?NzB1Z3pxbE1vcE5OelJDa05rSGJILzc2VTd6NndYdWtlemdXZnRzbGlOTVlP?=
 =?utf-8?B?VlRON0VqRjhWQUZ0a24rNE9KTUtaWUlzMjVPTi9TVC82RksyYUhDaFdCcTdI?=
 =?utf-8?B?bkRUWitIdGtEREY0eWxkUmQwaCtnWHZZMlFhUE5aTmJFY3I1UFdnTmZXaHBj?=
 =?utf-8?B?RVhDQnVmZUZDT3ErSGRDVzgrdXF5VzgzSG0reXljdVQwYzhYc1B1d2hPNS9s?=
 =?utf-8?B?N081d0xaNytCSTFmVzJFZGpmOHdIR2pKajIzZ2FmQVpLUEdXRTZWb2lJaEli?=
 =?utf-8?B?VGRzUk1jbE0yTUIwa21saXJ6enhZdGhEMUJsZ1pvc0IwcTVZYzR5V1BCbHVw?=
 =?utf-8?B?aEdDeDFaVW9SMHZlR1RIekNXdGY2bEN3L0lZY1RJRUw3ZjNFTHFCbjVYTzlL?=
 =?utf-8?B?ZkZaQ1FJcUo0ZTJuS2ZxcUxDcjE1RjBpUWhNNHorb0EwWGVENlQ3dTFxa1Yx?=
 =?utf-8?B?bjY1am1DbWtiSmJkMUFxcml1OFJpMG10VTlUMHNzWnluV29xZEtRZnRvM0or?=
 =?utf-8?B?eWRZeE9QZHRRUG9lYm56Z0F2aTFOYUo1SmI4OXdJREZPcC9idmc1TzN1S3Vr?=
 =?utf-8?B?ektIVmoxb2RIdlhYVFQ3TXRDbDdBcXRJMFY3WmJwQUlma1VRTkJKemhPaGxY?=
 =?utf-8?B?TEpmbWhZVXNYaW8wVHpWUVp5WVJzbUIvZ1F0bit0ZlZoRFdUNmtZRzA4dXhO?=
 =?utf-8?B?TThnL29UU2oySHhlZGhiRVhnbkpQdXhEcjNReVluMlVHdEYxVlJNMUtaLzNV?=
 =?utf-8?B?QnBwdlhJazZScjlPYWtzNUw3MUp2Zk5GY2I2MkViNjBYVEpjekFTQnBJd3RK?=
 =?utf-8?B?SjlpYUhzQzhzRjdhY2ZWTGNEdkFMc2NvSFltcWlseWduMzdBMERqeVdKUlZK?=
 =?utf-8?B?SC9XdjZBU0ExMXNacW1VaFVnVkVuNy9IMC9rZEtlVzJFYWlvRzZUZzhQRE9V?=
 =?utf-8?B?L0pCdklWamFzbFpZcFRIMXlwKzNDZWltVFlIa1J5UG94VWFvQkE0WWloczVz?=
 =?utf-8?B?c0FkRENVZFVlbldzc0JncGF4bnA1aVROTURzdE42ZUlWL2cwMkJJalpJME5r?=
 =?utf-8?B?bko1T24yNG9jZ2xDcXY3M3NRL0NvcFZtQ3hDMGRlcTNxZnVySmJZSzlvV2tN?=
 =?utf-8?B?RkZPZ1ZQbTMzOUFpcDRnWDh5NzFFSG9zOXFkZ2Z1WHlMKzI0Y1QzVFVMY3FV?=
 =?utf-8?B?bXZNS0toMmk4cnVXK1k5Wll6Q1lhMThBNUt2WXB3ZWxrTkNpSzdjYWxJaWVk?=
 =?utf-8?B?N3F6OFRBWklhMnJSVmkxanVjTVJXaFBPbVkvOVc1VVd0OGl3S2MzMnFmQ3dq?=
 =?utf-8?B?Nmp3Q3dvZUF1VEJ0VnNGL215SnlBakYzajlrWmNvTVBXK2dQVHc4clBib21E?=
 =?utf-8?B?WXNjKzBZZDdpeC9xV2dHSkFsODcvUnB4T0gxNG43NVYrc05YM1g3Yng2Mi9G?=
 =?utf-8?B?SVF3emE0V240TUVacWphWlRUSFNpWmZhZ3cvWjQ5QWJaTzZ1QktOQVhBR1RU?=
 =?utf-8?B?K1l3MUtDckFOUTFHdVR5d1pQZW4ySXpuNmxZeXEvRVNObGVIOFJpMHdNdlhN?=
 =?utf-8?B?K2FldkdPOU1jOUtOT05wcGZkdjdNV0UzM3lld3A0bFhjZmJpVlM3NHVtUkFo?=
 =?utf-8?B?SG1FU2FuNStQMTdhQmlKNXA5NmZ4VGx2MWN1RkpEUzFQNGcyS2JWQUxLNlh6?=
 =?utf-8?B?QjJJSEJiRHIwMTVBUFpjTWtSQ2lKc3Nwd0x0Qk1LNnMvdmdoUmZkS0tzSTN1?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c20bb28-9ebf-456b-facc-08de0673d9fa
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 14:06:18.4029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCSgmHfPlrUWgi/AxFKEoiopV/4HE7MG7ESw9h9MRTotOKH3N6Hxs+FkySiUxXp2FpEH0BFCuXSy/0Oze+Nm0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
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

Quoting Matt Roper (2025-10-07 17:48:52-03:00)
>Preventing the driver from initializing GTs of specific type(s) can be
>useful for debugging and early hardware bringup.  Add a configfs
>attribute to allow this kind of control for debugging.
>
>With today's platforms and software design, this configuration setting
>is only effective for disabling the media GT since the driver currently
>requires that there always be a primary GT to probe the device.  However
>this might change in the future ---  in theory it should be possible
>(with some additional driver work) to allow an igpu device to come up
>with only the media GT and no primary GT.  Or to allow an igpu device to
>come up with no GTs at all (for display-only usage).  A primary GT will
>likely always be required on dgpu platforms because we rely on the BCS
>engines inside the primary GT for various vram operations.
>
>v2:
> - Expand/clarify kerneldoc for configfs attribute.  (Gustavo)
> - Tighten type usage in gt_types[] structure.  (Gustavo)
> - Adjust string parsing/name matching to match exact GT names and not
>   accept partial names.  (Gustavo)
>
>v3:
> - Switch to scope-based cleanup in gt_types_allowed_store() to fix a
>   leak if the device is already bound.  (Gustavo)
> - Switch configfs lookup interface to two boolean functions that
>   specify whether primary/media are supported rather than one function
>   that returns a mask.  This is simpler to use and understand.
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c | 145 +++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_configfs.h |   4 +
> drivers/gpu/drm/xe/xe_pci.c      |  22 +++++
> 3 files changed, 171 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_conf=
igfs.c
>index 139663423185..e36cc5e1bc8f 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -15,6 +15,7 @@
>=20
> #include "instructions/xe_mi_commands.h"
> #include "xe_configfs.h"
>+#include "xe_gt_types.h"
> #include "xe_hw_engine_types.h"
> #include "xe_module.h"
> #include "xe_pci_types.h"
>@@ -56,6 +57,7 @@
>  *        :
>  *        =E2=94=94=E2=94=80=E2=94=80 0000:03:00.0
>  *            =E2=94=9C=E2=94=80=E2=94=80 survivability_mode
>+ *            =E2=94=9C=E2=94=80=E2=94=80 gt_types_allowed
>  *            =E2=94=9C=E2=94=80=E2=94=80 engines_allowed
>  *            =E2=94=94=E2=94=80=E2=94=80 enable_psmi
>  *
>@@ -79,6 +81,44 @@
>  *
>  * This attribute can only be set before binding to the device.
>  *
>+ * Allowed GT types:
>+ * -----------------
>+ *
>+ * Allow only specific types of GTs to be detected and initialized by the
>+ * driver.  Any combination of GT types can be enabled/disabled, although
>+ * some settings will cause the device to fail to probe.
>+ *
>+ * Writes support both comma- and newline-separated input format. Reads
>+ * will always return one GT type per line. "primary" and "media" are the
>+ * GT type names supported by this interface.
>+ *
>+ * This attribute can only be set before binding to the device.
>+ *
>+ * Examples:
>+ *
>+ * Allow both primary and media GTs to be initialized and used.  This mat=
ches
>+ * the driver's default behavior::
>+ *
>+ *        # echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_=
types_allowed
>+ *
>+ * Allow only the primary GT of each tile to be initialized and used,
>+ * effectively disabling the media GT if it exists on the platform::
>+ *
>+ *        # echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_=
allowed
>+ *
>+ * Allow only the media GT of each tile to be initialized and used,
>+ * effectively disabling the primary GT.  **This configuration will cause
>+ * device probe failure on all current platforms, but may be allowed on
>+ * igpu platforms in the future**::
>+ *
>+ *        # echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_al=
lowed
>+ *
>+ * Disable all GTs.  Only other GPU IP (such as display) is potentially u=
sable.
>+ * **This configuration will cause device probe failure on all current
>+ * platforms, but may be allowed on igpu platforms in the future**::
>+ *
>+ *        # echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>+ *
>  * Allowed engines:
>  * ----------------
>  *
>@@ -187,6 +227,7 @@ struct xe_config_group_device {
>         struct config_group group;
>=20
>         struct xe_config_device {
>+                u64 gt_types_allowed;
>                 u64 engines_allowed;
>                 struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>                 struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>@@ -201,6 +242,7 @@ struct xe_config_group_device {
> };
>=20
> static const struct xe_config_device device_defaults =3D {
>+        .gt_types_allowed =3D U64_MAX,
>         .engines_allowed =3D U64_MAX,
>         .survivability_mode =3D false,
>         .enable_psmi =3D false,
>@@ -220,6 +262,7 @@ struct engine_info {
> /* Some helpful macros to aid on the sizing of buffer allocation when par=
sing */
> #define MAX_ENGINE_CLASS_CHARS 5
> #define MAX_ENGINE_INSTANCE_CHARS 2
>+#define MAX_GT_TYPE_CHARS 7
>=20
> static const struct engine_info engine_info[] =3D {
>         { .cls =3D "rcs", .mask =3D XE_HW_ENGINE_RCS_MASK, .engine_class =
=3D XE_ENGINE_CLASS_RENDER },
>@@ -230,6 +273,14 @@ static const struct engine_info engine_info[] =3D {
>         { .cls =3D "gsccs", .mask =3D XE_HW_ENGINE_GSCCS_MASK, .engine_cl=
ass =3D XE_ENGINE_CLASS_OTHER },
> };
>=20
>+static const struct {
>+        const char name[MAX_GT_TYPE_CHARS + 1];
>+        enum xe_gt_type type;
>+} gt_types[] =3D {
>+        { .name =3D "primary", .type =3D XE_GT_TYPE_MAIN },
>+        { .name =3D "media", .type =3D XE_GT_TYPE_MEDIA },
>+};
>+
> static struct xe_config_group_device *to_xe_config_group_device(struct co=
nfig_item *item)
> {
>         return container_of(to_config_group(item), struct xe_config_group=
_device, group);
>@@ -292,6 +343,58 @@ static ssize_t survivability_mode_store(struct config=
_item *item, const char *pa
>         return len;
> }
>=20
>+static ssize_t gt_types_allowed_show(struct config_item *item, char *page=
)
>+{
>+        struct xe_config_device *dev =3D to_xe_config_device(item);
>+        char *p =3D page;
>+
>+        for (size_t i =3D 0; i < ARRAY_SIZE(gt_types); i++)
>+                if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
>+                        p +=3D sprintf(p, "%s\n", gt_types[i].name);
>+
>+        return p - page;
>+}
>+
>+static ssize_t gt_types_allowed_store(struct config_item *item, const cha=
r *page,
>+                                      size_t len)
>+{
>+        struct xe_config_group_device *dev =3D to_xe_config_group_device(=
item);
>+        char *buf __free(kfree) =3D kstrdup(page, GFP_KERNEL);
>+        char *p =3D buf;
>+        u64 typemask =3D 0;
>+
>+        if (!buf)
>+                return -ENOMEM;
>+
>+        while (p) {
>+                char *typename =3D strsep(&p, ",\n");
>+                bool matched =3D false;
>+
>+                if (typename[0] =3D=3D '\0')
>+                        continue;
>+
>+                for (size_t i =3D 0; i < ARRAY_SIZE(gt_types); i++) {
>+                        if (strcmp(typename, gt_types[i].name) =3D=3D 0) =
{
>+                                typemask |=3D BIT(gt_types[i].type);
>+                                matched =3D true;
>+                                break;
>+                        }
>+                }
>+
>+                if (!matched)
>+                        return -EINVAL;
>+        }
>+
>+        scoped_guard(mutex, &dev->lock) {
>+                if (is_bound(dev))
>+                        return -EBUSY;
>+
>+                dev->config.gt_types_allowed =3D typemask;
>+        }
>+
>+        return len;
>+}
>+
> static ssize_t engines_allowed_show(struct config_item *item, char *page)
> {
>         struct xe_config_device *dev =3D to_xe_config_device(item);
>@@ -672,6 +775,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
> CONFIGFS_ATTR(, ctx_restore_post_bb);
> CONFIGFS_ATTR(, enable_psmi);
> CONFIGFS_ATTR(, engines_allowed);
>+CONFIGFS_ATTR(, gt_types_allowed);
> CONFIGFS_ATTR(, survivability_mode);
>=20
> static struct configfs_attribute *xe_config_device_attrs[] =3D {
>@@ -679,6 +783,7 @@ static struct configfs_attribute *xe_config_device_att=
rs[] =3D {
>         &attr_ctx_restore_post_bb,
>         &attr_enable_psmi,
>         &attr_engines_allowed,
>+        &attr_gt_types_allowed,
>         &attr_survivability_mode,
>         NULL,
> };
>@@ -846,6 +951,7 @@ static void dump_custom_dev_config(struct pci_dev *pde=
v,
>                                  dev->config.attr_); \
>         } while (0)
>=20
>+        PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>         PRI_CUSTOM_ATTR("%llx", engines_allowed);
>         PRI_CUSTOM_ATTR("%d", enable_psmi);
>         PRI_CUSTOM_ATTR("%d", survivability_mode);
>@@ -896,6 +1002,45 @@ bool xe_configfs_get_survivability_mode(struct pci_d=
ev *pdev)
>         return mode;
> }
>=20
>+static u64 get_gt_types_allowed(struct xe_device *xe)
>+{
>+        struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>+        struct xe_config_group_device *dev =3D find_xe_config_group_devic=
e(pdev);
>+        u64 mask;
>+
>+        if (!dev)
>+                return device_defaults.gt_types_allowed;
>+
>+        mask =3D dev->config.gt_types_allowed;
>+        config_group_put(&dev->group);
>+
>+        return mask;
>+}
>+
>+/**
>+ * xe_configfs_primary_gt_supported - determine whether primary GTs are s=
upported
>+ * @xe: xe device
>+ *
>+ * Return: True if primary GTs are enabled, false if they have been disab=
led via
>+ *     configfs.
>+ */
>+bool xe_configfs_primary_gt_supported(struct xe_device *xe)

Nitpick: I think it would be more precise if we used _allowed instead of
_supported here...

I see there are some feedback from Lucas and Michal that could be
incorporated.  That said, the patch at its current state already looks
good to me, so:

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

Feel free to keep the r-b when applying any of their suggestions.

--
Gustavo Sousa

>+{
>+        return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MAIN)) !=3D=
 0;
>+}
>+
>+/**
>+ * xe_configfs_media_gt_supported - determine whether media GTs are suppo=
rted
>+ * @xe: xe device
>+ *
>+ * Return: True if the media GTs are enabled, false if they have been dis=
abled
>+ *     via configfs.
>+ */
>+bool xe_configfs_media_gt_supported(struct xe_device *xe)
>+{
>+        return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MEDIA)) !=
=3D 0;
>+}
>+
> /**
>  * xe_configfs_get_engines_allowed - get engine allowed mask from configf=
s
>  * @pdev: pci device
>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_conf=
igfs.h
>index c61e0e47ed94..5624e965b911 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.h
>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>@@ -17,6 +17,8 @@ int xe_configfs_init(void);
> void xe_configfs_exit(void);
> void xe_configfs_check_device(struct pci_dev *pdev);
> bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>+bool xe_configfs_primary_gt_supported(struct xe_device *xe);
>+bool xe_configfs_media_gt_supported(struct xe_device *xe);
> u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engi=
ne_class,
>@@ -28,6 +30,8 @@ static inline int xe_configfs_init(void) { return 0; }
> static inline void xe_configfs_exit(void) { }
> static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
> static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pde=
v) { return false; }
>+static inline bool xe_configfs_primary_gt_supported(struct xe_device *xe)=
 { return true; }
>+static inline bool xe_configfs_media_gt_supported(struct xe_device *xe) {=
 return true; }
> static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) {=
 return U64_MAX; }
> static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { r=
eturn false; }
> static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev=
, enum xe_engine_class,
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index a5932e4f4a23..9c8ab2b41737 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -695,6 +695,11 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile =
*tile,
>         struct xe_device *xe =3D tile_to_xe(tile);
>         struct xe_gt *gt;
>=20
>+        if (!xe_configfs_primary_gt_supported(xe)) {
>+                drm_info(&xe->drm, "Primary GT disabled via configfs\n");
>+                return NULL;
>+        }
>+
>         gt =3D xe_gt_alloc(tile);
>         if (IS_ERR(gt))
>                 return gt;
>@@ -720,6 +725,11 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *t=
ile,
>         struct xe_device *xe =3D tile_to_xe(tile);
>         struct xe_gt *gt;
>=20
>+        if (!xe_configfs_media_gt_supported(xe)) {
>+                drm_info(&xe->drm, "Media GT disabled via configfs\n");
>+                return NULL;
>+        }
>+
>         if (MEDIA_VER(xe) < 13 || !media_desc)
>                 return NULL;
>=20
>@@ -829,6 +839,18 @@ static int xe_info_init(struct xe_device *xe,
>                 if (IS_ERR(tile->primary_gt))
>                         return PTR_ERR(tile->primary_gt);
>=20
>+                /*
>+                 * It's not currently possible to probe a device with the
>+                 * primary GT disabled.  With some work, this may be futu=
re in
>+                 * the possible for igpu platforms (although probably not=
 for
>+                 * dgpu's since access to the primary GT's BCS engines is
>+                 * required for VRAM management).
>+                 */
>+                if (!tile->primary_gt) {
>+                        drm_err(&xe->drm, "Cannot probe device with witho=
ut a primary GT\n");
>+                        return -ENODEV;
>+                }
>+
>                 tile->media_gt =3D alloc_media_gt(tile, media_desc);
>                 if (IS_ERR(tile->media_gt))
>                         return PTR_ERR(tile->media_gt);
>--=20
>2.51.0
>
