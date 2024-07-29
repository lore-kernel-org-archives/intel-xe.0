Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C173C3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 13:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0826910E3DF;
	Mon, 29 Jul 2024 13:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPXbmYRy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0391F10E3DF
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722261170; x=1753797170;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=6UJsK9RP82Kt09jE3YA0gAj4NvEzGEjMT/sKElaeAXM=;
 b=dPXbmYRyTkW+MMO/rUPqsCuBfXhF219TlVnE9qzaYGmvdjxYVBZOaSL2
 GpjMz22pOIs2GAW7657LCTcliAxsRg22Ka9R/esDvOjs+ebxlld4d09yw
 BWjN3St0IJdxBbXEDj21Sray7rzLNGkZ27x9Iy4d+uKHA/M8ob7aHTXmz
 ZSgrglHOJ2g1t9HH3Jw9raS2QHgxWmLo50HP8zhNa6HE0ewx8c7UggMZh
 AN2oK3AwMdAIg1PaVc5A3f/XG/2Zch9Qx6UR+HvV5/+fVnG40BYR1hL71
 +Mt28yy/6Q6JT6S4d9zta8pv+vEN23aukFbrjo7NfQ5vaB+BLjNf/OCba w==;
X-CSE-ConnectionGUID: T3OYGJKeTB6tM+TZ5qUtvQ==
X-CSE-MsgGUID: d/yHv3buTdWzzoQD6tlKfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="37487696"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="37487696"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 06:52:49 -0700
X-CSE-ConnectionGUID: GohmY/jMTmSBd/AMUYriXg==
X-CSE-MsgGUID: bxUhY/7LSgOCf/Y0XuVZXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="84627732"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 06:52:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 06:52:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 06:52:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 06:52:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 06:52:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzH1AUzWZHo8kohSxsZRtsB3vRjyxB1tzRq36mnNCuB4Jfai5z4+H9sFfqs+NmKle5Mwr27+/qCc8G9sUeld/qOm5oIPWUisWiMD6vdMJNWWKEvq5bUnzHLWBjx9iQj9DW1m3z6x3fS09WzmYTjoGIRT2mqByUWziQp2NG8q+aRl6d84YY74zfo05wzx5VIwvVBsVxYLVgdRryT6gt5ip2cJkxFPHk+HNoC8jaZD9B/Ebu2eaR8ocvtSUrd3A+m/1fEang6N7zg0nIgfOm89l3WiQrw6XdQKWv/clBDihpxv/CVqK1YDZaQS/g8oSxvxswurj6NkkJ2fKk9QobfmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiwZMQJfZSun6qgQzNe2ZP9H8TqvJl8/J6hmQvuHPig=;
 b=BMtsxLHXn8gw+0S4p5BuDioyfUUigVEvOhgfrfiw89PrJRAdlhWfyG0PMpTnTfFEQLmxMeFyu9EqOqP1nEvwLY0LgAgY0vu4G9PA3VaJr3m+lq9PIE8nAyPsS2QGaIVcae6QGbw6Jls7N+b9RlcYJgw9HvCOd1kz9mqPeF8pvRwA94HFKwj89yCpBDPf+9vdvEp2Mr9jExFIfisvmtKlPka1vcnNNkH/NQd2ZGVVsy6nMsFhWWHYdUiyrUGqWYHfFQ6l6sNFC4pn03qHWE6qKKrTtSBzKxBuNNV31uILNkKVHyV4AxKyLs9EdPSPbwWq6ruINNOGoZEgv5PGv3WFUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 13:52:46 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 13:52:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87plqwxrmq.fsf@intel.com>
References: <20240729121526.448199-1-osharabi@habana.ai>
 <gqffceiac2b6r5nsgmzixccfc3o4xsy4n5x2rsrnxxkca2nukv@whe7y5cqyv76>
 <87plqwxrmq.fsf@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: restructure query config types in an enum
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <obitton@habana.ai>, <kelbaz@habana.ai>
To: Jani Nikula <jani.nikula@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Ohad Sharabi <osharabi@habana.ai>
Date: Mon, 29 Jul 2024 10:52:39 -0300
Message-ID: <172226115988.1863.17618696570206586428@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:303:8d::14) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e01b0e-984a-46da-d33d-08dcafd5b9a3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0xVYjRyVDZ1ak83NWdSNzdHYnAxMW1IUWluQThaNGFiZzFTZ3dRZWg3clRs?=
 =?utf-8?B?NUx5ZDlnT1BmZ3hDSFk5M0huSzR2VE14cy9GeXJDL2dPdkl1OVVoYVR4eExN?=
 =?utf-8?B?RWNXdHBuUDhQY1NkR0hXTTdRUTgwQUxrMUZiZVpydWI4RXZtM2tVbTFjWTJj?=
 =?utf-8?B?NGZuME1BcTZOQXdoNmtOQmtFSlArUCtCNUdBSDhIc2dZMkdlZHE2YS9VSmd6?=
 =?utf-8?B?d3ZOTUN5QmRXWDBxdDBpTE9JOERQOUhGUTk4THBuUGRxSnpVTnpkaytrZ1BR?=
 =?utf-8?B?VTFubmh2Q2EwVTBMblpwTFE1UG5ZV0pSRlI4ZEdNNEp6bVBGSTg3cnMvdEdK?=
 =?utf-8?B?T2x1cERHRUZXMENlNVlaUlUzVkJEWXhwZ3ZEUDRiT2xpeE16ZkFRcmVPZkNT?=
 =?utf-8?B?U2hTSDN0VzRtNlgvUmdNV0Jyby9BbmdnU3NCR0pINXdjbGFDQjIzc0pjak04?=
 =?utf-8?B?QUVVNWRZVThnd1JMLzF4Y05ZTmNyUXlJUzh2QXVzUTdrRWlhSjRDbXpKUHZs?=
 =?utf-8?B?dlE0YWg0STVFT3NBWkUybnNwUlJZT2R3VnZBYzNnZGlWdHdBRENFeWhCbVBG?=
 =?utf-8?B?ajk5b0lXdUVtT2dqK1hXM1R3eGVYU3lGZFl4VVRCKzh3MWpLQU5Oc21kcVYy?=
 =?utf-8?B?cE9pMTQxQUdNZnYyK21yNFpXU0JNZkozN0U3K1liMzN3TmtXYTM5TTM2T3pH?=
 =?utf-8?B?TC80K29ZQWdQSTJPaEdvaU5LUDlMUUFUdUVOdUpFR2lLRzhsNlo3QUJyZVVy?=
 =?utf-8?B?eHhXL3pVRXVwQk1XZzluQmo5ay80Vlh5SkNJODVyVVBKVjh1TXpzKy8vSE5T?=
 =?utf-8?B?clU0ZnFIOVJ4ak04bGt4UDhmbHJsc0JpUEV2bWpZL3UrWUx6QmlqTUxUSmM1?=
 =?utf-8?B?NUtuOUhLb0ozd0hMOXExQnQ0MDRVMnZweFpSZ0g2UU91Vi9zc2RBSWpGK2ND?=
 =?utf-8?B?RlRFNFQzVG9IR1ZBRXFtVWJaUkxOTi9YUm9pRHlPcDFxV2VzbFRMMUJYTVVR?=
 =?utf-8?B?OWhnRGdIeENMNzN1YXV2UHZkZE5mV0ZrYmpISnhYeWV4Mk1KbXZTNnBHUERm?=
 =?utf-8?B?QUNyUE5ISVlYQVVudW1lUVhwbzY3Y2tQb1RoclUyRHAvNHJPT0QycG5HS3Fu?=
 =?utf-8?B?STh2UlN1NEc4SmVBNHpTMWxOT0pPUXZLU3ByTkZ5OUZ6TXFaTWs4YWZmN0Vo?=
 =?utf-8?B?Sm43dUF2QlBtczk0S0lhWXBKQ0t2WG5tOVJYckEvaFlScHZxbDJXNUtMNmxN?=
 =?utf-8?B?SzFXb1J6NjlYV29CbWJTZDVNMG5TZmJkdWhZSHdGeWYzWHMwMThuaWttZW9C?=
 =?utf-8?B?Vk5QTnlCMDE4YXpQZmxKdVFoSVJTbjVnMGlEVENWTU5pUGFrS0p5MGNZcVJE?=
 =?utf-8?B?RUNLMitDcGFWZEtZUGhsOEZXTjZ6ZnNQb1cybFc0MythYzk4QmlhZmpLa0Fx?=
 =?utf-8?B?ay9QbFFPUHREV00xb0FjYXpJWDBZM0duL1QrQ21RNit2ZXZSQmdxL3Izd1g1?=
 =?utf-8?B?SmMvZ2hrVlVSbnZxSExvMGxZK1hjTmQ3VHdTSkFydGFpbXVCcGZGOXNMWDQ5?=
 =?utf-8?B?aHF0OHhGMHAxTnc5ZGFDWW1xQUErbmoyZStKbHlWaGtrWnQ3MG92QjBNMzdI?=
 =?utf-8?B?VFE3cjZxREptaXF6NmNYRE5EMWE0azVzQVVCRmozM0Z4RWszWThLV3h2Vlg0?=
 =?utf-8?B?OFpKNzdhV1lCQ3g2NjRaWW1lTmo0V3BPdjJYNVRubHNBakRMMnRPS3ZiYk5W?=
 =?utf-8?B?NDhmN2JOOWJnWTVlRmRHaGhWdXYxaFg4UjQ0VllSV0IrUnYwY3BkL1l3WlVm?=
 =?utf-8?B?SVdZcFZ4VWJZQlBjaHJLdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXdVYkxVcEw4NzQ2NFoxOXAvTmRRTVkzS0hZV1B6ZnIzZ01CTUcwZzFyc3BU?=
 =?utf-8?B?YjZ5Wk9RYXFoRnVmcHkwaTlHSEUzWktYbTJXL0pvUGVnblMveDgvdFpZWFhX?=
 =?utf-8?B?STlZUWNiR1BKMEhuanhXcUZ2VWE4ZVQvUEVXOU9WZjVDaUQrdHlTRWpDWWMz?=
 =?utf-8?B?R1haVU1zMXRwYVJ3ZGhGd1c4b2NCbkZTRDJTQnFrU0FGMlRFVmdEZTFRbnFO?=
 =?utf-8?B?NW5rQUJaTENoMFVuZitTS3VBK3RjeWt5dDRSTjhXeUN5QnNsSkxsZVJhdldl?=
 =?utf-8?B?ckRzdmVJUElBNkFLbUZxTFhld3ZRVU8yQkM3em9CcUgra05tTDZOaDJJU0M5?=
 =?utf-8?B?WkVTbkdSMFVRM3g4R2k1WFJiMmVIRGdzQkRDbGx1STdYL2hUbTN2UkowZGNG?=
 =?utf-8?B?WWpKYytPZkdjaEsrbzhRbklNVGFObnordDAwMzdsY2JIeUFNTTdHaVJmWGEz?=
 =?utf-8?B?d0t0VVBpSTJTckx5NUQwTGtFK1BTem4wOGZxZVdTcGdPV1hYbGxpQ3ZyQ2xE?=
 =?utf-8?B?THVUR1M0ZitydXBIZDJYWUZ5WEFNV1o3bDV0MUZrTXVVN01VTDg0YlIyTTh2?=
 =?utf-8?B?eEZ1WlltK2dsYTNxRGpvbDF1UjBTZTZGUEZDVGRibzhVOGpzZXhETkJFdFY1?=
 =?utf-8?B?cGZnbWtlamhlNjJKM3pSVVFGa0I3eXdEOUtxZUI2ZjRMV2VCQmxIbHpLWnJt?=
 =?utf-8?B?ZHJGanFVN1ZveVBGazl1UlJmeUlycGJmNWtobExwK0R4YlN6dnp3dG84NnFr?=
 =?utf-8?B?TDFzVU5ubmkva3dtSENmZUZwYitXR05kSnV3MDNtZjRRVWtFeFRoV3hSV2dw?=
 =?utf-8?B?VmMxeEFTMGYvb2wyS1lsWUpzWE1kcTBibUpHd3U0UnduSEZIRklLZ0dKSldD?=
 =?utf-8?B?QXBSeG9RQlo1NXBHTm1ac21uYWdXdG5XK25zZUtHckd2OGdFS0Q0Qkt6RjJu?=
 =?utf-8?B?UjZ5UUNxUnJ2Q0N1bDlkSWtwKzN3OG5iTFdoMEZxQU5YOEhwaFlKMU90ODRt?=
 =?utf-8?B?SHZmaEdSYUJUeXg5N0lYUGl1SXJpUnVuMmdVdElYb2xlT2liWnRxTCtoWE4v?=
 =?utf-8?B?TmEzZ2ExclNQZUxwRGRjMEdUdFBlWnVRNlpVSFFrVGFjaUVobzRTSFg3ZUF0?=
 =?utf-8?B?SHI5YnEyVlNnZWxZTGtEZG94YWFraHQyT01ocG4wcW8yQkJUcG0rbkFBbnNn?=
 =?utf-8?B?ZmxLa2RvRmVvSDVTVEJLcmRqR0hZT0FLY2VYNGw1ZWhodzg5NEJJVUdXaEdn?=
 =?utf-8?B?RjlHNGlWVDFFd2ZGblBKckhib1d3RXcvamNSeEE2bjVwc0puSSsvcFFpUStC?=
 =?utf-8?B?YkZmN05GWkhmUktrNXUwY1hpd295cVJSLzM5WHNsclpJTUowUk5qNlhCQTZT?=
 =?utf-8?B?Y2hCaXcrZHBaUHpQUFZNK1IwYzloRHNrYktzUjZTRjRNTWdoTldHSG8rOTJJ?=
 =?utf-8?B?bVJoTVNtQzhDNG1kKzZGUUl6bkVFM0xLK1VYcis4SjIvYmhYSEJYR3JJWVAv?=
 =?utf-8?B?T3RjN0c2K0pvWmlPc3puVGg5UHhVb0NkNzRpMEc1Tk5wVGtwVGlJNlRLWURV?=
 =?utf-8?B?Q1pMTVBEZlA1MjhiUjNjK3p6VGRZMlZwTmZaZ0p2U0xBcTd4bUoxYzlVMGp4?=
 =?utf-8?B?dk11QWpZaWd0SHV4d2dxOEVVc3MwQnFjbFVrVVRON3FyY0NPb2YzVkZVL1dr?=
 =?utf-8?B?TXExaWh6ak5ML2pHSkV1dHJDWXdFMHN5bTd2Y3U5RG1GVWdrSHdZdGtNTFlV?=
 =?utf-8?B?UVpQempQdGhDZno5OFhDdU5PeXJBWmU0UHgrNlZqaEhGamxlbHZmeU13cHJv?=
 =?utf-8?B?MUFGYzhCUmZDYjJ0VzJNUDlaQk53bnByK3dXOXFOdDVWOFJ4UiswQ3VDTU9R?=
 =?utf-8?B?d0VGZHNYQUU5OFl4V0ZLSmJBcXNJUFArZnFRdkJsSGgrZU1XQko2bU54RkpF?=
 =?utf-8?B?SGpYTHJxK1IvMVg3eTJmbDljczlTWkdEdlRpQkxBcXRTcUkzVDVuOTR0U1Br?=
 =?utf-8?B?Tllwb2RqdU1RL1ZnSTY2Tm4rWGxYSHZ6ZGJzRXdnc3kybFRsQ0V4QjgxT3cv?=
 =?utf-8?B?alhkVkJqT005NTUxUUxMait2VkVkblZFdnhXN095YW91YmRDM2RuYW9IMm03?=
 =?utf-8?B?Z3RxV1VvUUU4ekN2THdKVFZlV3BFNGhoTFN6Skp6NXlDb2tMYXViaXNXcW5N?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e01b0e-984a-46da-d33d-08dcafd5b9a3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 13:52:45.9218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxWx7FwXX5aswWu7eCCDtBMb6UQ1copWYbtuf3PEYZT88ASqmup/o26XgJBh1k/RgSm0kpdLIppbG+SaaTm0Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7029
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

Quoting Jani Nikula (2024-07-29 10:19:25-03:00)
>On Mon, 29 Jul 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Mon, Jul 29, 2024 at 03:15:26PM GMT, Ohad Sharabi wrote:
>>>The config query has entries per config type.
>>>
>>>In query_config(), an array is allocated using the last element of
>>>the query config to dictate the array length.
>>>
>>>Instead, a more robust approach would be to use the standard "number of
>>>elements" last element of an enum such that one wouldn't need to modify
>>>the ioctl each time another entry is added.
>>>
>>>v2:
>>> - modify `enum drm_xe_query_config_type` doc
>>>
>>>Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
>>>---
>>> drivers/gpu/drm/xe/xe_query.c |  2 +-
>>> include/uapi/drm/xe_drm.h     | 58 ++++++++++++++++++++++-------------
>>> 2 files changed, 38 insertions(+), 22 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query=
.c
>>>index 73ef6e4c2dc9..aaa60ff764ee 100644
>>>--- a/drivers/gpu/drm/xe/xe_query.c
>>>+++ b/drivers/gpu/drm/xe/xe_query.c
>>>@@ -313,7 +313,7 @@ static int query_mem_regions(struct xe_device *xe,
>>>
>>> static int query_config(struct xe_device *xe, struct drm_xe_device_quer=
y *query)
>>> {
>>>-        const u32 num_params =3D DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRI=
ORITY + 1;
>>>+        const u32 num_params =3D DRM_XE_QUERY_CONFIG_NUM_CONFIGS;
>>>         size_t size =3D
>>>                 sizeof(struct drm_xe_query_config) + num_params * sizeo=
f(u64);
>>>         struct drm_xe_query_config __user *query_ptr =3D
>>>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>index 29425d7fdc77..9222563cddc3 100644
>>>--- a/include/uapi/drm/xe_drm.h
>>>+++ b/include/uapi/drm/xe_drm.h
>>>@@ -378,6 +378,42 @@ struct drm_xe_query_mem_regions {
>>>         struct drm_xe_mem_region mem_regions[];
>>> };
>>>
>>>+#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM        (1 << 0)
>>>+
>>>+/**
>>>+ * enum drm_xe_query_config_type - Indices for the supported configs re=
turned
>>>+ * in &drm_xe_query_config.info array
>>>+ */
>>>+enum drm_xe_query_config_type {
>>>+        /**
>>>+         * @DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID: Device ID (lower 16 =
bits)
>>>+         * and the device revision (next 8 bits).
>>>+         */
>>>+        DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID,
>>>+        /**
>>>+         * @DRM_XE_QUERY_CONFIG_FLAGS: Flags describing the device
>>>+         * configuration, see list below.
>>>+         *
>>>+         *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the=
 device
>>>+         *      has usable VRAM
>>>+         */
>>>+        DRM_XE_QUERY_CONFIG_FLAGS,
>>>+        /**
>>>+         * @DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT: Minimal memory alignment
>>>+         * required by this device, typically SZ_4K or SZ_64K.
>>>+         */
>>>+        DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT,
>>>+        /** @DRM_XE_QUERY_CONFIG_VA_BITS: Maximum bits of a virtual add=
ress. */
>>>+        DRM_XE_QUERY_CONFIG_VA_BITS,
>>>+        /**
>>>+         * @DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY: Value of the h=
ighest
>>>+         * available exec queue priority.
>>>+         */
>>>+        DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY,
>>>+        /** @DRM_XE_QUERY_CONFIG_NUM_CONFIGS: must be last. Number of c=
onfigs */
>>>+        DRM_XE_QUERY_CONFIG_NUM_CONFIGS,
>>
>> But then when we change from 5 to 6, we are changing the uapi.  It's
>> very possible that userspace was using that number and then when they
>> update the header the build breaks.
>>
>> I believe that's why none of our enums contain a max/count/num element
>> at the end.
>
>Agreed.

I talked with Lucas and now I understand how this could cause problems
if userspace starts to rely on DRM_XE_QUERY_CONFIG_NUM_CONFIGS in a way
that could break when DRM_XE_QUERY_CONFIG_NUM_CONFIGS increases.

That said, IMHO, I believe DRM_XE_QUERY_CONFIG_NUM_CONFIGS shouldn't be
treated as a stable value across "releases" of the driver and assume
that it could increase.

But, yeah, we might want to avoid eventual problems by not exporting it
to userspace in the first place.

--
Gustavo Sousa

>
>
>BR,
>Jani.
>
>
>>
>> Lucas De Marchi
>>
>>>+};
>>>+
>>> /**
>>>  * struct drm_xe_query_config - describe the device configuration
>>>  *
>>>@@ -385,33 +421,13 @@ struct drm_xe_query_mem_regions {
>>>  * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
>>>  * struct drm_xe_query_config in .data.
>>>  *
>>>- * The index in @info can be:
>>>- *  - %DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID - Device ID (lower 16 bits=
)
>>>- *    and the device revision (next 8 bits)
>>>- *  - %DRM_XE_QUERY_CONFIG_FLAGS - Flags describing the device
>>>- *    configuration, see list below
>>>- *
>>>- *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>>>- *      has usable VRAM
>>>- *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>>>- *    required by this device, typically SZ_4K or SZ_64K
>>>- *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>>>- *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highe=
st
>>>- *    available exec queue priority
>>>+ * The index in @info are the entries in `enum drm_xe_query_config`
>>>  */
>>> struct drm_xe_query_config {
>>>         /** @num_params: number of parameters returned in info */
>>>         __u32 num_params;
>>>-
>>>         /** @pad: MBZ */
>>>         __u32 pad;
>>>-
>>>-#define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID        0
>>>-#define DRM_XE_QUERY_CONFIG_FLAGS                        1
>>>-        #define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM        (1 << 0)
>>>-#define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT                2
>>>-#define DRM_XE_QUERY_CONFIG_VA_BITS                        3
>>>-#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY        4
>>>         /** @info: array of elements containing the config info */
>>>         __u64 info[];
>>> };
>>>--=20
>>>2.34.1
>>>
>
>--=20
>Jani Nikula, Intel
