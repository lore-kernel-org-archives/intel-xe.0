Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38141C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 07:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FF210EA83;
	Tue,  8 Sep 2026 07:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxHvzvrF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F6310EA25;
 Tue,  8 Sep 2026 07:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788852904; x=1820388904;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Sp7+0YtbVmOOYhmpSvFnCEKgZRy2pktxvwb8o7D8tYw=;
 b=NxHvzvrFpY7LG6hzG96tiLqlEp2TgKqaZwWEGydAdNgKKhXfQFYbZ2J3
 wMkFM/J9jv2SFuPIzdYm9jf2RuCu3hqvRxSEmUGG6cI5tYdT5XmOEjTw+
 I7UhmH2nZPHy9JRUTd4gxdnkiHRILp4K0K2GBcfXgMGdcOKxdleRpjZbe
 EN3Us55f8XkXo97cWbfgvSz2asHHU7FxXfzkndMy1MGUKTyPV3cVsFDvW
 8l6Uc1Uh+T7fMEdCnDMDM5v8k/LsVYNjPsu3Lmx+fRGwDYNan+W4p4AE/
 MydvptwZ3HCC0pJLVF4FnQLXTArSEVyD96/xv4kXSo1gcYtKxoG2HbVEb Q==;
X-CSE-ConnectionGUID: KcanVuzCSkCW5ACwSDNTgQ==
X-CSE-MsgGUID: w56hAlzeT8CZ+3QKxZPPWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89264031"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89264031"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:35:03 -0700
X-CSE-ConnectionGUID: uNqlqAGzRxOzLK1S3DIkJw==
X-CSE-MsgGUID: Ay15Jps2SMycjGB7MiMiAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269186514"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:35:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:35:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 00:35:02 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:35:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvdO7uR6FFcV215ZsxEmD1Uhy+M5nWGR7GF4kKOcMcFo71H7YC/mJ+dJoyi10rA3efdMuwr5rrNTbR4KpK1IVqHOL5at1GQwCcicUiinrx6Dwn49DertSbZFKNSxAOdu1xDfT3jLQGNQV1Ib74/hKxcwoOsThGnHSLdTzNJ4a3Djs9mqV4HxLtGi+wiK2aWuNBazW0vbpz+5yhqbC3cgvaoFc5W/X00clziQYruJ0foSYJxfF3p0Y2gaeNUJmhL4VAHxrxAvsntSSxnajDpQLGeOGuAhn/YjN1rTzR9Mx9bHJc95ACx/9lqdaLKrLO77GRHUEkf/+t/6ejU8+VZUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sp7+0YtbVmOOYhmpSvFnCEKgZRy2pktxvwb8o7D8tYw=;
 b=kiV1rG0/YSXLFmTBdUX9wOy+rnpipqZsoffaOiqdoW4S9S1KBVTWsKFYJEt9Ndko6T2L9L9xDGgs9cgYFzmazzollCMim9QgmtjqK9q15XqRE4vdMtySUGGn8odl5j+ZCftQGKxZvuoRe6hH8ZvFXqXbiF8MaDKPRFLS7K+kbRDgvMquQnA4g6Ep7jaFteF0eJMG+rTfljsuKEEe1sfoMvj9coU2U4cy8YUQpF0MWxEBHA1MZ/GGv6M0CM0og4522t0tN26i/vUJRFaFFYPYeyjTp0CjsjS/TLID1Gzu3g13NUFIQlxfx3KiarSWMdCcgqvumLl+ieOtBBgYlQOoiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by LV2PR11MB940045.namprd11.prod.outlook.com (2603:10b6:408:3b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 07:35:01 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0360.008; Tue, 8 Sep 2026
 07:35:00 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "Lattannavar, 
 Sameer" <sameer.lattannavar@intel.com>
Subject: RE: [PATCH] drm/i915/debugfs: Add HDR status to i915_display_info
Thread-Topic: [PATCH] drm/i915/debugfs: Add HDR status to i915_display_info
Thread-Index: AQHdPns+WjJHB0FwiU+4b6uQ9k7RKrbC5TOAgAFRqGA=
Date: Tue, 8 Sep 2026 07:35:00 +0000
Message-ID: <PH7PR11MB605366F79DC7833B6B99C351E7B12@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260907035831.718916-1-pranay.samala@intel.com>
 <4223f91e8a308713ca916a1bba3147321e9b901d@intel.com>
In-Reply-To: <4223f91e8a308713ca916a1bba3147321e9b901d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|LV2PR11MB940045:EE_
x-ms-office365-filtering-correlation-id: d26144ae-25e8-482f-25ca-08df0d7bb0dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|38070700021|3023799007|10067099003|5023799004|11063799006|4143699003|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info: D+FatSeAXvInKusTUl1P+9HmLjtms5JRBKFCzhifzRWOnUMJZxfgZ4KksN+pCwrI1wWtKz6fB9cEru3B3pDe5boEjMYv8m19IKRtVqa9Ps4PUbCcs9PiNLfwEJCw1fktkOfC1RgJNHTinFnsNWtg7KXbVdlMmcm8E8cC3cClSip2HDxQNfuM8WWU1Ko2pRVlNb4zGQvrFrAmxAjhDvgMkcYVy4F5Aw/0+pFwt+clNWUVywy4s/zeimvK379KCTLUWxQQ+e9rJucD8AX9A6PIwRc1Oa+nHid2xdcnGaUF3EBQ27NrXlJeNbZsQhRr6Ycu4CNl0if06Fd3dHndcmr2kRmzm/voUEsX+kWp5dclFmyIB3ZtLEwRVsIfOI/WEjitxNHKV9G2JPe4m+xq6brAO3/YeOc8RNcquVBCDWEJoCjoMhxeLBzyW1rj+dz1ahus+I1FCwmqoTPS9XblmXVM1qr+7OL6QwYEMEFZ7BNIM3oq3ZsEOf3rYhqScZGsK8pRMXuAxCYjtl8cxcDRjodHbYT02L+DSXZYaz/NKomMCGD4uBORlR7TR3dhCn3PfDienIWRY/PbNmL97vU94r5rTugRqaMral6Hh3dtoHp/mg9dG86kj6DaLr3tiMgTqNN7E3blLHOFL8rwPcjQWbxJ9Gd1+YKkCd7HUe80WuxkGIx8h+jmK90dOLlbiicl8HeChxMR9zoTNiSTjU6LX2GAuVy7xe80Ww6iEXMofZm0Gfc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(3023799007)(10067099003)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWxxcVZXb092bVBlZzFGbGxRZ3dUL1IrKzM1VkhaWXpuNmFxYS91djVnVXZt?=
 =?utf-8?B?dW9KR1BNcWlQL2Z1UDdLUDJqZ1NqNEY3MEJWOFB3QnI0eHQ4UVovYVN0bmc2?=
 =?utf-8?B?djQ2eEttNWFvTmNSWGRzTmhMSzliaVkxOFgyblVsb2pnU000VnNRYTZxM1Nk?=
 =?utf-8?B?dmtoeUNxOGFwYVAwRHV4VFVKQmpoRDl2dGFqZUYrV01sR3F0OW4yWEZGOU1k?=
 =?utf-8?B?aG9pV0wrYndwMktjSnpiTUhPL09WYUlOOFEza3RIeXdDZWdOQ09uSUFTSWdY?=
 =?utf-8?B?dU0waUdCZFJ3eTZGVW5yVW1ZU0FkRzl1dTdvNlBWYm0vWmZXeXZuK29lSlVH?=
 =?utf-8?B?NGZlTUd5ZlFCMzBYWmQvcWNlSHJlNXB1MjZPSFgrMWRXZkJndytwQ3g3RVBp?=
 =?utf-8?B?WUxpakMrMjVuaGlDZjFMdzg4VUd1YkNjTC8wTmhQbS9uVnVpeUZWYk9oNmZQ?=
 =?utf-8?B?NDRTRHJzcnczR0ZKQXRlRjFZcDdrU2xqRTVhc2ZhSUZhNVE1ME5wMHhqLyts?=
 =?utf-8?B?MDNlRTZYZ3l5bGZsME5seUtJbjIyTDhFU1VhTS9ySVFuN2did1JKallKVTRH?=
 =?utf-8?B?M0dVYVR4SFQyQkpENUFSTHRieXRsRDNNQ0NROTRKUCtkK1lRM2NHZmh5bW5K?=
 =?utf-8?B?cVpYOTdPdGQyd0pwb25DRmFycDNHWkhSQmw0cXJueW9zSDIrVy9FOWtBMXE4?=
 =?utf-8?B?a2lMZGVmTVdWdlB4L2xEZEppeVBtNkQ2WmFwRDQ1dE5QVlB3YmVGSEtnZVhw?=
 =?utf-8?B?bm1wNEdDeWlsaVRGbGVDbmNXbk03eUYrcitSMThqMDhrbDdTOGk0VnY3U3hY?=
 =?utf-8?B?Smc1MFpqZUxmNXYzZHBQZXdDby9JM1JjWko0WUJpak1uclhzSzZLcGEvTXZ6?=
 =?utf-8?B?VnJwWkM2aVhtb1BsTWowN1owNVV5OE9nM3llZTZhRXBsUEZrd0JCb1BKVjhL?=
 =?utf-8?B?ZWVxc0xCZm1xTTQxclZsRjJqZGc5OEoyYTRXV0QzY1pQeEp5R21rcmhSRnZR?=
 =?utf-8?B?K2pzdU05ZjJERTcyenNnK2VCek9wcTV2amJRZlNvMlkzRWNQR3creTVHYisy?=
 =?utf-8?B?SXR2dW5XR1E1aDhPZWtGYStvRlN5bFdBTVF6Q1Z0OHJoTmtUeC9mWmdteHJm?=
 =?utf-8?B?Z3RZbTluZVEwRzF5NENlaHlPUlovQ2VCNThzODBoOHdLb1pkV0g0WkZuNmtk?=
 =?utf-8?B?eE5kRkUzKzk1NTEwT3hzTGM4UVRIT0NCL3ZLQThKWG9MY3FrVkwxZVFRMEVv?=
 =?utf-8?B?NUJIZGE0NDI5aWNxanJjTHBUcS8rSHFEcjVOaXRBaU5OMmJYTStXZlNNbHMr?=
 =?utf-8?B?ZnFBNjFZdDZHUXdlSVF1S01LMHF4RkhZb1d0NHZnZDVDcmhCVUlVZkpZUDk2?=
 =?utf-8?B?eHpEdXFHTkh6dDdPd2dEckRJWUVybTFiYXhpdWYrQ1BNUGY5S21GTjd6dVNL?=
 =?utf-8?B?b3RtSzIyM0FJaVZlYkVzcmRqQWtMZ0l3V2I3elcrMVQ1a0FYU0hnQjdpSStu?=
 =?utf-8?B?ejVtT2FjZ25ia1piS3E2SnhaMkQySHMvUjdlZjdpaDdBL0U5SWpWUnhaQlR0?=
 =?utf-8?B?UlpYNTJ0aUpTZDloZThaaFZ2ekpTWXQxSHJVU2VCREhiZE5Ea2d2T3Ftc2M1?=
 =?utf-8?B?V0dwU0FUZ1VFMHB0dEVudTNUeVhCV0xpYzBCaGdWMmVMdzlRaHorNDZnalJQ?=
 =?utf-8?B?bCtHQndyM3hqcDArY1QwcWR0bVVJQ2c2Y2JGU3ZDUzJNL2oxYlNzUHBDWXUr?=
 =?utf-8?B?WEpzQUFuTnV4TmliMmxLam9oZlNuYWNFOU9Tbk1BMkZ6UW1TNFR6VFduS3dr?=
 =?utf-8?B?a1JiVk5TZUhmYjdzYlFEVUI0M1RReUJ6eUJmM3VGdUdaUkNEaVVjZldydU90?=
 =?utf-8?B?djNhbzU2SkFieWsxZ3dlSkdJbER5U21TdU9XRDc0Mk1KVW1OemFUU0tFSDZR?=
 =?utf-8?B?eURhblU2eDltNDRISElJa0swUGJaNGpMK0tNVUJLY2phd1VNSG9WRkMrY0N5?=
 =?utf-8?B?MnlRVXBFeVNlSURCQlEyc0FJWEFUN09sOE8vWERnOG9lRmRxVGpENGJyR3Vr?=
 =?utf-8?B?QUZBbW9ybjlldjBiMkIvb3RoSWJqSG8ybXhEcmprUE11Z0kwaThzV1JURVc3?=
 =?utf-8?B?OGdBa3A5di81d2xkSFY4b3lCR2ZnY0hxN2s4ME9weE1vUUh4NjR3Q09hYkhK?=
 =?utf-8?B?SHIzRnBDMWFZbnVvNzQyUnFIb3Nac2hQMHRMc2tLL0VzQTlmeTBhemNKRVRW?=
 =?utf-8?B?NTIrWFNMREpseGVyYXNkQjBMMStpbnhEOW1YeWJDdzc3VDZBdWFLVkdVaGk3?=
 =?utf-8?B?K2pYWWZTSEFlejZZMTFxNjN3TE03ZEVnLzE0NG10MHppTDNPNFFIUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZshqO4oZrxzWiqGA6NpzkgEvbCRt+CnJqFKbjGPqKH0jBa5hBTVl6UJBBziQr/kmUwIEIcVfhu29Z9h5g7iIH0vRC+sbywCASJByO0IfGRJvbnmws2M1wTZbkx9vkjwXGwWl3O71ktA/TWCSgwSWqjJfm0rnpDiMccigox5Rx7l8JIBmzWVgB3CZdUvQvLczDvreL63fA9YsY1zJElNo5qRtAvk6OloMmQGcoeBbNHMrc5q+20Pr9+/GMcuU1NAlShJMYCPKYUCFgTt/aoQkUtY5n/n9pvJq+5xgPtewZdUkrcZmVCfZQR9px1nt624OGwx4QnFt+H+1g2f7+DhDeQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d26144ae-25e8-482f-25ca-08df0d7bb0dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 07:35:00.8636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4t+lsE1PsWm0hnoX2YM1npU7xRl6AmJUwm3OPocX6GGp5RAO+/dSwvjL1MvS1vifVYyRmqVSEKBzc5jX5knYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB940045
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

SGkgSmFuaSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW5pIE5p
a3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIFNlcHRl
bWJlciA3LCAyMDI2IDM6NDAgUE0NCj4gVG86IFNhbWFsYSwgUHJhbmF5IDxwcmFuYXkuc2FtYWxh
QGludGVsLmNvbT47IGludGVsLQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14
ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEJvcmFoLCBDaGFpdGFueWEgS3VtYXIgPGNo
YWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+Ow0KPiBMYXR0YW5uYXZhciwgU2FtZWVyIDxz
YW1lZXIubGF0dGFubmF2YXJAaW50ZWwuY29tPjsgU2FtYWxhLCBQcmFuYXkNCj4gPHByYW5heS5z
YW1hbGFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vaTkxNS9kZWJ1Z2Zz
OiBBZGQgSERSIHN0YXR1cyB0byBpOTE1X2Rpc3BsYXlfaW5mbw0KPiANCj4gT24gTW9uLCAwNyBT
ZXAgMjAyNiwgUHJhbmF5IFNhbWFsYSA8cHJhbmF5LnNhbWFsYUBpbnRlbC5jb20+IHdyb3RlOg0K
PiA+IGk5MTVfZGlzcGxheV9pbmZvIGN1cnJlbnRseSBzaG93cyBwZXItY29ubmVjdG9yIHN0YXRl
IGJ1dCBub3QgSERSDQo+ID4gc3RhdHVzLCBtYWtpbmcgSERSIGJyaW5ndXAgaGFyZCB0byBkZWJ1
ZyB3aXRob3V0IGNvcnJlbGF0aW5nIEVESUQsDQo+ID4gdXNlcnNwYWNlLCBhbmQgZHJpdmVyIHN0
YXRlLg0KPiA+DQo+ID4gUHJpbnQgdGhlIHNpbmvigJlzIEhEUiBjYXBhYmlsaXR5IGZyb20gdGhl
IEVESUQgc3RhdGljIG1ldGFkYXRhIGJsb2NrLA0KPiA+IHdoZXRoZXIgdXNlcnNwYWNlIGhhcyBz
ZXQgdGhlIEhEUl9PVVRQVVRfTUVUQURBVEEgcHJvcGVydHksIGFuZA0KPiA+IHdoZXRoZXIgdGhl
IGRyaXZlciBpcyBhY3R1YWxseSB0cmFuc21pdHRpbmcgSERSIG1ldGFkYXRhIGluIHRoZSBDUlRD
DQo+ID4gc3RhdGUuIFRoaXMgZGlzdGluZ3Vpc2hlcyBiZXR3ZWVuIGEgc2luayBhZHZlcnRpc2lu
ZyBIRFIgc3VwcG9ydCwgYQ0KPiA+IHByb3BlcnR5IGJlaW5nIHNldCBieSB1c2Vyc3BhY2UsIGFu
ZCB0aGUgYWN0dWFsIEhEUiBpbmZvZnJhbWUgYmVpbmcgc2VudA0KPiBvbiB0aGUgd2lyZS4NCj4g
Pg0KPiA+IEFzc2lzdGVkLWJ5OiBHaXRIdWJfQ29waWxvdDpjbGF1ZGUtb3B1cy01DQo+ID4gU2ln
bmVkLW9mZi1ieTogUHJhbmF5IFNhbWFsYSA8cHJhbmF5LnNhbWFsYUBpbnRlbC5jb20+DQo+ID4g
LS0tDQo+ID4gIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jICB8
IDgyDQo+ID4gKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgODIgaW5z
ZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMNCj4gPiBpbmRleCAzZTMwMmYyM2YyNDcu
LmEyNGM5NDdjMjNkZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMuYw0KPiA+IEBAIC0yNDMsNiArMjQzLDg2
IEBAIHN0YXRpYyB2b2lkIGludGVsX2hkbWlfaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sDQo+ID4g
IAlzZXFfcHJpbnRmKG0sICJcdGF1ZGlvIHN1cHBvcnQ6ICVzXG4iLCBzdHJfeWVzX25vKGhhc19h
dWRpbykpOyAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBjb25zdCBjaGFyICppbnRlbF9oZHJfZW90Zl9u
YW1lKGVudW0gaGRtaV9lb3RmIGVvdGYpIHsNCj4gPiArCXN3aXRjaCAoZW90Zikgew0KPiA+ICsJ
Y2FzZSBIRE1JX0VPVEZfVFJBRElUSU9OQUxfR0FNTUFfU0RSOg0KPiA+ICsJCXJldHVybiAiU0RS
IjsNCj4gPiArCWNhc2UgSERNSV9FT1RGX1RSQURJVElPTkFMX0dBTU1BX0hEUjoNCj4gPiArCQly
ZXR1cm4gIkhEUi1nYW1tYSI7DQo+ID4gKwljYXNlIEhETUlfRU9URl9TTVBURV9TVDIwODQ6DQo+
ID4gKwkJcmV0dXJuICJTTVBURV9TVDIwODQiOw0KPiA+ICsJY2FzZSBIRE1JX0VPVEZfQlRfMjEw
MF9ITEc6DQo+ID4gKwkJcmV0dXJuICJITEciOw0KPiA+ICsJZGVmYXVsdDoNCj4gPiArCQlyZXR1
cm4gInVua25vd24iOw0KPiA+ICsJfQ0KPiA+ICt9DQo+IA0KPiBNYXliZSBhZGQgdGhhdCB0byBo
ZG1pLltjaF0gaW5zdGVhZCBvZiBhIGxvY2FsIGNvcHk/IFRoZXJlJ3Mgbm90aGluZyBJbnRlbCBv
cg0KPiBpOTE1IHNwZWNpZmljIGFib3V0IHRoaXMuDQo+IA0KDQpBZ3JlZWQuIGVudW0gaGRtaV9l
b3RmIGFscmVhZHkgbGl2ZXMgaW4gaW5jbHVkZS9saW51eC9oZG1pLmguDQoNCkZvciB2MiBJJ2xs
IGFkZCBoZG1pX2VvdGZfZ2V0X25hbWUoKSB0byBkcml2ZXJzL3ZpZGVvL2hkbWkuYyBhbG9uZ3Np
ZGUNCnRoZSBleGlzdGluZyBoZG1pXypfZ2V0X25hbWUoKSBoZWxwZXJzLg0KaW50ZWxfaGRyX2Vv
dGZfbmFtZSgpIHRoZW4gZ29lcyBhd2F5IGVudGlyZWx5Lg0KDQo+ID4gKw0KPiA+ICtzdGF0aWMg
dm9pZCBpbnRlbF9oZHJfc2lua19pbmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwNCj4gPiArCQkJCXN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+ID4gK3sNCj4gDQo+IElmIHlvdSBkaWQN
Cj4gDQo+IAlzdHJ1Y3QgZHJtX3ByaW50ZXIgcCA9IGRybV9zZXFfZmlsZV9wcmludGVyKG0pOw0K
PiANCj4gaW4gdGhlIGNhbGxlciwgYW5kIHBhc3NlZCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAgaGVy
ZSwgeW91IGNvdWxkIHVzZQ0KPiBkcm1fcHJpbnRmX2luZGVudCgpIGFuZCBhdm9pZCBkb2luZyB0
aGF0IFx0IHN0dWZmIGV2ZXJ5d2hlcmUuDQo+IA0KDQpTdXJlLCBXaWxsIGRvLg0KDQo+IFNpZGUg
bm90ZSwgSSd2ZSBnb3QgYSBicmFuY2ggY29udmVydGluZyB0aGUgZW50aXJlIGZpbGUgdG8gZHJt
X3ByaW50ZXIsIGJ1dA0KPiBuZXZlciBnb3QgYXJvdW5kIHRvIHNlbmRpbmcgaXQuDQo+IA0KDQpI
YXBweSB0byByZWJhc2Ugb24gdGhhdCBpZiB5b3UnZCByYXRoZXIgc2VuZCBpdCBmaXJzdCwgc28g
d2UncmUgbm90IGJvdGgNCnRvdWNoaW5nIHRoZSBzYW1lIGxpbmVzLiBPdGhlcndpc2UsIEknbGwg
cG9zdCB2MiB1c2luZyBkcm1fcHJpbnRlciBhcw0KYWJvdmUsIGl0IHNob3VsZCByZWJhc2UgY2xl
YW5seSBvbnRvIHlvdXIgY29udmVyc2lvbiBlaXRoZXIgd2F5Lg0KDQpUaGFua3MgZm9yIHRoZSBy
ZXZpZXcuDQoNClJlZ2FyZHMsDQpQcmFuYXkNCg0KPiANCj4gQlIsDQo+IEphbmkuDQo+IA0KPiAN
Cj4gPiArCWNvbnN0IHN0cnVjdCBoZHJfc3RhdGljX21ldGFkYXRhICpoZHIgPQ0KPiA+ICsJCSZj
b25uZWN0b3ItPmRpc3BsYXlfaW5mby5oZHJfc2lua19tZXRhZGF0YS5oZG1pX3R5cGUxOw0KPiA+
ICsJaW50IGk7DQo+ID4gKw0KPiA+ICsJc2VxX3ByaW50ZihtLCAiXHRIRFIgc2luayBjYXBhYmxl
OiAlc1xuIiwNCj4gPiArCQkgICBzdHJfeWVzX25vKGhkci0+ZW90ZiAmIChCSVQoSERNSV9FT1RG
X1NNUFRFX1NUMjA4NCkgfA0KPiA+ICsJCQkJCSAgIEJJVChIRE1JX0VPVEZfQlRfMjEwMF9ITEcp
KSkpOw0KPiA+ICsJaWYgKCFoZHItPmVvdGYpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiAr
CXNlcV9wdXRzKG0sICJcdFx0c3VwcG9ydGVkIEVPVEY6Iik7DQo+ID4gKwlmb3IgKGkgPSBIRE1J
X0VPVEZfVFJBRElUSU9OQUxfR0FNTUFfU0RSOyBpIDw9DQo+IEhETUlfRU9URl9CVF8yMTAwX0hM
RzsgaSsrKQ0KPiA+ICsJCWlmIChoZHItPmVvdGYgJiBCSVQoaSkpDQo+ID4gKwkJCXNlcV9wcmlu
dGYobSwgIiAlcyIsIGludGVsX2hkcl9lb3RmX25hbWUoaSkpOw0KPiA+ICsJc2VxX3B1dHMobSwg
IlxuIik7DQo+ID4gKw0KPiA+ICsJc2VxX3ByaW50ZihtLCAiXHRcdHN0YXRpYyBtZXRhZGF0YSB0
eXBlMTogJXNcbiIsDQo+ID4gKwkJICAgc3RyX3llc19ubyhoZHItPm1ldGFkYXRhX3R5cGUgJg0K
PiBCSVQoSERNSV9TVEFUSUNfTUVUQURBVEFfVFlQRTEpKSk7DQo+ID4gKwlzZXFfcHJpbnRmKG0s
ICJcdFx0bWF4X2NsbDogJXUsIG1heF9mYWxsOiAldSwgbWluX2NsbDogJXUgKEVESUQNCj4gY29k
ZWQpXG4iLA0KPiA+ICsJCSAgIGhkci0+bWF4X2NsbCwgaGRyLT5tYXhfZmFsbCwgaGRyLT5taW5f
Y2xsKTsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgaW50ZWxfaGRyX291dHB1dF9pbmZvKHN0
cnVjdCBzZXFfZmlsZSAqbSwNCj4gPiArCQkJCSAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3Rvcikgew0KPiA+ICsJY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3Rh
dGUgPSBjb25uZWN0b3ItPnN0YXRlOw0KPiA+ICsJY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3Rh
dGUgKmNydGNfc3RhdGU7DQo+ID4gKwljb25zdCBzdHJ1Y3QgaGRtaV9kcm1faW5mb2ZyYW1lICpm
cmFtZTsNCj4gPiArDQo+ID4gKwlpZiAoIWNvbm5fc3RhdGUgfHwgIWNvbm5fc3RhdGUtPmNydGMp
DQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCWNydGNfc3RhdGUgPSB0b19pbnRlbF9jcnRj
X3N0YXRlKGNvbm5fc3RhdGUtPmNydGMtPnN0YXRlKTsNCj4gPiArDQo+ID4gKwlzZXFfcHJpbnRm
KG0sICJcdEhEUiBvdXRwdXQgbWV0YWRhdGEgYmxvYjogJXNcbiIsDQo+ID4gKwkJICAgc3RyX3ll
c19ubyhjb25uX3N0YXRlLT5oZHJfb3V0cHV0X21ldGFkYXRhKSk7DQo+ID4gKw0KPiA+ICsJLyog
SERNSSBzaWduYWxzIEhEUiB2aWEgYSBEUk0gSW5mb0ZyYW1lLCBEUCB2aWEgYSBnYW11dCBtZXRh
ZGF0YQ0KPiBTRFAgKi8NCj4gPiArCWlmICghKGNydGNfc3RhdGUtPmluZm9mcmFtZXMuZW5hYmxl
ICYNCj4gPiArCSAgICAgIChpbnRlbF9oZG1pX2luZm9mcmFtZV9lbmFibGUoSERNSV9JTkZPRlJB
TUVfVFlQRV9EUk0pIHwNCj4gPiArDQo+IGludGVsX2hkbWlfaW5mb2ZyYW1lX2VuYWJsZShIRE1J
X1BBQ0tFVF9UWVBFX0dBTVVUX01FVEFEQVRBKSkpKSB7DQo+ID4gKwkJc2VxX3B1dHMobSwgIlx0
SERSIG91dHB1dDogb2ZmXG4iKTsNCj4gPiArCQlyZXR1cm47DQo+ID4gKwl9DQo+ID4gKw0KPiA+
ICsJZnJhbWUgPSAmY3J0Y19zdGF0ZS0+aW5mb2ZyYW1lcy5kcm0uZHJtOw0KPiA+ICsNCj4gPiAr
CXNlcV9wcmludGYobSwgIlx0SERSIG91dHB1dDogb24sIEVPVEY6ICVzLCBtZXRhZGF0YSB0eXBl
OiAlZFxuIiwNCj4gPiArCQkgICBpbnRlbF9oZHJfZW90Zl9uYW1lKGZyYW1lLT5lb3RmKSwgZnJh
bWUtDQo+ID5tZXRhZGF0YV90eXBlKTsNCj4gPiArCXNlcV9wcmludGYobSwgIlx0XHRwcmltYXJp
ZXM6IHIoJXUsJXUpIGcoJXUsJXUpIGIoJXUsJXUpDQo+IHdwKCV1LCV1KVxuIiwNCj4gPiArCQkg
ICBmcmFtZS0+ZGlzcGxheV9wcmltYXJpZXNbMF0ueCwgZnJhbWUtDQo+ID5kaXNwbGF5X3ByaW1h
cmllc1swXS55LA0KPiA+ICsJCSAgIGZyYW1lLT5kaXNwbGF5X3ByaW1hcmllc1sxXS54LCBmcmFt
ZS0NCj4gPmRpc3BsYXlfcHJpbWFyaWVzWzFdLnksDQo+ID4gKwkJICAgZnJhbWUtPmRpc3BsYXlf
cHJpbWFyaWVzWzJdLngsIGZyYW1lLQ0KPiA+ZGlzcGxheV9wcmltYXJpZXNbMl0ueSwNCj4gPiAr
CQkgICBmcmFtZS0+d2hpdGVfcG9pbnQueCwgZnJhbWUtPndoaXRlX3BvaW50LnkpOw0KPiA+ICsJ
c2VxX3ByaW50ZihtLCAiXHRcdG1hc3RlcmluZyBsdW1pbmFuY2U6IG1heCAldSwgbWluICV1XG4i
LA0KPiA+ICsJCSAgIGZyYW1lLT5tYXhfZGlzcGxheV9tYXN0ZXJpbmdfbHVtaW5hbmNlLA0KPiA+
ICsJCSAgIGZyYW1lLT5taW5fZGlzcGxheV9tYXN0ZXJpbmdfbHVtaW5hbmNlKTsNCj4gPiArCXNl
cV9wcmludGYobSwgIlx0XHRtYXhfY2xsOiAldSwgbWF4X2ZhbGw6ICV1XG4iLA0KPiA+ICsJCSAg
IGZyYW1lLT5tYXhfY2xsLCBmcmFtZS0+bWF4X2ZhbGwpOyB9DQo+ID4gKw0KPiA+ICBzdGF0aWMg
dm9pZCBpbnRlbF9jb25uZWN0b3JfaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sDQo+ID4gIAkJCQkg
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikgIHsgQEAgLQ0KPiAyNjQsNiArMzQ0LDcg
QEAgc3RhdGljDQo+ID4gdm9pZCBpbnRlbF9jb25uZWN0b3JfaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUg
Km0sDQo+ID4gIAlzZXFfcHJpbnRmKG0sICJcdHN1YnBpeGVsIG9yZGVyOiAlc1xuIiwNCj4gPiAg
CQkgICBkcm1fZ2V0X3N1YnBpeGVsX29yZGVyX25hbWUoY29ubmVjdG9yLQ0KPiA+ZGlzcGxheV9p
bmZvLnN1YnBpeGVsX29yZGVyKSk7DQo+ID4gIAlzZXFfcHJpbnRmKG0sICJcdENFQSByZXY6ICVk
XG4iLCBjb25uZWN0b3ItPmRpc3BsYXlfaW5mby5jZWFfcmV2KTsNCj4gPiArCWludGVsX2hkcl9z
aW5rX2luZm8obSwgY29ubmVjdG9yKTsNCj4gPg0KPiA+ICAJc3dpdGNoIChjb25uZWN0b3ItPmNv
bm5lY3Rvcl90eXBlKSB7DQo+ID4gIAljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9y
dDoNCj4gPiBAQCAtMjg4LDYgKzM2OSw3IEBAIHN0YXRpYyB2b2lkIGludGVsX2Nvbm5lY3Rvcl9p
bmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwNCj4gPiAgCWludGVsX2hkY3BfaW5mbyhtLCBpbnRlbF9j
b25uZWN0b3IpOw0KPiA+DQo+ID4gIAlzZXFfcHJpbnRmKG0sICJcdG1heCBicGM6ICV1XG4iLCBj
b25uZWN0b3ItPmRpc3BsYXlfaW5mby5icGMpOw0KPiA+ICsJaW50ZWxfaGRyX291dHB1dF9pbmZv
KG0sIGNvbm5lY3Rvcik7DQo+ID4NCj4gPiAgCWludGVsX3BhbmVsX2luZm8obSwgaW50ZWxfY29u
bmVjdG9yKTsNCj4gDQo+IC0tDQo+IEphbmkgTmlrdWxhLCBJbnRlbA0K
