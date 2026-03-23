Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583C1F483C6
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2D110E4F6;
	Mon, 23 Mar 2026 16:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmbpoNtC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D4810E4F6
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774282413; x=1805818413;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=GBoZRCZp2oYfrd8lYL9JAO1e1/7lZEJJbbgAxEMMbBU=;
 b=LmbpoNtC91EOMTOTbEQSWGVtFkdCU+6uwQPnMsNIUJsdNo7XhlReMQd+
 xSgtGrn1AYwttnj7brR7SAEs/gvxRlH5GcSiVq6WgQOPPejMnw67BeQoN
 i7AffY361fkMVRXftMUWtaz0tw47s/XcDdaIbL63n7gpYewUiF3CNhkG3
 mw/NTZZbNdvvQcg517kHPp/sLBFEmIgAjp/Y3cgYeLW29FXCajh2xetpO
 hqgoB+hRteTy85LYWSP6aZnOpEGvKt5r2Y0pgIHlJZlKpouDUrVcyoaJo
 wVKaMC7p55nUAHgJvcElmZXMfNPMS74ArmBQXAEZ3+2jiNTkYTB/RgN0h A==;
X-CSE-ConnectionGUID: aOtz2s7KTySQqe5N0rQqhA==
X-CSE-MsgGUID: LevzSs2/Qnyj2Y8oGpKdwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="85979758"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="85979758"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 09:13:32 -0700
X-CSE-ConnectionGUID: UUa8EzFbRIiHjSwBwHnlbw==
X-CSE-MsgGUID: PWA7+0X8RjWx/0Jvn1j65g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="224282970"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 09:13:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 09:13:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 09:13:31 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 09:13:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X40y2uoiCLI3o7WcSi5hnHrbqE9OWXaa8rjE58Gy1fcx2JgWSDfEpJNDiDme+2dAQMggtZhRVgLTo9rrGY9eqoeYQdJUkh0Ps7XMlWztWVu7Df5H4n9hf1mroESivOUw3OVYjUGlp02zNmiMlXN4dd0AsC+pvnIYe44btVSMzp6MLMc4BtFDn7BS91pAIZ/bIWSfD6stwNQhJHdOaCMQ1a0/G8sH+ZP0ZjU/xh7jlshvza2QTCiB3C0XB2MY678uNuZgFvJuuwsMc/G+Bm7AvVEUpyf+6lMfnwWgcPjjMp7fjlj5hcY43y+GhRyK1cZfpq/lpFJlZM/bWGGQaq6TsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBoZRCZp2oYfrd8lYL9JAO1e1/7lZEJJbbgAxEMMbBU=;
 b=Ej/04B5LqSmW1CSN4OYF3FqdTbM6UvsVzz1RzGUg2ZuqJcS4X5YVb+4MUbeKF0CjKzeEaWjfTngdRIZYtKsJrEeCPpVn+Jk82oMIa+Pz4OWqV22jyHsiGISTB7+TPdsMi2SpQT4Rp6mHZb5yQc4Kgf4pE+gY6wmWDGdCwodTy+VQwPct4Ucpi4TCSSpL88XhE1jMmphZ3zvY+aWZNgbKOo5mytfBzTCfKOe1ieyVzTfwoo+qjmMQzk6cuMyKJVHtLZ4rkBBn2TGNG053o9DwPUJYgAXVJiqN7/ezEKyAx0acHZK54QY/4ue0tFt1PiI9ezRF1wvOAs7qr+aDURczHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW4PR11MB5798.namprd11.prod.outlook.com (2603:10b6:303:185::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 16:13:28 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 16:13:28 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Skip media GT TLB invalidation when VM has no
 queues mapped
Thread-Topic: [PATCH] drm/xe: Skip media GT TLB invalidation when VM has no
 queues mapped
Thread-Index: AQHcrC/wQH2rmKaem0yHaBcUZ+4Qg7W8ZmsA
Date: Mon, 23 Mar 2026 16:13:28 +0000
Message-ID: <7f334028a55504b5f75f2fddd555a65107de2a49.camel@intel.com>
References: <20260304233728.926378-1-matthew.brost@intel.com>
In-Reply-To: <20260304233728.926378-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW4PR11MB5798:EE_
x-ms-office365-filtering-correlation-id: b5b01ece-2629-494e-d6f8-08de88f71ea6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: lHsYSavM8loaC73D4UrexRE3NL4LF2WpXwAUBtgGCw1Knx9AX4Zcc1pQjbsOuk8qUZ3prMx3MoW0eTfSzb7AVE6By4ePHQaU6Was6OwrBMEwXD6Vy5vroYDewMXik6wlI0o/2Tzi4AoNrKuTxnWk/upsCuY0RiVyMW8K/Svq+MR+U9ciZyeE20hvu7imQXDLllRote4NEL/crLzIhSz0NWyonW65wnVWxsELiN/w2WNdJd/O2iNG5zHItCpTqgPZk1LSHy1zcQd31pglgIqoa4NYb4CgmfYmc+2g9Q+ClN9n03S34+AAFTSg72PqhineVKSc8MBfRaFIWlwbNcrtVgaVzIfZTrysNJYgAlMBLHBDv47DsIrd+Ep/xbincJKzquNsCr42yTwhRWruGHHJyFyWhP0z69TYTzox7wwhW20v8fnXeV5gehsXQ1ArXL66U/BhDxucv74epr06jDDfRNwzuz4lFqSSDsiBbEVckywBQFio8j1ryFH1CpM+UvchnoJMwvMUJbiXuO4SHpRhshmj+U/IphcWRPB88yQuP6AcZ54r+ommyTzv93s4eYUKHxRQ5/2exMPKdBx3sXziGv20NAEfTcZjbHwyDZgGh1LAg/CRwkRd+I7bNvB/LSKs0TIPkqOu/xgdTVxKyBtsj2c+zc1V8MA5rZfY52GUk46DlxGZKVE4gu9a0QXqT7Le0ePIxjn2TYPG2iK44LGaeAPuvQ1J4NHr62lwjE0UxbjX/vrORNKE2D3I8e0gxG5yrk8TQyVTUrD7vC+7N5DSCZOJl03Iehx+tXMrPubihhw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1JLd3NjTUYxdkE4eCtKaHFTQUQ3eWNaMDBmSVZ6OXhpZENzNjlkME5TL3dR?=
 =?utf-8?B?S1JlbkRZQmxGU0k3UGl5MnQvNjJZVEN4VFlGbVFpaDVlRmo4M0RCQmpINHBG?=
 =?utf-8?B?cklsYlZPelQxUDlmSWV0ZDJzSTdJREF3d1ZGT2JGZEpTVzh2UnRSczFlcDRV?=
 =?utf-8?B?b0NURUg1V2MxUkFGdWZhbkpuRW83QWdhWDlzcW9EUmFleTVnZFI3SVBmVWNS?=
 =?utf-8?B?bjJScUdyWTgvNUFJblNldE9xY3QwZWpaVUw1TTh2Qjd5OVJJcENSSUpnUUh6?=
 =?utf-8?B?cmN5c3FFN1VtT3NMbEVkY1BLOHZsc25PZUdpSHFVanR2b3lmWHdFM2EyWHpO?=
 =?utf-8?B?N3M1RTQ1OU9mMU9teWdOQjd3WmxWN21VTXNIWTFCdWZoeUZncUlncjlpM3VB?=
 =?utf-8?B?UXJlZFJtVUFVMk9UaW5NZFlVbUg3TkdIT1RlRklFUzBsNHVBQ2xRRS9nY3F0?=
 =?utf-8?B?MlJadmdDZFFsWklDeEl1dDJjRytWSjZNQisyZkJqQ1pRdEpOVkM3S3R0eE5l?=
 =?utf-8?B?Z3htd285SGhKV1RxU3E0SmFWclBpeXpjRWhBOGJJRFR6UUh2MHhteEozQmZq?=
 =?utf-8?B?Mmd4S2w3TkRIVlBEZmFjN1luVnRSTXpDemZiQ3BHMUZ4cEdUSXV5Z3Q4ZUF6?=
 =?utf-8?B?aG1HZVUyREExVTFHRjZDYW1pWFF6UkhUWTE2VUl0VjJUdUtzQzA3c3RGakor?=
 =?utf-8?B?M1FMekZZUUZiVGxwYUh0dHlSUE5ZSjRjWnFCVGNMa2ZVUzI4SnYvbkZPOVlu?=
 =?utf-8?B?ZGg2aEdGNFM4dU94WEFQaVdlc0k2ZlJMRzU3YmpRQ1gzZHRZTmJHVjB4cVFP?=
 =?utf-8?B?UVFTVDNyYlZyWmlmK2h1QXRKZys0MDB4TFVDNVBHbG9abWdYUm5kK3VhbGVH?=
 =?utf-8?B?d21mNnlSd0tFUnRrWkhQRWRmK0pFczdVSU5hempPQmpUK0ZqMnN1a0FJQVA4?=
 =?utf-8?B?cFhkaUdNZlpveVJ1ZzRGU2dObk1XeWQ3MW92L2ZDdG1IVFZpKzc5Sm13Mk9L?=
 =?utf-8?B?TVByZkcxeGVkbERNcUdIdGlTYm5QTytuVEpkR09QQ3ZlTFVxS0MrRmZoY1Va?=
 =?utf-8?B?cWJFWWM0VHRXNE9LZUowaC9zQlZKclc5YzhPQ04vZGJyT3J0TXoxc2FZYVdm?=
 =?utf-8?B?QVhMVk9Bd3VzV3czbzN5MjFBNnk0dThicHpTMlVFT0tMMjVZeW1WQ2NnS0Jk?=
 =?utf-8?B?NmZkN3RrWUJPbVpVTDlPZW5TbkJzU0RieDQrM1MweURPZmRrcTNTZzRHQ0Q4?=
 =?utf-8?B?a3pxdmlZYW9iZHQ5bHVwd0k4cCtjTS9mZVpaNnp3a2JUWUhPSVlISVAyTkZM?=
 =?utf-8?B?NlJFWWpLN3IzRGV3SzVHZmI5c04zTWhEVlIwWXc2aXFMNVE2VE5Rdmx3SEhS?=
 =?utf-8?B?QWdsa2h4MnJLUC9BOHIvU0Zrc3M5RGpCNnVEM3d0bXFXUExEdjVtQThOSEZJ?=
 =?utf-8?B?dVJkZTFvNFByanJxSzBuUWpnMFd0OUdqQkE5V0I5RVlrVE96a2NBckJMMW5j?=
 =?utf-8?B?SllTVDhWQkZZbnUyak5QRTQ1bzQyT0F2RUs4djJtWmR5OStidFFQZThVWnJO?=
 =?utf-8?B?ZHZVSDBsbksrVURzclJNT3A2YnFuaXVQVTlXZzgwcXFKMm9kYno0MUJXdmFO?=
 =?utf-8?B?U2gycjBsUExMN1hMQ042bFQ3MVFTaHdnVmNQVFh5RmhsRGx4QlVOUm8wRHdX?=
 =?utf-8?B?V0FLVDdHTE84eVVxY2pWeUtnS1gvZzZjNko2UHd4SmtOWURKRThJby9XVU1t?=
 =?utf-8?B?WGZOZnVQaVpuMVdZMUFHN2hIcTNjOGdwTnV2WGloY2IrT3BMRytEdGRZaTY3?=
 =?utf-8?B?T25DNUtoMGZBUmZLQ1diWFViSUxGbnZqZ2lZKzJoK2VDdlhTVGpwU3NVd2o5?=
 =?utf-8?B?YktUdEw2bTFQQ3h0eWVYWDFETVdleUhVeUl3QnE1LzkxdHVvYzN3Sng4NTZy?=
 =?utf-8?B?eXpkaDYrdS9qakZyRlZlTS8rTGR4Mk1teTMray9xeXliMUJzbG5qOSttU0VJ?=
 =?utf-8?B?allIVTI2NXlNMzgvT3NsYktreHplSlJ3NnJzS3JkWlViaVFEUExvTksyVno3?=
 =?utf-8?B?YWgySlU3bnNMK2EyR1JJR09BMDdLeFd4QXc2VjVNaGRPTG40SDFHUE04TmU1?=
 =?utf-8?B?VWtPRFR0a21LdHF2STB0VTdjSHh3L3JJb2lycHNjTlJ6OFYwaDdYa0FZUlVx?=
 =?utf-8?B?cmpJeXY2dWMyQ0tvMERWaXUzOGJ5VmJHQjlGaGVTaWFPNUl2eUZQNEllWGtj?=
 =?utf-8?B?dmVORFZJL0NiQlNHNGJjbmVWT1VjWGlMcGExakQzZ3JBWEFWcnVFVWMxYkhF?=
 =?utf-8?B?ZS9WaVhFSkM4a1FjMWhETVo2ZWRORXFhUUFOS3RkVmZtSEYrSTRRMkZ0SmVC?=
 =?utf-8?Q?k9y4CTpxxEcJFL60=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F64FFB21718B74EABC4EFF3C40A0055@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ty7R3u4g8xpIgBx0arRZvfHYS343Az4AISZiV/OLSbt++A01vESUMiQksQc6ZIzVTeDttxw66i37IwPbdA05qctj8fA/mapK9Whan7RP0y80POjkfSugwC1SDFcArYugoJP2vGtTunW+TQhMb1eP8dxdgl4AfdQXXxWbtZQyf97OyN6RoMnGDGc5GXCUASRlit+refVRVt+W4lZVuNJ8bgjXyDGUbh8smiA0ohQKpsdPWhWkdt1hQB9odDqzi44Tqx8WDKIc90ChD9uMWJfv8HkOOoE5VoGqNtdgUHcvn53BQvZKgFL8GkCdW0dgTkAuz5yhm9dZDAgfzu6JJT1+Og==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b01ece-2629-494e-d6f8-08de88f71ea6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 16:13:28.5645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F/r0gRP1hYprb9R2lrideB4NpICqQ43tDZKg8HczkQ1cjIEWC/g9rcQI7l29Fteist8fNUZQzQbPU6UzLfCUrqI7v5uyKk+bb/tC+7xGgjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5798
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

T24gV2VkLCAyMDI2LTAzLTA0IGF0IDE1OjM3IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IElmIG5vIGV4ZWMgcXVldWVzIGZyb20gYSBWTSBhcmUgbWFwcGVkIG9uIHRoZSBtZWRpYSBHVCwg
aXNzdWluZyBhCj4gUFBHVFQgVExCIGludmFsaWRhdGlvbiBmb3IgdGhhdCBHVCByZXF1aXJlcyBh
biByYzYgd2FrZSB3aGljaCBpcwo+IGV4cGVuc2l2ZS4KPiAKPiBTa2lwIHRoZSBtZWRpYSBHVCBU
TEIgaW52YWxpZGF0aW9uIHdoZW4gdGhlIFZNIGhhcyBubyBleGVjIHF1ZXVlcwo+IG1hcHBlZCBv
biBpdC4gSWYgVExCIGludmFsaWRhdGlvbnMgYXJlIGFscmVhZHkgaW4tZmxpZ2h0IG9uIHRoYXQg
R1QKPiB3ZSBjYW4ndCBicmVhayBmZW5jZSBvcmRlcmluZywgc28gaXNzdWUgYSBkdW1teSBHR1RU
IGludmFsaWRhdGlvbgo+IGluc3RlYWQgdG8gbWFpbnRhaW4gc2Vxbm8gb3JkZXJpbmcuCj4gCj4g
VGhpcyBvcHRpbWl6YXRpb24gaXMgcGFydGljdWxhcmx5IGltcGFjdGZ1bCBmb3IgU1ZNIHdvcmts
b2FkcyB3aGljaAo+IG1heSBvciBtYXkgbm90IHVzZSB0aGUgbWVkaWEgR1QuIEF2ZXJhZ2UgVExC
IGludmFsaWRhdGlvbiB0aW1lIGRyb3BzCj4gZnJvbSB+NzV1cyB0byB+MTh1cyBpbiBzdWNoIGJl
bmNobWFya3MuCgpTby4uIHdoYXQgaWYgdGhlIHVzZXIgY3JlYXRlcyB0aGUgVk0sIGJpbmRzIGl0
LCBhbmQgb25seSB0aGVuIGNyZWF0ZXMKYW4gZXhlYyBxdWV1ZSBhbmQgc3VibWl0cz8KCi1TdHVh
cnQKCj4gCj4gQXNzaXN0ZWQtYnk6IEdpdEh1YiBDb3BpbG90OmNsYXVkZS1zb25uZXQtNC42ICMg
RG9jdW1lbnRhdGlvbiBvbmx5Lgo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRo
ZXcuYnJvc3RAaW50ZWwuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y190
bGJfaW52YWwuYyB8IDQzCj4gKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gwqAxIGZpbGUg
Y2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y190bGJfaW52YWwuYwo+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y190bGJfaW52YWwuYwo+IGluZGV4IGNlZDU4ZjQ2Zjg0Ni4uMjBjMzQ0Njlk
OWE1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3RsYl9pbnZhbC5jCj4gQEAgLTIwNSwx
NCArMjA1LDUzIEBAIHN0YXRpYyBpbnQgc2VuZF90bGJfaW52YWxfYXNpZF9wcGd0dChzdHJ1Y3QK
PiB4ZV90bGJfaW52YWwgKnRsYl9pbnZhbCwgdTMyIHNlcW5vLAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgZHJtX3N1YmFsbG9jICpwcmxfc2EpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVj
dCB4ZV9ndWMgKmd1YyA9IHRsYl9pbnZhbC0+cHJpdmF0ZTsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSA9IGd1Y190b194ZShndWMpOwo+ICvCoMKgwqDCoMKgwqDCoHN0cnVj
dCB4ZV9ndCAqZ3QgPSBndWNfdG9fZ3QoZ3VjKTsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVf
dm0gKnZtOwo+ICvCoMKgwqDCoMKgwqDCoGludCBlcnIgPSAwLCBpZCA9IGd1Y190b19ndChndWMp
LT5pbmZvLmlkOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGxvY2tkZXBfYXNzZXJ0X2hlbGQoJnRs
Yl9pbnZhbC0+c2Vxbm9fbG9jayk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGd1Y190b194
ZShndWMpLT5pbmZvLmZvcmNlX2V4ZWNsaXN0KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIC1FQ0FOQ0VMRUQ7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqByZXR1cm4gc2Vu
ZF90bGJfaW52YWxfcHBndHQoZ3VjLCBzZXFubywgc3RhcnQsIGVuZCwgYXNpZCwKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgWEVfR1VDX1RMQl9JTlZBTF9QQUdFX1NFTEVDVElWRSwKPiBwcmxfc2EpOwo+ICvCoMKg
wqDCoMKgwqDCoGlmICgheGVfZ3RfaXNfbWVkaWFfdHlwZShndCkpCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiBzZW5kX3RsYl9pbnZhbF9wcGd0dChndWMsIHNlcW5vLCBz
dGFydCwgZW5kLAo+IGFzaWQsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+IFhFX0dV
Q19UTEJfSU5WQUxfUEFHRV9TRUxFQ1RJVkUsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBwcmxfc2EpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqAvKiBUcnkgdG8gc2tpcCBtZWRpYSBHVCBU
TEIgaW52YWxpZGF0aW9ucyAqLwo+ICsKPiArwqDCoMKgwqDCoMKgwqB2bSA9IHhlX2RldmljZV9h
c2lkX3RvX3ZtKHhlLCBhc2lkKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoSVNfRVJSKHZtKSkKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIFBUUl9FUlIodm0pOwo+ICsKPiAr
wqDCoMKgwqDCoMKgwqBkb3duX3JlYWQoJnZtLT5leGVjX3F1ZXVlcy5sb2NrKTsKPiArCj4gK8Kg
wqDCoMKgwqDCoMKgaWYgKCF2bS0+ZXhlY19xdWV1ZXMuY291bnRbaWRdKSB7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAqIFdlIGNhbid0IGJyZWFrIGZlbmNlIG9yZGVyaW5nIGZvciBUTEIgaW52YWxpZGF0aW9uCj4g
am9icywgaWYKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogVExCIGludmFsaWRh
dGlvbnMgYXJlIGluZmxpZ2h0IGlzc3VlIGEgZHVtbXkKPiBpbnZhbGlkYXRpb24gdG8KPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogbWFpbnRhaW4gb3JkZXJpbmcuIE5vciBjYW4g
d2UgbW92ZSBzYWZlbHkgdGhlCj4gc2Vxbm9fcmVjdiB3aGVuCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqIHJldHVybmluZyAtRUNBTkNFTEVEIGlmIFRMQiBpbnZhbGlkYXRpb25z
IGFyZSBpbgo+IGZsaWdodC4gVXNlCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IEdHVFQgaW52YWxpZGF0aW9uIGFzIGR1bW15IGludmFsaWRhdGlvbiBnaXZlbiBBU0lECj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGludmFsaWRhdGlvbnMgYXJlIHVuc3VwcG9y
dGVkIGhlcmUuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoeGVfdGxiX2ludmFsX2lkbGUodGxiX2ludmFsKSkK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IC1F
Q0FOQ0VMRUQ7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVsc2UKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IHNlbmRfdGxiX2lu
dmFsX2dndHQodGxiX2ludmFsLCBzZXFubyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGdvdG8gZXJyX3VubG9jazsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKg
wqDCoGVyciA9IHNlbmRfdGxiX2ludmFsX3BwZ3R0KGd1Yywgc2Vxbm8sIHN0YXJ0LCBlbmQsIGFz
aWQsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBYRV9HVUNfVExCX0lOVkFMX1BBR0VfU0VMRUNUSVZFLAo+IHBybF9z
YSk7Cj4gKwo+ICtlcnJfdW5sb2NrOgo+ICvCoMKgwqDCoMKgwqDCoHVwX3JlYWQoJnZtLT5leGVj
X3F1ZXVlcy5sb2NrKTsKPiArwqDCoMKgwqDCoMKgwqB4ZV92bV9wdXQodm0pOwo+ICsKPiArwqDC
oMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+IMKgfQo+IMKgCj4gwqBzdGF0aWMgaW50IHNlbmRfdGxi
X2ludmFsX2N0eF9wcGd0dChzdHJ1Y3QgeGVfdGxiX2ludmFsICp0bGJfaW52YWwsCj4gdTMyIHNl
cW5vLAoK
