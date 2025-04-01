Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACF5C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 19:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF57610E0F0;
	Tue,  1 Apr 2025 19:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhFwlesI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9A610E0F0
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 19:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743534239; x=1775070239;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=i/Ar18zzbcvGdFePOlhIy6ueSxOrVG4fNP8zhveTwfU=;
 b=GhFwlesILQ0nISP+wtgZzQmt0sOCrsl7c3WJVvOxdFzU/pEl4TH//5BP
 1BFv0koK5Tpb8vpI/wx3d/Zklovw3Nay0FXcE5RvvlF6gOCbaUeZZ9QVw
 CZYAOhySn2DC4rqJykT+qN4ok7eIqLQX5R8wqPgIxl69sd43ZfoYKfKAw
 0oRNQRo+wLHkW469rBC+khuTY4jZ1DV7D3/sx5FM6KKT2lZtRGXXUZ855
 zZTJGY48eA3eP2mZxDtv+L1+4+RjE6MR5mwYfnJMhFin6TP+DtADPbcmN
 rWEJwA8drBVxwtWlz2HqfhIJ3R8osfn0EY1OusmrqwHt5oC9fB7HraD3u A==;
X-CSE-ConnectionGUID: wCkeLTUgSoy7A1e/33Rg3w==
X-CSE-MsgGUID: 9rivHB6WQZ+rDRODknO8Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44024312"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="44024312"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:03:51 -0700
X-CSE-ConnectionGUID: OHJsXz1zQGaHvQ0qYjN5kQ==
X-CSE-MsgGUID: wFuctCIrTUqK31yR9QHUcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="126434504"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:03:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 1 Apr 2025 12:03:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 12:03:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 12:02:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuvJ8aYlDtEoHWCM0TWgGP15vo01/OauueYCuIeFZZLadt3EAdQsXikCR/XQ+jWbh/wJksKNYNjpDO9NSbnN3c73zlBn6/6qUas7CUif63cOMTMKKsLn4gYUD0Wv0GWa4/qaBSIcaDyHblyQnOqnMPus8gVd2jCAOYhiviekO2UwCPgRvj2SgPlPYgXYNpQf1aLVZ1QaflzZ6XfI3YrF2TqxGrcuMnbI0kbQMhB1lqeMuJqY66VAZcwySwlEL+24bw+yT2767oL+aoOMIQPir00ZbTqJqT4Iw15+oypzMteZ293XzB0x5AfOcoeeHriEOyidfQ1aK24oatmkBs6Omw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yw4HGcJHZzez7vUuz5G2sCx1yhQa2q9LTPwB91KhnOk=;
 b=hAd0eCsKinabnJ4IyxsjiGDrkveP9MnUpidmkaC95+n1r0VfBnPKYszTLqYZScVEmBRCd7o0rrA9LnkCZvZJNMSRp3Jq8GFheZv1lR4Z0GMuSbZoSXi48u75oByOxZDZfCSpqPzmjuS68pyVi6QdNf6iCzVvBxUzObob7Y9mfWNLVEA4PG1qyZtdon2XC9Jh8wBic1ixXlGVQAKZW8ch72PaXoZdqZJsOBqqMzMUzv631Sz0cfzqjY6TFLu6We2PKbQzWnIXkTIO5JOlZ6pIKXT94XciuYsWsqankHrGT79CRYe33IoGfo+X76nFFRfGnEb0kCLAsuhop0LWZPMJqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH3PPF0515C3CD3.namprd11.prod.outlook.com (2603:10b6:518:1::d05)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Tue, 1 Apr
 2025 19:02:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 19:02:30 +0000
Date: Tue, 1 Apr 2025 14:02:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/8] drm/xe: Simplify GuC early initialization
Message-ID: <2m7t6qoezawnkkoja4im5ode5y26hz44ielqhsdhelarxkc4ei@5igvcwtsxf4o>
References: <20250310200653.89731-1-dev@lankhorst.se>
 <20250310200653.89731-4-dev@lankhorst.se>
 <xr2yafotmc4zdby7ubomxi4d4bnw2relnfcr3pip76pzmxyrvp@hnjcejaadlqn>
 <9d59a069-2819-4828-b3a3-47a85cc0fc44@lankhorst.se>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d59a069-2819-4828-b3a3-47a85cc0fc44@lankhorst.se>
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH3PPF0515C3CD3:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d62335-0e51-40e7-e06b-08dd714fc09f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HGl6cfbuVRPqZv7jJzBegqfpU6r5Y7viJ6genbvpLJi9Ixlbq/Av/MGMCL?=
 =?iso-8859-1?Q?uKEjJVnyaYiPcE2KYhODOwTxlZzBwT0uw7KV8j0tyambSCTL2soFmw73qc?=
 =?iso-8859-1?Q?yMxjSIH+UD3EijXbBhLjCHpAhOIPmRUMngGdsx+0iYeCeADZq9itdmkSz2?=
 =?iso-8859-1?Q?FOSeqjFrvcc5gIKueUKYE7HFBM6UETrrDpWRGzKr8SrP7yLsHFzc8FtHq9?=
 =?iso-8859-1?Q?Ej2vTUun7XyheLbawwa3VmXqZ4iLPFbyKWy4FhcwQYK+2HvBqREGGqDk55?=
 =?iso-8859-1?Q?/KJdkkD1eXoCeYVSUZjXW3H6aHUVhAPC6/fUZr4/4L2DBx+zxJoIbGgidT?=
 =?iso-8859-1?Q?Y1YuSJiyB8DZqcJionJWE2j/h5VTj+0qT4DYV4LT8g397HQhd1q95ZF6Rp?=
 =?iso-8859-1?Q?AwU4pb1u2X69zqk3/RvAy203rcB9fmQhsFoJtKpByWXnTE14MjbhHDi/yA?=
 =?iso-8859-1?Q?vbj16c5m4bdN1KP3mhUE8MORyZxBrXIYsgyylIJ/lIXMEdsv/mtNZl0tcl?=
 =?iso-8859-1?Q?2TKUNTvRAwQBcz6YopPnNo67Wkf2EKb4ihlhAkY2GiLekABq7Ef4eqFoe6?=
 =?iso-8859-1?Q?YVFKEGpZu3/4uU98hPutgOe49b9IyB8EQMPrOKedrCD26wML6ak7IJKLq0?=
 =?iso-8859-1?Q?cM9mxSdECUKe3sccGilbISYM9iURTcsNWcy98YP2Csz05LwMBuxegedPta?=
 =?iso-8859-1?Q?+I40Ot0f2puoVgO1htKqffwgm75hKbp55wFJucS5PDHx3qZ1nuBP1y0tia?=
 =?iso-8859-1?Q?ZtSuaDDVmWfexk4KENTdHg3ZVerPgrzCr5Yv9fRYHAuxy2v88FcdJdWyTy?=
 =?iso-8859-1?Q?MePooDuy/IXIo1BUlrGUdUZApLa60NuwBRmzNiMvZLjGQDbu5eIglszDU9?=
 =?iso-8859-1?Q?ijP/69Ma8A9oavihrYr5WSXGH94qwCHOnH9ZSR/J1LvRH/Wyi/NJpoPyoL?=
 =?iso-8859-1?Q?VlYMDW0Y4CqxxoN1d9oRbImch7v1mfY4CW+GglTJVuxK+GMGtfcex7SCCb?=
 =?iso-8859-1?Q?KMB8GCW38Ao54IoxiIgb78L62+A6aYhvITNohpX+v0QwUVGv7vAFAkE5do?=
 =?iso-8859-1?Q?5M4LmCKtF6t6SLJEkB2BKcLgP20K2FMGVnKxdmo9C0hMKZxhEUD0H5mp+U?=
 =?iso-8859-1?Q?h/k0ZBO2qXNH9IkqK6ctgLn1xWFnWT364mkhZAWzRKwh76F+dhh8UXfwsV?=
 =?iso-8859-1?Q?LEN9f+C8fZ79tmVu2r+E8fob6i6ExCqJWfO0Qgp4hOwQfFyTblfY/RLmVw?=
 =?iso-8859-1?Q?v3ZirWq93a7hgCItPJDkJbIAMQY9NL/TyCplosTa0PHr9JEwB/fc6lctWd?=
 =?iso-8859-1?Q?Z+qSrFEPue0aMMGqr7WmgsfBZMzNC7el14JXAOhy5bEwPfUh8VRUjE6Bqv?=
 =?iso-8859-1?Q?NnE+Ngwtqq6AFIteFcAaM7gAChguJqwtoD0ae355waqXWIRfYxaV0FQOm8?=
 =?iso-8859-1?Q?+acmHN3wCOypCT0b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Nxt168KVMGcQf5+4QGt47qFxiyGA2Mgktz5keGguY34oLyT3CNnEMNirf/?=
 =?iso-8859-1?Q?XQienHpEbzDI8aSeDvZP6QHupp2DRvebwOUxKhCz1fOjA2Z4pTyRetmBSD?=
 =?iso-8859-1?Q?TYfJZGJAHk7PvFUrapIxU/t811XuPdUGW7rRKS/OgcDS30N1wrih/0Eo3U?=
 =?iso-8859-1?Q?Ym7TRbebrEMoUY7ODfxZkVjldpAPk+KgvNQEvwddgn1nsAENLhAyoNcx+D?=
 =?iso-8859-1?Q?EaJ+aN1dTPeCxMKAflztwEowm6NHbeolbpQgq+ZfpzvQTmODTxhaVmhDHp?=
 =?iso-8859-1?Q?EwK/V33XPrbmxwKgYd2Paf4KcIGiE/U5iHscTCo0ctndFbtgNplk2oZpGa?=
 =?iso-8859-1?Q?gqp32blYfbtjhgFbBCs2OfkDuu4zJYTdTM/d4g4EckEhUFlU+DxSjbDMc5?=
 =?iso-8859-1?Q?oplu9cvv3DUhEskSnsQ+NvQx+UYeAey85uszPuXb14I4Z0s2iGitzbn+mx?=
 =?iso-8859-1?Q?o0qhCiNTlTtvneOGBI0C/dN4I45GO9I/4dBZEtTGwIculhoxyPNIa2Bnn6?=
 =?iso-8859-1?Q?FE8He/X/MILUK5ARadFXFQPTuqovX3CbJPlpM1okd4FJsn+e4eXgvNQd/S?=
 =?iso-8859-1?Q?VWnCy+l8w661LGcSnfLY4P1I54TLVHdiy69XDwONn+NIfNCQBj4iCj6A4D?=
 =?iso-8859-1?Q?xzqeJ+gLrc5x4998S7wXnHri1El04PaHrdnqhvoEFurykRwPmtQ99SXDql?=
 =?iso-8859-1?Q?iEUjqHUYdvCP579Mjr0xbYqB6xm8QxbE7t6y4OqDAUvUTgYswtdK9Ksk53?=
 =?iso-8859-1?Q?u2xH23svedQqroB2Fu+Bzxu2ofN0VBFfp3oFDfrtzmphkElsanWc5pynK+?=
 =?iso-8859-1?Q?nvjaTd7ry7qlUfhFP4zq1oaChFFyeEGs8K5wvG1O46FmoYU4givWgdk1CA?=
 =?iso-8859-1?Q?2MyXSDP/ava1CWV0EouIEyVGZsOw17m0UqCW5yJilnf3FynIaGVRDdfcur?=
 =?iso-8859-1?Q?QN7HLB2m80Y8K6lZ21qXrohthoISQG+jGPG2KGe/5AXkpIiDonOcdhGFzY?=
 =?iso-8859-1?Q?Uc+YbVnljYcB9yGPpN5YZvS5s9J5QnBkjLE12ZY8akgZh70OdL5BFmcw80?=
 =?iso-8859-1?Q?UeO8XTOopik4Zpalbc9cPlPH/qDFnd/hINF8xzg+H3q4F0NVlS/SsxOLkO?=
 =?iso-8859-1?Q?7rhYUv2kzoKuUPa3cXOV3p2N+a35XInzJL3h2dBCMP52Y8Ha1uYBYUicdn?=
 =?iso-8859-1?Q?+WNOG/G90k6UpRgY8adaYWIe/gINxDCEbZomrCrJ2J3fYa2HfURcr4Un8b?=
 =?iso-8859-1?Q?KIJ8jvQU37xhkYr5urgpdl/kMtoTIPqnaeLScW+f4JTuTZMVU9bmWsmJGh?=
 =?iso-8859-1?Q?mtQPJvIQK1dnWXtdqk8JNj4n31NEpLgAbTLzgQBdXxv5M1k6d8NSvLSFEs?=
 =?iso-8859-1?Q?xUHPrFqPbFtbsrLwAhXEVWezKQ6cACGHn6S5WxydH7sRDf1umonapXJdEv?=
 =?iso-8859-1?Q?6d3KC0LIV13+iZra5VHuqaJXtFGa+WMEabHOrnukIXorvf98K38i9iSTwi?=
 =?iso-8859-1?Q?KCm16RkKPkMHZ4yNGovlBQEY5ZxXWa5MQWZQEOPOQfHo2CukAP8D5D0QSu?=
 =?iso-8859-1?Q?0O4kZGetiLctlBDcGjf0vssHN4xrsb0qF1TZhUrVHs3K/TrFO6f0Qt7yQ5?=
 =?iso-8859-1?Q?7Sjaf1qvhk2+3U7qjsy+I/n/xDXDn+N4tN66lF17v4GGnzh5urByJ9zg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d62335-0e51-40e7-e06b-08dd714fc09f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 19:02:30.7419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3etCkVm3475isSajO9EAldCtWpp/8zXNGjx9TdVjDZwrN/F9lickA8guNKOIlG54oAwCurmaFHJkeqSn/V/O/JWZII0TlkarTbllmSyD3M8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF0515C3CD3
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

On Wed, Mar 12, 2025 at 11:43:27AM +0100, Maarten Lankhorst wrote:
>Hey,
>
>On 2025-03-11 21:48, Lucas De Marchi wrote:
>> On Mon, Mar 10, 2025 at 09:06:48PM +0100, Maarten Lankhorst wrote:
>>> Add a 2-stage GuC init. An early one for everything that is needed
>>
>> it's already a 2-stage load with
>>
>> 1) min load for hwconfig;
>> 2) normal load
>>
>> can you detail how are the split now?
>>
>>> for VF, and a full one that loads GuC and is allowed to do allocations.
>>>
>>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>>> [mlankhorst: Fix british spelling]
>>
>> what is this trailer supposed to mean?
>>
>>> ---
>>> drivers/gpu/drm/xe/tests/xe_guc_relay_test.c |  2 +-
>>> drivers/gpu/drm/xe/xe_device.c               | 16 ------
>>> drivers/gpu/drm/xe/xe_gt.c                   |  9 +++-
>>> drivers/gpu/drm/xe/xe_guc.c                  | 51 ++++++++++++--------
>>> drivers/gpu/drm/xe/xe_guc.h                  |  1 +
>>> drivers/gpu/drm/xe/xe_guc_ct.c               | 28 +++++++----
>>> drivers/gpu/drm/xe/xe_guc_ct.h               |  1 +
>>> drivers/gpu/drm/xe/xe_guc_relay.c            |  6 +--
>>> drivers/gpu/drm/xe/xe_guc_relay.h            |  2 +-
>>> drivers/gpu/drm/xe/xe_uc.c                   | 16 ++++++
>>> drivers/gpu/drm/xe/xe_uc.h                   |  1 +
>>> 11 files changed, 82 insertions(+), 51 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
>>> index 13701451b9235..b951d55ef1b32 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
>>> @@ -42,7 +42,7 @@ static int relay_test_init(struct kunit *test)
>>>     kunit_activate_static_stub(test, relay_get_totalvfs,
>>>                    replacement_relay_get_totalvfs);
>>>
>>> -    KUNIT_ASSERT_EQ(test, xe_guc_relay_init(relay), 0);
>>> +    KUNIT_ASSERT_EQ(test, xe_guc_relay_init_noalloc(relay), 0);
>>>     KUNIT_EXPECT_TRUE(test, relay_is_ready(relay));
>>>     relay->last_rid = TEST_RID - 1;
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 38b8e3e961a2f..343f7ac67eaee 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -772,25 +772,9 @@ int xe_device_probe(struct xe_device *xe)
>>>         err = xe_gt_init_early(gt);
>>>         if (err)
>>>             return err;
>>> -
>>> -        /*
>>> -         * Only after this point can GT-specific MMIO operations
>>> -         * (including things like communication with the GuC)
>>> -         * be performed.
>>> -         */
>>> -        xe_gt_mmio_init(gt);
>>>     }
>>>
>>>     for_each_tile(tile, xe, id) {
>>> -        if (IS_SRIOV_VF(xe)) {
>>> -            xe_guc_comm_init_early(&tile->primary_gt->uc.guc);
>>> -            err = xe_gt_sriov_vf_bootstrap(tile->primary_gt);
>>> -            if (err)
>>> -                return err;
>>> -            err = xe_gt_sriov_vf_query_config(tile->primary_gt);
>>> -            if (err)
>>> -                return err;
>>> -        }
>>>         err = xe_ggtt_init_early(tile->mem.ggtt);
>>>         if (err)
>>>             return err;
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index 10a9e3c72b360..a0b9052c41b0f 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -375,7 +375,14 @@ int xe_gt_init_early(struct xe_gt *gt)
>>>     if (err)
>>>         return err;
>>>
>>> -    return 0;
>>> +    /*
>>> +     * Only after this point can GT-specific MMIO operations
>>> +     * (including things like communication with the GuC)
>>> +     * be performed.
>>> +     */
>>> +    xe_gt_mmio_init(gt);
>>> +
>>> +    return xe_uc_init_noalloc(&gt->uc);
>>> }
>>>
>>> static void dump_pat_on_error(struct xe_gt *gt)
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index ecf597f9d80c6..bd8c3e5a5c9fa 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -626,21 +626,11 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>>>     return 0;
>>> }
>>>
>>> -static int vf_guc_init(struct xe_guc *guc)
>>> +static int vf_guc_init_noalloc(struct xe_guc *guc)
>>> {
>>>     struct xe_gt *gt = guc_to_gt(guc);
>>>     int err;
>>>
>>> -    xe_guc_comm_init_early(guc);
>>> -
>>> -    err = xe_guc_ct_init(&guc->ct);
>>> -    if (err)
>>> -        return err;
>>> -
>>> -    err = xe_guc_relay_init(&guc->relay);
>>> -    if (err)
>>> -        return err;
>>> -
>>>     err = xe_gt_sriov_vf_bootstrap(gt);
>>>     if (err)
>>>         return err;
>>> @@ -652,6 +642,35 @@ static int vf_guc_init(struct xe_guc *guc)
>>>     return 0;
>>> }
>>>
>>> +int xe_guc_init_noalloc(struct xe_guc *guc)
>>> +{
>>> +    struct xe_device *xe = guc_to_xe(guc);
>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>> +    int ret;
>>> +
>>> +    xe_guc_comm_init_early(guc);
>>> +
>>> +    ret = xe_guc_ct_init_noalloc(&guc->ct);
>>> +    if (ret)
>>> +        goto out;
>>> +
>>> +    ret = xe_guc_relay_init_noalloc(&guc->relay);
>>> +    if (ret)
>>> +        goto out;
>>> +
>>> +    if (IS_SRIOV_VF(xe)) {
>>> +        ret = vf_guc_init_noalloc(guc);
>>> +        if (ret)
>>> +            goto out;
>>> +    }
>>> +
>>> +    return 0;
>>> +
>>> +out:
>>> +    xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
>>> +    return ret;
>>> +}
>>> +
>>> int xe_guc_init(struct xe_guc *guc)
>>> {
>>>     struct xe_device *xe = guc_to_xe(guc);
>>> @@ -661,13 +680,13 @@ int xe_guc_init(struct xe_guc *guc)
>>>     guc->fw.type = XE_UC_FW_TYPE_GUC;
>>>     ret = xe_uc_fw_init(&guc->fw);
>>>     if (ret)
>>> -        goto out;
>>> +        return ret;
>>>
>>>     if (!xe_uc_fw_is_enabled(&guc->fw))
>>>         return 0;
>>>
>>>     if (IS_SRIOV_VF(xe)) {
>>> -        ret = vf_guc_init(guc);
>>> +        ret = xe_guc_ct_init(&guc->ct);
>>>         if (ret)
>>>             goto out;
>>>         return 0;
>>> @@ -689,10 +708,6 @@ int xe_guc_init(struct xe_guc *guc)
>>>     if (ret)
>>>         goto out;
>>>
>>> -    ret = xe_guc_relay_init(&guc->relay);
>>> -    if (ret)
>>> -        goto out;
>>> -
>>>     xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
>>>
>>>     ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
>>> @@ -701,8 +716,6 @@ int xe_guc_init(struct xe_guc *guc)
>>>
>>>     guc_init_params(guc);
>>>
>>> -    xe_guc_comm_init_early(guc);
>>> -
>>>     return 0;
>>>
>>> out:
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>>> index 58338be445585..965bf72912009 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>>> @@ -26,6 +26,7 @@
>>> struct drm_printer;
>>>
>>> void xe_guc_comm_init_early(struct xe_guc *guc);
>>> +int xe_guc_init_noalloc(struct xe_guc *guc);
>>> int xe_guc_init(struct xe_guc *guc);
>>> int xe_guc_init_post_hwconfig(struct xe_guc *guc);
>>> int xe_guc_post_load_init(struct xe_guc *guc);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index 72ad576fc18eb..ffeda89b136ba 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -204,12 +204,10 @@ static void primelockdep(struct xe_guc_ct *ct)
>>>     fs_reclaim_release(GFP_KERNEL);
>>> }
>>>
>>> -int xe_guc_ct_init(struct xe_guc_ct *ct)
>>> +int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>>> {
>>>     struct xe_device *xe = ct_to_xe(ct);
>>>     struct xe_gt *gt = ct_to_gt(ct);
>>> -    struct xe_tile *tile = gt_to_tile(gt);
>>> -    struct xe_bo *bo;
>>>     int err;
>>>
>>>     xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
>>> @@ -235,6 +233,23 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>>>
>>>     primelockdep(ct);
>>>
>>> +    err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
>>> +    ct->state = XE_GUC_CT_STATE_DISABLED;
>>> +    return 0;
>>> +}
>>> +ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
>>> +
>>> +int xe_guc_ct_init(struct xe_guc_ct *ct)
>>> +{
>>> +    struct xe_device *xe = ct_to_xe(ct);
>>> +    struct xe_gt *gt = ct_to_gt(ct);
>>> +    struct xe_tile *tile = gt_to_tile(gt);
>>> +    struct xe_bo *bo;
>>> +
>>>     bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
>>>                       XE_BO_FLAG_SYSTEM |
>>>                       XE_BO_FLAG_GGTT |
>>> @@ -243,13 +258,6 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>>>         return PTR_ERR(bo);
>>>
>>>     ct->bo = bo;
>>> -
>>> -    err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>>> -    if (err)
>>> -        return err;
>>> -
>>> -    xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
>>> -    ct->state = XE_GUC_CT_STATE_DISABLED;
>>>     return 0;
>>> }
>>> ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>>> index 82c4ae458dda3..9f28fc135890d 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>> @@ -11,6 +11,7 @@
>>> struct drm_printer;
>>> struct xe_device;
>>>
>>> +int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>>> int xe_guc_ct_init(struct xe_guc_ct *ct);
>>> int xe_guc_ct_enable(struct xe_guc_ct *ct);
>>> void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
>>> index e5dc94f3e6181..dc60955a0271a 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_relay.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
>>> @@ -322,7 +322,7 @@ static void __fini_relay(struct drm_device *drm, void *arg)
>>> }
>>>
>>> /**
>>> - * xe_guc_relay_init - Initialize a &xe_guc_relay
>>> + * xe_guc_relay_init_noalloc - Initialize a &xe_guc_relay
>>>  * @relay: the &xe_guc_relay to initialize
>>>  *
>>>  * Initialize remaining members of &xe_guc_relay that may depend
>>> @@ -330,7 +330,7 @@ static void __fini_relay(struct drm_device *drm, void *arg)
>>>  *
>>>  * Return: 0 on success or a negative error code on failure.
>>>  */
>>> -int xe_guc_relay_init(struct xe_guc_relay *relay)
>>> +int xe_guc_relay_init_noalloc(struct xe_guc_relay *relay)
>>> {
>>>     const int XE_RELAY_MEMPOOL_MIN_NUM = 1;
>>>     struct xe_device *xe = relay_to_xe(relay);
>>> @@ -356,7 +356,7 @@ int xe_guc_relay_init(struct xe_guc_relay *relay)
>>>
>>>     return drmm_add_action_or_reset(&xe->drm, __fini_relay, relay);
>>> }
>>> -ALLOW_ERROR_INJECTION(xe_guc_relay_init, ERRNO); /* See xe_pci_probe() */
>>> +ALLOW_ERROR_INJECTION(xe_guc_relay_init_noalloc, ERRNO); /* See xe_pci_probe() */
>>>
>>> static u32 to_relay_error(int err)
>>> {
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.h b/drivers/gpu/drm/xe/xe_guc_relay.h
>>> index 385429aa188ab..e0afff4542cfc 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_relay.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_relay.h
>>> @@ -11,7 +11,7 @@
>>>
>>> struct xe_guc_relay;
>>>
>>> -int xe_guc_relay_init(struct xe_guc_relay *relay);
>>> +int xe_guc_relay_init_noalloc(struct xe_guc_relay *relay);
>>>
>>> int xe_guc_relay_send_to_pf(struct xe_guc_relay *relay,
>>>                 const u32 *msg, u32 len, u32 *buf, u32 buf_size);
>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>> index c14bd22820441..6adff7dffea50 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>> @@ -33,6 +33,22 @@ uc_to_xe(struct xe_uc *uc)
>>> }
>>>
>>> /* Should be called once at driver load only */
>>> +int xe_uc_init_noalloc(struct xe_uc *uc)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret = xe_guc_init_noalloc(&uc->guc);
>>> +    if (ret)
>>> +        goto err;
>>> +
>>> +    /* HuC and GSC have no early dependencies and can be completely initialized during full xe_uc_init(). */
>>> +    return 0;
>>> +
>>> +err:
>>> +    xe_gt_err(uc_to_gt(uc), "Failed to early initialize uC (%pe)\n", ERR_PTR(ret));
>>> +    return ret;
>>> +}
>>> +
>>> int xe_uc_init(struct xe_uc *uc)
>>> {
>>>     int ret;
>>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>>> index 3813c1ede450e..4003eb79757a7 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc.h
>>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>>> @@ -8,6 +8,7 @@
>>>
>>> struct xe_uc;
>>>
>>> +int xe_uc_init_noalloc(struct xe_uc *uc);
>>> int xe_uc_init(struct xe_uc *uc);
>>> int xe_uc_init_hwconfig(struct xe_uc *uc);
>>> int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>>
>>
>> I think we need some documentation and maybe init state keeping.
>> It used to be:  init_early() and init(), with the first usually being
>> only about SW, no hw. But even with some hw initialization, the order
>> was clear: now with a mix of init(), init_noalloc(), init_early(),
>> init_hwconfig() it's hard to follow.
>
>Since uc_init is called right before init_hwconfig, those could be merged into etiher
>xe_uc_init or xe_uc_init_hwconfig?
>
>I'm also for renaming xe_uc_init_noalloc to xe_uc_init_early.
>
>I think the steps we have now boil (with this series) down to this:
>- GT early init. Here some communication need to happen for VF, so early initialisation can be performed.
>  Some sw init to support this may happen.
>- Full UC init, now any necessary allocation can be performed, hwconfig hasn't happened yet. Functions uc_init() and uc_init_hwconfig() -- merge?
>- Post HWConfig init
>- xe_uc_init_hw, could potentially be called from post HWConfig init and renamed to uc_(reinit/prepare)_hw() for reset? Probably bikeshed.

I'm fine if we do some renaming on top.

Lucas De Marchi
