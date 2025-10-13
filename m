Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E91CCD18D
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 17:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CA910E12A;
	Mon, 13 Oct 2025 17:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7L4lFta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EEC10E12A
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 17:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760375290; x=1791911290;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4i5VjP33PntwxXRdGD8K7FXeup4ZjbWCsfIY28hLcow=;
 b=K7L4lFtatUExfrH3JLR5epqcLa/+nnt2HQY1H9fHY4SV0Fa6jAk+LuAR
 pndmCag8AMxQPGRApHnNxBiUsFObHBTCqE+Y4YC9T7DhicbSErYygvIS5
 H/0P7a1kEVj3S7/GM0ltcb4ZKEDmzn3NQwCbo3QoKoObXanbEVk+Gj7OP
 pJjlbnIWYz+FI27Pe7prTg10LqtG/tYS0LZBeGCTJiWlzifL56cOJPa0m
 fEoBtqZrybkzG6c9QeVA/SZsdHryoxm4ltZM5gS9iN/UVbT2Ctw6AHCGU
 8S7e8fjyvp9E3iSFyWikaDsk3Q9cZWNKTmCLi9guvjIF8TphRbyv1awg1 g==;
X-CSE-ConnectionGUID: I4G/XrfxTqawAh8o35V6sg==
X-CSE-MsgGUID: TExdE5Z8QGuxDASXs2f1qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62559308"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="62559308"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:08:07 -0700
X-CSE-ConnectionGUID: 3dkW4E3KR6e9enyB92onQg==
X-CSE-MsgGUID: 1vhaF8oDRtGg4+zYGIH9uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="181330303"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:08:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:08:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 10:08:05 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:08:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaHwNnhpgNLcA0FSI5J1Bo0m2+RWLI3gy/XRUN2iIeXXud6a+D33pivRtaXSAgwGwl3oDXOizvAqlagIPoAaqnVsD1UFum+r5dUyEexjPYA0qlfVwDp9E9xivFixUvYr6DzHA6/jUupMAtp8e5VmRYFsYWTHjm12bGKQZWtwqApoLvrZ8bKjSSQBqAuQwh55Ts3m4Os66KkzT4tfdyesWbaT2E8AFn4DpdP7y+rXC8Bs9EMOHMHXvMZdrL30Lm/g0EB0wDT1E3NAjZDaMVzTKvk3s+1rZbzFBUM9h1Tx6pn/c+80o0HbEmclhdzVCy6AIOQvHn3G6JAsp1Nq3LEBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4i5VjP33PntwxXRdGD8K7FXeup4ZjbWCsfIY28hLcow=;
 b=vlVjPYF+p4ZVuRn/AoS122QY+ay0eOyUUdjO9YqKrM2JX7DW9JuFui+2X0koI+egvPFi5nUs9Pm6G4/Lj00bB+QnIG7VBEOtugC5/YuKlqTVzRFuh8hz+YUuDRSs1szNsi3HYqJPgTxS/JdKtlLqOKbAUAJWYtGffeBTVij2ogL9cRGDzee4qrXC9SXFhWLGPwSJggmhtYLVUazhfrzvVXf+7gLmvyF/YF3MvMYmDUB7ecXZg7LclFazncp+zd1zfDtQqad8Zxf8Kz6Z4M/Vg7xd2IZ30XuOJf7LFmwNFUbXJsBIUZy1MtGNvVoXuGzSWbAI2Dijp1m6/9asNZ4hBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Mon, 13 Oct 2025 17:08:03 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 17:08:03 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "simon.richter@hogyros.de" <simon.richter@hogyros.de>, "Auld, Matthew"
 <matthew.auld@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe: Enable 2M pages in xe_migrate_vram
Thread-Topic: [PATCH v5 2/2] drm/xe: Enable 2M pages in xe_migrate_vram
Thread-Index: AQHcO/PqZxiwTgJVQUOfXOHdy3NqXbTAT/UA
Date: Mon, 13 Oct 2025 17:08:03 +0000
Message-ID: <a435a2a974b8627c945471e75c4dc21b835e9d22.camel@intel.com>
References: <20251013034555.4121168-1-matthew.brost@intel.com>
 <20251013034555.4121168-3-matthew.brost@intel.com>
In-Reply-To: <20251013034555.4121168-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW3PR11MB4698:EE_
x-ms-office365-filtering-correlation-id: 2481f741-c9cf-4e3e-02ed-08de0a7b1218
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TGF0d1ZjQ1lISzJ3RHFNbFppMkZ6SlN0MGNXNmFIaVpUaUw1TEJXaFJXdWNK?=
 =?utf-8?B?Tks3R2czWXA2UjhudjdPS0VEc0JxcnQvd21mNHFxQys3dkFWOWVHa2ZDZUg0?=
 =?utf-8?B?bDNSbXdMdTJHR09tSForWFZmUmExWE1pZVJrL1NQakNsdVRLSitLckN2THNp?=
 =?utf-8?B?VStqc09lWEVqY2FVenZhNnByZW51bVM3NzhkVDJqMW0xVVl5REhHY2x1ejVj?=
 =?utf-8?B?M0V5T2NjRFZtMU5pR3kySUJ6WkJEcjhhYTFodGdJdzBFOVN5d3lKR1ZReis0?=
 =?utf-8?B?OG13VE9mZm5YVzF1aFpnd1RrTmNoeFVLOXp4d3UydlNqaWZDZkJsMitJcVh0?=
 =?utf-8?B?Z0dZVE5uTlNnOHM1eDJ2bTIvME5yQ2VOcVdKaGw3ZUtNZllPMjlVZXRZc2tI?=
 =?utf-8?B?VXA4b041YTJDVG5vUlVabmdYU25odE9sYm40STNJcnhJTWpyaEFDOWlqZE9h?=
 =?utf-8?B?NDVTMkFkU3ByR3cxSkoyVFFMRXhFN3F0cnV0ZGhRckVaV1NjckJ2TlkwVWJI?=
 =?utf-8?B?amNOQ2hFNjhDMEF1MmgrZFhUcXJhamV2Wmdjbmc0aUxYQVloenlxczM0WnNm?=
 =?utf-8?B?MnplTkZnS0NWeTJMYW1hMUpHUlhGSnJXcWplNUw2MjRoVzRhVCtZcnFMV0Jv?=
 =?utf-8?B?V0RLa05FT3U2ZWdlZHFJbmFGald2UjJONDRtL29nY0JlUGFiVzcxU2lta1RI?=
 =?utf-8?B?bVgyK0lGamxNVjd5MlJNUmNWc1VtQ3JxaU9nKy92VDBRLzJRVnMwdDhyajB4?=
 =?utf-8?B?bk1yZTdyekVWWTZya255U0ZMa1dBVTMwUmpsWGljNmQyR255eE9uK3JJcko3?=
 =?utf-8?B?dHAwVytIRS81ZzBVcFFVeWc0ZWIyTlFCWjR3YTEyTVM5WjVKKy82eUlGbkJp?=
 =?utf-8?B?MUdaMHhyRStHNFQ5bDk3ZXdGRGROZVhYbHpta2pLeUhZWEJUdXVqTlpWVklN?=
 =?utf-8?B?V0FZM3dSUUFiQmRGMGZaU1Q0Q2lPUzRDNTgwTW9JM1VuZktmS0Q5dEFsaFRH?=
 =?utf-8?B?OVd4YlQ1TGZqSHlLUUtvd2UvZG9wVW94TjV1ZitBRGIwT2VIM29mYlJLR1hv?=
 =?utf-8?B?N29VY3lleFdvdHRoQ0FjNCtmNTlCd3J4VU42b0FSNmlRcGRxaUowOS9uSmJF?=
 =?utf-8?B?VzRHU0ZKUlhkY0cwb0ladzZaSUc1UkF2Y055RDdMTS9iSDd3TkxqdmRWcndH?=
 =?utf-8?B?aG52c2hlZ0t5NUZoS3A1MHZXRGVicVF1Y1BUU0o4bjF6ZVBXek05dnVETGlJ?=
 =?utf-8?B?bVArRkVDSHZsZE9lRUlxaDFjbTlJL095NENMdmRoVXI1Vk5XMlZMbmtYbC85?=
 =?utf-8?B?S3d4ZGJFSFpSRFdCTU5IK1NVNS9lblphQjM3KzY2aWVRUVQ2Y0x1MjcrQ1dV?=
 =?utf-8?B?N3ZFM0k5NU10bk9EVEpPakVtbXBTMzZ0cWhSbGxqSU41TnoyYzZtWnlnT09P?=
 =?utf-8?B?M2g1SWF6UTVRWFZJOGpYVG9RZWtjbFc4N09xdDR5UVBJR2dMbnhQSk9xWWxj?=
 =?utf-8?B?MnFYU3FuSEY5YnlsWnpxd1ozcDhjelg0NUhTU2FkL2w5S2JXdmd1M2w5UkQy?=
 =?utf-8?B?SWM1Z2pFSVhYNzhXU3k5T0NJNE1PU2VhUDhRRGpPeHR3bVFaUDY1WlcxQk90?=
 =?utf-8?B?YUtwZW93Rlc1NzFGbUttZFFVUy9kWXI4SExiMnFMYmNLVkFLNjdpalZaS1Jw?=
 =?utf-8?B?OWo0bC9XN21HKzVsVHpsRGYzMXhHWFdBbTlhWTNvWnpFQU05VFEreGM1NGRZ?=
 =?utf-8?B?VnZsYUgxSUhvaytXM0xVZ09ZZ2JkT1M1Z0hqWFplSkt1VkpKa2RJbHRIblhV?=
 =?utf-8?B?RmtmS1lUSkVsNk1va0MzSHp2MFVFNk5lcjg2SExzSUsyNWtJeXBkVE1acXNY?=
 =?utf-8?B?OFlTbS92NThEckVkN2lOYW45eGxYbXl5NnN5ais5QlJuejVyUDBnZ2d6L0Fq?=
 =?utf-8?B?eEtGK2c3cm1oVjVRL0NiRjYyNjkzRUdhRDg5VXEvc1hlWURaM3l3Z0hGNzZD?=
 =?utf-8?B?RXFGMk1FZkNOMEsxU1BGdzFGZi81blF3LythekthcTN5USsrQ0FMSmhsK2h1?=
 =?utf-8?Q?Uy6RzO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWZ4QmhKUlVmaytKeHVJclBTc3EyYlhkUkJDSG15OGMxMTB1SVhxRWpHMHhC?=
 =?utf-8?B?d3lwVkllQ0N3UjhndDZRWWFlQzdVQktPWEFYRjBBQUpac0NDQ3dJS1psMEtt?=
 =?utf-8?B?QkY4YWc1dEcvYWFpM3ppb1VROXlvOUZrRFRab3I4MFBDdkY5K1FvYUt6UEFT?=
 =?utf-8?B?NWtWWWxpY1UvdzJDZFlkaUNPTkpGcVZtQSszVENFM3NqWFd1YlY4SW4yQUti?=
 =?utf-8?B?TTMvWlFRdEtTWnFXb2ZJd1dEZ0lFTGcwMHZmMzhFZURsNXJNeVBPVVJScmZq?=
 =?utf-8?B?ZWdMajY2enNmbC9GZHVucFhLUDdSQzJGdXFsUE5KVHdFc25nSisvNkhnWDhS?=
 =?utf-8?B?MVdRSHFRS2RsakUwbDJ5T05hZWhZbGhBSEp5VmtDSFU1Mmt3cXlGVFZna1pn?=
 =?utf-8?B?UXNnODBIY3AyMVZXUEY0S1NkTm8zbGRiK2hMbTdiSmZDVThsckNXVXhsZU9T?=
 =?utf-8?B?WUFjWGkzTy9kVTZyOWNDK0VXcGs5Y05oTzNiS01jMXRIYkp3YjM4TUxsa0Jm?=
 =?utf-8?B?RTZ2Q3M2NUtGSE5NVStjbi9jYUFXckNjSzF6Mk0yU1lsdXNJc1NiaThjSHdS?=
 =?utf-8?B?T2J5SHFOYmJaR1g4R0U0WG1MUXQ5elRVNE9PZkYyMkwxcW1oTytCdzZ3bU5N?=
 =?utf-8?B?Y1d1SDdGaVQySDdaNmc2aVllc1FRclRzb1FNMU9qeG5BbkV6UFBkcHpWQ2dS?=
 =?utf-8?B?eUxLamxNSzJJVHJNbzJWd0Q4c2ZrMkl6cW5JSk02REJTNlROM1FuUkZQZ1Y2?=
 =?utf-8?B?NUVwbGVLTFZ4bzRwdXNwZzErVTdqU2hFMS8zam1FMnZWRUZLdmk4WGdKcTB6?=
 =?utf-8?B?MlVRVUVETVNEY2VNaHc0Q1hiTjVlYU9FQlVwSEFuRnRyWWZLU2JGR3RiRnZU?=
 =?utf-8?B?bGpZV05mRVNvN0p4TFFwUDlRVUNzaG50bTdMbVhEbzRTMWxzaHFjQXVobWt3?=
 =?utf-8?B?Y2pmM21NUDhnaEExWDJ6Q0tIQ3Z1N2svbC9TV0VPU1NwSlM2dzVJM2F6aGEx?=
 =?utf-8?B?cnJVL0UxU1dqdXA1UTdJMU1BcTdHd3hoSmZQM09vNk81b051NzlrOTZNZFJQ?=
 =?utf-8?B?SUNqTHAxeFppRUNpZ2Z4WDdRU0RFbktEcEM2dFh1Q1hzT2pNemVpWUh3TTJq?=
 =?utf-8?B?eW5YMXdCTDgwYll6U3RnTmVGUno0S1FHRnhibGZSTVY1cjdqT2dwREJtUUxW?=
 =?utf-8?B?MVRENzNTK3E3VjNmZUJTKzlWSGo4MmpOTGNXN29peDYwNGtpR0NPU1FlbWp5?=
 =?utf-8?B?cVl5bGRhM3labGdGZFFhL3UwdG9DK1dXVXM5cXZwMDEwVjROQytFMjd2OVZk?=
 =?utf-8?B?WXZISm1Fang3MnlBb3lxUVQ5RytBUmJFKzFFMmNyQ2RNbVFuY3ErSlZRdHhx?=
 =?utf-8?B?czg2OXRSVDc0K0taOU9tNWNyMkJDR3Zma0lVRFRGRW1IbWd2NFFBWWVQa3g0?=
 =?utf-8?B?Yi9MVmlwTlBKSnBISFJZWFVnelduczJack1QNnpLSE9yeC9tUFhtMlFaWUE2?=
 =?utf-8?B?ODREZEZ6M292MDU3eXF1ZnlxUFFWR21vdzVCeTJzTk5sVlJtNzRLZzJablMv?=
 =?utf-8?B?Z05ac3FCV2ZGZEl3aG1KSlhteGtTdHFVSUYxSWRRc0VFdWI2dUJWUTR4YzZv?=
 =?utf-8?B?VTd3QWRCK1Z4NjV1MW9hM3VYVUhMZzZuWWpEZnYwaHN3UldSZWpHcVMrOFFa?=
 =?utf-8?B?KzBaY1BFV1F5Nm1yOUZ0QzVLR1RqNTFuNmVITnJjYzA4L2YzOTRpMDZGL0hD?=
 =?utf-8?B?blhaY2szKzc4RllGaldqYXEvQmYxbVVNUmovS3ZRTG1wTFZCUkg4Uk8vbysx?=
 =?utf-8?B?MHdidGZrTUEwN2hCTVBpdFlNVC83YlQ4NEcva3RtOHp0R3JkeE0yQWZkTmN2?=
 =?utf-8?B?WmxHRjFuQnBXc1NiNmNveXFCaTNuOXMwd2NsUmhCM3JRK1lPN3cvd3dRb3g4?=
 =?utf-8?B?NmxMT2VXMFgwU1JGQkNvSWtjNEVKRk5IK1k2a01HckNiT0VkMUhQK2lDUldU?=
 =?utf-8?B?azNSQ0FmL0pScnl6YXdMUEZ6eldtOUlnb0k3ZEtTWW0rSnUxdkhHN1ZiUUcx?=
 =?utf-8?B?SzNMMm5EcmhtWDBZYzVxcCtkbTA4aCtPL1VxN0s1Y3gvQzFQcGVOMis3NHhv?=
 =?utf-8?B?aEhyNExDMVZqZitUUUFsRXhnMlFCVDZ3Q3hnUUtURnBSYW9HUHVnTUR1a2x5?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2041646A7D2934DB66D84F55CA35746@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2481f741-c9cf-4e3e-02ed-08de0a7b1218
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 17:08:03.3428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7RJp07aD3RSSGimvgbh5QRA+r9FAgwyS/FLZ+ezzGtQgd5HSNsikEcD57y7/UZxrg2gE7uXepqz8bU/IeWmdD+CjbTR63GNEj1aBwy+xLyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
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

T24gU3VuLCAyMDI1LTEwLTEyIGF0IDIwOjQ1IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IFVzaW5nIDJNIHBhZ2VzIGluIHhlX21pZ3JhdGVfdnJhbSBoYXMgdHdvIGJlbmVmaXRzOiB3ZSBp
c3N1ZSBmZXdlcgo+IGluc3RydWN0aW9ucyBwZXIgMk0gY29weSAoMSB2cy4gNTEyKSwgYW5kIHRo
ZSBjYWNoZSBoaXQgcmF0ZSBzaG91bGQKPiBiZQo+IGhpZ2hlci4gVGhpcyByZXN1bHRzIGluIGlu
Y3JlYXNlZCBjb3B5IGVuZ2luZSBiYW5kd2lkdGgsIGFzIHNob3duIGJ5Cj4gYmVuY2htYXJrIElH
VHMuCj4gCj4gRW5hYmxlIDJNIHBhZ2VzIGJ5IHJlc2VydmluZyBQREVzIGluIHRoZSBtaWdyYXRl
IFZNIGFuZCB1c2luZyAyTQo+IHBhZ2VzCj4gaW4geGVfbWlncmF0ZV92cmFtIGlmIHRoZSBETUEg
YWRkcmVzcyBvcmRlciBtYXRjaGVzIDJNLgo+IAo+IHYyOgo+IMKgLSBSZXVzZSBidWlsZF9wdF91
cGRhdGVfYmF0Y2hfc3JhbSAoU3R1YXJ0KQo+IMKgLSBGaXggYnVpbGRfcHRfdXBkYXRlX2JhdGNo
X3NyYW0gZm9yIFBBR0VfU0laRSA+IDRLCj4gdjM6Cj4gwqAtIE1vcmUgZml4ZXMgZm9yIFBBR0Vf
U0laRSA+IDRLLCBhbGlnbiBjaHVuaywgZGVjcmVtZW50IGNodW5rIGFzCj4gbmVlZGVkCj4gwqAt
IFVzZSBzdGFjayBpbmNyIHZhciBpbiB4ZV9taWdyYXRlX3ZyYW1fdXNlX3BkZSAoU3R1YXJ0KQo+
IHY0Ogo+IMKgLSBTcGxpdCBQQUdFX1NJWkUgPiA0SyBmaXggb3V0IGluIGRpZmZlcmVudCBwYXRj
aCAoU3R1YXJ0KQo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJv
c3RAaW50ZWwuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYyB8
IDUzICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiAtLQo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDQ1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9t
aWdyYXRlLmMKPiBpbmRleCAyMTZmYzBlYzJiYjcuLjRjYTQ4ZGQxY2ZkOCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX21pZ3JhdGUuYwo+IEBAIC01Nyw2ICs1NywxMyBAQCBzdHJ1Y3QgeGVfbWlncmF0ZSB7
Cj4gwqDCoMKgwqDCoMKgwqDCoHU2NCB1c21fYmF0Y2hfYmFzZV9vZnM7Cj4gwqDCoMKgwqDCoMKg
wqDCoC8qKiBAY2xlYXJlZF9tZW1fb2ZzOiBWTSBvZmZzZXQgb2YgQGNsZWFyZWRfYm8uICovCj4g
wqDCoMKgwqDCoMKgwqDCoHU2NCBjbGVhcmVkX21lbV9vZnM7Cj4gK8KgwqDCoMKgwqDCoMKgLyoq
IEBsYXJnZV9wYWdlX2NvcHlfb2ZzOiBWTSBvZmZzZXQgb2YgMk0gcGFnZXMgdXNlZCBmb3IKPiBs
YXJnZSBjb3BpZXMgKi8KPiArwqDCoMKgwqDCoMKgwqB1NjQgbGFyZ2VfcGFnZV9jb3B5X29mczsK
PiArwqDCoMKgwqDCoMKgwqAvKioKPiArwqDCoMKgwqDCoMKgwqAgKiBAbGFyZ2VfcGFnZV9jb3B5
X3BkZXM6IEJPIG9mZnNldCB0byB3cml0ZW91dCAyTSBwYWdlcwo+IChQREVzKSB1c2VkIGZvcgo+
ICvCoMKgwqDCoMKgwqDCoCAqIGxhcmdlIGNvcGllcwo+ICvCoMKgwqDCoMKgwqDCoCAqLwo+ICvC
oMKgwqDCoMKgwqDCoHU2NCBsYXJnZV9wYWdlX2NvcHlfcGRlczsKPiDCoMKgwqDCoMKgwqDCoMKg
LyoqCj4gwqDCoMKgwqDCoMKgwqDCoCAqIEBmZW5jZTogZG1hLWZlbmNlIHJlcHJlc2VudGluZyB0
aGUgbGFzdCBtaWdyYXRpb24gam9iCj4gYmF0Y2guCj4gwqDCoMKgwqDCoMKgwqDCoCAqIFByb3Rl
Y3RlZCBieSBAam9iX211dGV4Lgo+IEBAIC0yODgsNiArMjk1LDEyIEBAIHN0YXRpYyBpbnQgeGVf
bWlncmF0ZV9wcmVwYXJlX3ZtKHN0cnVjdCB4ZV90aWxlCj4gKnRpbGUsIHN0cnVjdCB4ZV9taWdy
YXRlICptLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIChpICsgMSkgKiA4LCB1NjQsIGVudHJ5KTsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgCj4g
K8KgwqDCoMKgwqDCoMKgLyogUmVzZXJ2ZSAyTSBQREVzICovCj4gK8KgwqDCoMKgwqDCoMKgbGV2
ZWwgPSAxOwo+ICvCoMKgwqDCoMKgwqDCoG0tPmxhcmdlX3BhZ2VfY29weV9vZnMgPSBOVU1fUFRf
U0xPVFMgPDwgeGVfcHRfc2hpZnQobGV2ZWwpOwo+ICvCoMKgwqDCoMKgwqDCoG0tPmxhcmdlX3Bh
Z2VfY29weV9wZGVzID0gbWFwX29mcyArIFhFX1BBR0VfU0laRSAqIGxldmVsICsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgTlVNX1BUX1NMT1RTICogODsKPiArCj4gwqDCoMKgwqDC
oMKgwqDCoC8qIFNldCB1cCBhIDFHaUIgTlVMTCBtYXBwaW5nIGF0IDI1NUdpQiBvZmZzZXQuICov
Cj4gwqDCoMKgwqDCoMKgwqDCoGxldmVsID0gMjsKPiDCoMKgwqDCoMKgwqDCoMKgeGVfbWFwX3dy
KHhlLCAmYm8tPnZtYXAsIG1hcF9vZnMgKyBYRV9QQUdFX1NJWkUgKiBsZXZlbCArIDI1NQo+ICog
OCwgdTY0LAo+IEBAIC0xNzc4LDEwICsxNzkxLDEwIEBAIHN0YXRpYyB1MzIgcHRlX3VwZGF0ZV9j
bWRfc2l6ZSh1NjQgc2l6ZSkKPiDCoHN0YXRpYyB2b2lkIGJ1aWxkX3B0X3VwZGF0ZV9iYXRjaF9z
cmFtKHN0cnVjdCB4ZV9taWdyYXRlICptLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHhl
X2JiICpiYiwgdTMyCj4gcHRfb2Zmc2V0LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRy
bV9wYWdlbWFwX2FkZHIKPiAqc3JhbV9hZGRyLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgc2l6
ZSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTMyIHNpemUsIGludCBsZXZlbCkKPiDCoHsKPiDCoMKg
wqDCoMKgwqDCoMKgdTE2IHBhdF9pbmRleCA9IHRpbGVfdG9feGUobS0+dGlsZSktPnBhdC5pZHhb
WEVfQ0FDSEVfV0JdOwo+IC3CoMKgwqDCoMKgwqDCoHU2NCBncHVfcGFnZV9zaXplID0gMHgxdWxs
IDw8IHhlX3B0X3NoaWZ0KDApOwo+ICvCoMKgwqDCoMKgwqDCoHU2NCBncHVfcGFnZV9zaXplID0g
MHgxdWxsIDw8IHhlX3B0X3NoaWZ0KGxldmVsKTsKPiDCoMKgwqDCoMKgwqDCoMKgdTMyIHB0ZXM7
Cj4gwqDCoMKgwqDCoMKgwqDCoGludCBpID0gMDsKPiDCoAo+IEBAIC0xODA4LDcgKzE4MjEsNyBA
QCBzdGF0aWMgdm9pZCBidWlsZF9wdF91cGRhdGVfYmF0Y2hfc3JhbShzdHJ1Y3QKPiB4ZV9taWdy
YXRlICptLAo+IMKgYWdhaW46Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcHRlID0gbS0+cS0+dm0tPnB0X29wcy0+cHRlX2VuY29kZV9hZGRyKG0tCj4g
PnRpbGUtPnhlLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYWRkciwKPiBwYXRfaW5kZXgsCj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoDAsCj4gZmFsc2UsIDApOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBsZXZlbAo+ICwgZmFsc2UsIDApOwo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJiLT5jc1ti
Yi0+bGVuKytdID0gbG93ZXJfMzJfYml0cyhwdGUpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJiLT5jc1tiYi0+bGVuKytdID0gdXBwZXJfMzJfYml0
cyhwdGUpOwo+IMKgCj4gQEAgLTE4MjYsNiArMTgzOSwxOSBAQCBzdGF0aWMgdm9pZCBidWlsZF9w
dF91cGRhdGVfYmF0Y2hfc3JhbShzdHJ1Y3QKPiB4ZV9taWdyYXRlICptLAo+IMKgwqDCoMKgwqDC
oMKgwqB9Cj4gwqB9Cj4gwqAKPiArc3RhdGljIGJvb2wgeGVfbWlncmF0ZV92cmFtX3VzZV9wZGUo
c3RydWN0IGRybV9wYWdlbWFwX2FkZHIKPiAqc3JhbV9hZGRyLAo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNp
Z25lZCBsb25nIHNpemUpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqB1MzIgbGFyZ2Vfc2l6ZSA9ICgw
eDEgPDwgeGVfcHRfc2hpZnQoMSkpOwo+ICvCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgaSwg
aW5jciA9IGxhcmdlX3NpemUgLyBQQUdFX1NJWkU7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGZvciAo
aSA9IDA7IGkgPCBESVZfUk9VTkRfVVAoc2l6ZSwgUEFHRV9TSVpFKTsgaSArPSBpbmNyKQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoUEFHRV9TSVpFIDw8IHNyYW1fYWRkcltp
XS5vcmRlciAhPSBsYXJnZV9zaXplKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIGZhbHNlOwo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4g
dHJ1ZTsKPiArfQo+ICsKPiDCoGVudW0geGVfbWlncmF0ZV9jb3B5X2RpciB7Cj4gwqDCoMKgwqDC
oMKgwqDCoFhFX01JR1JBVEVfQ09QWV9UT19WUkFNLAo+IMKgwqDCoMKgwqDCoMKgwqBYRV9NSUdS
QVRFX0NPUFlfVE9fU1JBTSwKPiBAQCAtMTg1NSw2ICsxODgxLDcgQEAgc3RhdGljIHN0cnVjdCBk
bWFfZmVuY2UgKnhlX21pZ3JhdGVfdnJhbShzdHJ1Y3QKPiB4ZV9taWdyYXRlICptLAo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUEFHRV9TSVpFIDogNDsKPiDCoMKgwqDCoMKgwqDC
oMKgaW50IGVycjsKPiDCoMKgwqDCoMKgwqDCoMKgdW5zaWduZWQgbG9uZyBpLCBqOwo+ICvCoMKg
wqDCoMKgwqDCoGJvb2wgdXNlX3BkZSA9IHhlX21pZ3JhdGVfdnJhbV91c2VfcGRlKHNyYW1fYWRk
ciwgbGVuICsKPiBzcmFtX29mZnNldCk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGRybV9X
QVJOX09OKCZ4ZS0+ZHJtLCAobGVuICYgWEVfQ0FDSEVMSU5FX01BU0spIHx8Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKHNyYW1fb2Zmc2V0IHwgdnJh
bV9hZGRyKSAmCj4gWEVfQ0FDSEVMSU5FX01BU0spKQo+IEBAIC0xODc5LDcgKzE5MDYsNyBAQCBz
dGF0aWMgc3RydWN0IGRtYV9mZW5jZSAqeGVfbWlncmF0ZV92cmFtKHN0cnVjdAo+IHhlX21pZ3Jh
dGUgKm0sCj4gwqDCoMKgwqDCoMKgwqDCoCAqIHN0cnVjdCBkcm1fcGFnZW1hcF9hZGRyLiBFbnN1
cmUgdGhpcyBpcyB0aGUgY2FzZSBldmVuIHdpdGgKPiBoaWdoZXIKPiDCoMKgwqDCoMKgwqDCoMKg
ICogb3JkZXJzLgo+IMKgwqDCoMKgwqDCoMKgwqAgKi8KPiAtwqDCoMKgwqDCoMKgwqBmb3IgKGkg
PSAwOyBpIDwgbnBhZ2VzOykgewo+ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7ICF1c2VfcGRl
ICYmIGkgPCBucGFnZXM7KSB7CgpXaGF0IGlmIHRoZSBDUFUgcGFnZSBzaXplIGlzIGxhcmdlciB0
aGFuIDJNPyBEb24ndCB3ZSBzdGlsbCB3YW50IHRoaXM/CgpUaGFua3MsClN0dWFydAoKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGludCBvcmRlciA9IHNyYW1fYWRk
cltpXS5vcmRlcjsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZm9yIChq
ID0gMTsgaiA8IE5SX1BBR0VTKG9yZGVyKSAmJiBpICsgaiA8IG5wYWdlczsKPiBqKyspCj4gQEAg
LTE4ODksMTYgKzE5MTYsMjYgQEAgc3RhdGljIHN0cnVjdCBkbWFfZmVuY2UKPiAqeGVfbWlncmF0
ZV92cmFtKHN0cnVjdCB4ZV9taWdyYXRlICptLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaSArPSBOUl9QQUdFUyhvcmRlcik7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IC3C
oMKgwqDCoMKgwqDCoGJ1aWxkX3B0X3VwZGF0ZV9iYXRjaF9zcmFtKG0sIGJiLCBwdF9zbG90ICog
WEVfUEFHRV9TSVpFLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3JhbV9hZGRyLCBsZW4gKyBzcmFtX29mZnNldCk7
Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHVzZV9wZGUpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGJ1aWxkX3B0X3VwZGF0ZV9iYXRjaF9zcmFtKG0sIGJiLCBtLQo+ID5sYXJnZV9wYWdl
X2NvcHlfcGRlcywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcmFtX2FkZHIsIGxlbiAr
Cj4gc3JhbV9vZmZzZXQsIDEpOwo+ICvCoMKgwqDCoMKgwqDCoGVsc2UKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgYnVpbGRfcHRfdXBkYXRlX2JhdGNoX3NyYW0obSwgYmIsIHB0X3Ns
b3QgKgo+IFhFX1BBR0VfU0laRSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcmFtX2Fk
ZHIsIGxlbiArCj4gc3JhbV9vZmZzZXQsIDApOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChk
aXIgPT0gWEVfTUlHUkFURV9DT1BZX1RPX1ZSQU0pIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgc3JjX0wwX29mcyA9IHhlX21pZ3JhdGVfdm1fYWRkcihwdF9zbG90LCAwKSArCj4g
c3JhbV9vZmZzZXQ7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICh1c2VfcGRl
KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3JjX0ww
X29mcyA9IG0tPmxhcmdlX3BhZ2VfY29weV9vZnMgKwo+IHNyYW1fb2Zmc2V0Owo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlbHNlCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBzcmNfTDBfb2ZzID0geGVfbWlncmF0ZV92bV9hZGRyKHB0X3Ns
b3QsIDApICsKPiBzcmFtX29mZnNldDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGRzdF9MMF9vZnMgPSB4ZV9taWdyYXRlX3ZyYW1fb2ZzKHhlLCB2cmFtX2FkZHIsCj4gZmFsc2Up
Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBzcmNfTDBfb2ZzID0geGVfbWlncmF0ZV92cmFtX29mcyh4ZSwgdnJhbV9hZGRy
LAo+IGZhbHNlKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHN0X0wwX29mcyA9
IHhlX21pZ3JhdGVfdm1fYWRkcihwdF9zbG90LCAwKSArCj4gc3JhbV9vZmZzZXQ7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICh1c2VfcGRlKQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHN0X0wwX29mcyA9IG0tPmxhcmdlX3BhZ2Vf
Y29weV9vZnMgKwo+IHNyYW1fb2Zmc2V0Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBlbHNlCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBk
c3RfTDBfb2ZzID0geGVfbWlncmF0ZV92bV9hZGRyKHB0X3Nsb3QsIDApICsKPiBzcmFtX29mZnNl
dDsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGJiLT5jc1tiYi0+
bGVuKytdID0gTUlfQkFUQ0hfQlVGRkVSX0VORDsKCg==
