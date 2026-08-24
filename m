Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0138DC5DF94
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 07:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C9610E553;
	Mon, 24 Aug 2026 07:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ao2aEg5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E3E10E553
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 07:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787557501; x=1819093501;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=E4Znq3VktN1X7N7mNK9rAkZ+nFQ392RXKWlXdruTm/Y=;
 b=ao2aEg5VKEvqk5QPDANKBSe/3O2KvSZyhUQGdWgQ1yHH3hQ/v6rvVnfe
 9ereKuUj4xg++bKnnVmFmrq7+R2mocpaTtu0lT3xKjFWlqjX+NukqlR0l
 GhlaWoRtIZsxZDm0O79nWzeWZghESBYQ0Pfhs5IAqPucfrfEvg4rOMNhH
 uE6wLTH6eZmZDOW05JKYca8vuPLb+SwyWKZ9z36YdARki/oujBOPjz8Ri
 H0ge3Qh3vedS+onov4OfoSdATRckYOPuAziciXUyb+z+Shd1hrPVAbytm
 MnmxEulcYc9cKEsIxkrX9ngj2Th8jaFoVjuqoJG6ghd9ZUYgCv+gTLgWB A==;
X-CSE-ConnectionGUID: PLN3TY97SlypMbaUHxUEZA==
X-CSE-MsgGUID: mmNgZXYoTgSLhr/ISKiS6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91813473"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208,217";a="91813473"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 00:41:53 -0700
X-CSE-ConnectionGUID: pqxGMbVJTxOABRKBYLXASQ==
X-CSE-MsgGUID: 9uOqWbL0TziLMoQuq9a++Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
 d="scan'208,217";a="296833641"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 00:41:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 00:41:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 00:41:41 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 00:41:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PabbSDKiZSORAuifQOvkehDYAIOMJbF601z9MwASutPncnen8+paejtr90XtjakFHWOM2AJKUu6eYGKucgOYXzV/ApWLvD+XUue/0j+WgN1l1Gk3fH5Q52Oc4ncjxoS0cBFg58sNS+66FMkkgaTrn+CI6b+ua11PwI32dlHee3Ohpv/l1Y58FVv2gMCLpl7OmTrLworJHCj5ZNxlZa3/n53uylA+7rm4Fv1xzf/uZ5ScBrocOV8YzkleOHz+502KRINqybZoAFeslucuIlw6r72WyHeke16Q6Xlo1gBOFc8LymatQIUEINkg6jWPwWmVVwZRkG2HNkRpe62GzkcjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tq5wf2q1d0+rFco1HsteOvAaTQbgIr/jjf+h2F6RBJE=;
 b=boPIKNquEqzsEsTDcCfFfYqkyEecfFw+ReqpQlBvv5anbGkTQBVsvuhPgTcDNbWAf3LaA34OmHw6JtHzcbzQY1E4rLRkmbijoK3DpkeOGpKSmbRLjM71h8Jp+E8QYm32grL9IEVGBZKOxQE1ie4ZiOH0UqIzY3YZ/Kx6gIGCwncxb0Y/lktEZUoYURLZq5OMyfZcdNQrmC7dVetMXWKz65Stus+STFIh0KpaUScgTMRu4HzaXlRKsaxTIVmmE71MmksVuNZcWMyfBAYoGGiO0DmYtpK5/zTZJ2CMu22c5boU8d+A8KOpB+F2ueF4iBi4Eovomio/DQ6hckDEMcUASw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2597.namprd11.prod.outlook.com (2603:10b6:a02:c0::17)
 by SA2PR11MB4889.namprd11.prod.outlook.com (2603:10b6:806:110::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 06:59:00 +0000
Received: from BYAPR11MB2597.namprd11.prod.outlook.com
 ([fe80::2e8d:a84e:8eba:e732]) by BYAPR11MB2597.namprd11.prod.outlook.com
 ([fe80::2e8d:a84e:8eba:e732%6]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 06:59:00 +0000
From: "Hazubski, Filip" <filip.hazubski@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe: Add up-to-date implementation for
 Wa_14026539277
Thread-Topic: [PATCH v3 3/3] drm/xe: Add up-to-date implementation for
 Wa_14026539277
Thread-Index: AQHdMbVB9F3x+3l8AUml8nKYNI7LV7apCJkAgAO/73g=
Date: Mon, 24 Aug 2026 06:59:00 +0000
Message-ID: <BYAPR11MB2597185890315624024390B18EA02@BYAPR11MB2597.namprd11.prod.outlook.com>
References: <20260821-wa_14026539277-v3-0-1f98c2af12f6@intel.com>
 <20260821-wa_14026539277-v3-3-1f98c2af12f6@intel.com>
 <874ignduav.fsf@intel.com>
In-Reply-To: <874ignduav.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2597:EE_|SA2PR11MB4889:EE_
x-ms-office365-filtering-correlation-id: 62fd5561-b9ad-4a25-5736-08df01ad2cd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|38070700021|6133799003|3023799007|10067099003|56012099006|11063799006|4143699003|8096899003|22082099003|18002099003;
x-microsoft-antispam-message-info: MCBinqrtbhcmMsU4ABOD7dHwfuV3IQ8yKaYmm+Bg87Lod4H+4Vkkmv6pmtdnIWNNC2KZ4Xd6u0f6LZI9LITEFwLnTOQGHLTleb7MA9SccjjSKvKLezsgJRYaugaVnimvh/+9z2XTRbQje/geSZlWKs7g1jsvOeJse9BclBjj+UvIbFw0ikduxIAZbnaRhWClI0oYdD/rBjiH1eLHMPpK2Q0RshjXrnJ1TnPF56WlXBtz6KO3j/codWYKndU16bJzyjJ1Cs8gg3ZyvOgXUeo5epcWn0b7mqtLskqA8bK4gglZjpS/ycK1txoSxWdmHaAKSpEzFVoq847uQyxH+xLPYCI+2/DvdGqmAorOjRK8CH1d959Y8HFnHybUrR0nheNo69lBzc5HNlAPlQwyLE2qAhyrQYirUW0p1SNLYkG4Su5RIxf5wawXRmGjHbFpPwjWl/mFEIkNx0rNiioXcXpfbtfYEohSWjXXbVsm7FmV9kSMCJuLkbd+So2iALmgLwsBgBGKTdQshYZo2whW31AmFEh/NPPcWRyt5bFXeSzbJAJKUM3DePjv8M8vRBdJrDklcZ0H5zU2ixreUIci2jhOwZYJrDlZHTYwEoIQSNNurxSHuuGGO6hKvYP4bK28KlN34OYqiKHE30kDour4ZmrX3zjmSh9RdfQxrNiEOziT1d6WHErweY0OLna7xBNl6GGOu7Z5/ulZhp5Wb1j8IYluOTUM0cUG6CPtoDL5DcnNzjQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2597.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003)(8096899003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?g9MS4bq7XjB9yrCVPpmorUlTERvbhRnXzGwN7A/iQ+YQPdofmR+2h9XM9D?=
 =?iso-8859-1?Q?PXZFyF3krzCSiF/pCrZA7QJEp+Av+Qvjtg6x3erRIDVoyX37OQANawGkF8?=
 =?iso-8859-1?Q?A79a378nlZtf89mFZPbW+tLy6cTxastCwdo3kmxkTKQ4GjyNqJo4iVQ1s4?=
 =?iso-8859-1?Q?YCE/KczYAOCQlQ93KYEDG7EuJIAyr9VBKGbrnfc0kNYGZbO+L/qyMDEVUg?=
 =?iso-8859-1?Q?3LSxxmsueV8bPR4MnVyAVdDMZDocg7w+VEOinX+IY38SmlZks6ZgvEzuyX?=
 =?iso-8859-1?Q?yEoSBGd+fWZzHfGhZA+Rjoehf8vgWus09rROg84SQBfCWqONziT/y2P9x3?=
 =?iso-8859-1?Q?j0QbtKFoSphysX8Hgs7HcopfQIgh0RcxPwPk1V7kZxCTSxL6KN8ywnmDOx?=
 =?iso-8859-1?Q?czKMvrIEooOl+5PZYq5URn+SuWSe9fPNoH9WsIl84FVfxUnQQ+A4Rbr4k+?=
 =?iso-8859-1?Q?aI2CC7I8Kg81q81bDouMv5ecpaQhdLedmDBDWb3++qjX210pPMEf8/FtlB?=
 =?iso-8859-1?Q?8bK7WEo9oH8VJBh77bl4nCiwpRMROV3oNmtzSzBwwT2RZCCy5lSwUiXebV?=
 =?iso-8859-1?Q?ROxP0XjUIASiSYSqrNzScOky3bvcnoDZAGGRuqk0x4iYTAGef4VACmE84a?=
 =?iso-8859-1?Q?oe/gNJakVSoeqAONIDFZskaEW9DmSU7goAIb9b7rn2dcQ6d+WKlDirwiMF?=
 =?iso-8859-1?Q?OSPOoAwv50O35RX2nYGNADLzO7H+6M1cIHPN3GIq2jcMMBtb11qur1IXP1?=
 =?iso-8859-1?Q?reADqYYpHPzvENMHY0cMEXALsyy2uymIp//ZvGrZxA5T0FEps3BnA/3z4g?=
 =?iso-8859-1?Q?ksb4cb9pfOvE8DWYoRySX7oVOBiQZ/220v72Yoc2Hz9jV+l7hORwbW/81s?=
 =?iso-8859-1?Q?r3bHs7bSYlnzT7GV/fHTU2m98jeSv2X+HjFFUAYJNLC44L6Wnc/RSf/XEh?=
 =?iso-8859-1?Q?RKAySSQn/NbOiviYneKn3FQyZxmXYHHXRAgdVcyjCYUglFnOz62UL3aF1C?=
 =?iso-8859-1?Q?/aY9rVa+bwhsXGLKli9LCcxmvGg/VfVrzdt1A/PgJU8+DR8M6nqsgfgMOF?=
 =?iso-8859-1?Q?zyblcfduSycGPDCgL4g313BDA5gBL9nID8kTKPy/OQuK9gZFXWI5R6n25l?=
 =?iso-8859-1?Q?1Cr51L1zbW/t7QRZKfj0YsAjaQZPD8b5PNjhzoaCFH9Qr+sHoA03zfXfJr?=
 =?iso-8859-1?Q?a4dQGZx69dT/PJSiL28tQFyISSDaW1y6qDkAzdDbdMYVovLEeZP2F45cCy?=
 =?iso-8859-1?Q?8dhzb2/SpAGrhu9mmvkRllDx7vBBAsAAwawunPELUUlh+08AHGmRy1M5Kn?=
 =?iso-8859-1?Q?quAgaZqVxRnj1V8FuGVKSxt5TP5IXKuZ0LA0hqQvVyjk6d14JVFcYza0yd?=
 =?iso-8859-1?Q?QsoLtRtxVgWg36DRezVewSzl5/lhGTK3hkkOKKFUdJuXUEMN2kTjYVJsKx?=
 =?iso-8859-1?Q?5Z6x4Wx3YY/wvTZXLH48se18lUQa52iXM79gLaEnODiN7iZPuE7JPCv2ss?=
 =?iso-8859-1?Q?0jGTwAIrh08mffuKC801HMbyr67QHw1cCIT46+Tbg6FbGmOskGsiJIhTjx?=
 =?iso-8859-1?Q?aYncHikPAeH6wWC9nZnLli1QZ5CvPUN+S35lxWdsZqRflLe9WgcOwhLAO4?=
 =?iso-8859-1?Q?TzKnYgssvEotAb+05YOdneRPHhZ5uYro74eYE7CFTqg+1CaLJfkq1HKxk0?=
 =?iso-8859-1?Q?UKiMZUJrUzc9/P19wn/NAnKiv8IMmlYxxyds5qHS9TqikwrSg8F8N1W88Q?=
 =?iso-8859-1?Q?xsTam9D0V+NOjBoRuysN3GHqnzgPAq8sJLBJbnnZsH6TwsfjQTXcdzJ1CL?=
 =?iso-8859-1?Q?Fedb7ESQ3A=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2597185890315624024390B18EA02BYAPR11MB2597namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: z/ql5G3mr3/3jJSYzjUQh6ampLYtTrfsMFPZ/85G3+78jUseEQi2mh8pd8cY1btZ1mXgw8HWcIv3nIWwaYVEvaZPPYOWoNofQhT9adpUODMB0uqoypZZgZeCKCJOnNsJxGwu0Ut5wKAZ2dkr9Cl55Xd4OmWe9tHQjen2T3x7MJXMaUdpAYe0kzv9RapFanwgMTTb1iAet6uVRkXXL2nMglyrS4TqJFXiCM8POOxSQgA8MLm/6EHEcDjaFXUIoveTaXH9xiYhzL7YH+sRkZLTLTd+JdpozD1kulDz8JW3GyN6oZRM8uNo6B8/La2ApDnDokMmfdKtBeLiAx1wOE7RFA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2597.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62fd5561-b9ad-4a25-5736-08df01ad2cd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 06:59:00.2628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: onuP3W3uz7OjrNTwWLj0XUDXPMzCylEUR71Ctxi2xXW4RMaanCritePQVwuJKd8Y9UdlRa0B4oDVwRVO1vX6lMhkfuNi5Cw4et4SH608QZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4889
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

--_000_BYAPR11MB2597185890315624024390B18EA02BYAPR11MB2597namp_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ack from Compute side.

Filip

________________________________
From: Sousa, Gustavo <gustavo.sousa@intel.com>
Sent: Friday, August 21, 2026 11:42 PM
To: Souza, Jose <jose.souza@intel.com>; Hazubski, Filip <filip.hazubski@int=
el.com>
Cc: intel-xe@lists.freedesktop.org <intel-xe@lists.freedesktop.org>; Auld, =
Matthew <matthew.auld@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe: Add up-to-date implementation for Wa_14=
026539277

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> Wa_14026539277 is a temporary workaround that targets only A*
> steppings of graphics version 35.10 and requires that we avoid using
> 2-way coherency for device-cacheable memory accesses.  For
> driver-internal usage, we convert those configurations to be
> device-uncached and 1-way-coherent; on the UAPI side, we reject
> VM_BIND/MADVISE calls that are 2-way-coherent and leave it up to
> userspace to select the alternative option that is most appropriate to
> their usage.
>
> v2:
>   - Add missing bits to convert the PAT value to device-uncacheable in
>     wa_14026539277_fixup_pat_value(). (Sashiko)
>   - Also validate the PAT index in the DRM_XE_VM_MADVISE
>     ioctl. (Sashiko)
>   - Match against the graphics IP instead of the platform.
> v3:
>   - Handle any 2-way-coherent PAT index irrespective of L3 cache
>     policy, because L3 UC can be promoted to cached by MOCS. (Matt)
>
> Cc: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> Cc: Filip Hazubski <filip.hazubski@intel.com>

Jos=E9 and Filip, I would like to request new acks for this patch, because
now it rejects any 2-way-coherent PAT index, not only those that are
device-cacheable.

--
Gustavo Sousa

> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.h        | 10 ++++++
>  drivers/gpu/drm/xe/xe_device.c     | 16 ++++++----
>  drivers/gpu/drm/xe/xe_pat.c        | 64 ++++++++++++++++++++++++++++++++=
++----
>  drivers/gpu/drm/xe/xe_vm.c         |  5 +++
>  drivers/gpu/drm/xe/xe_vm_madvise.c |  3 ++
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>  6 files changed, 87 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 7060f66e1d63..10374022f1d2 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -82,6 +82,16 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe, u1=
6 pat_index);
>   */
>  u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index);
>
> +/**
> + * xe_pat_wa_14026539277_reserved - Is this PAT index reserved from
> + * use due to Wa_14026539277?
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + *
> + * Return: a boolean indicating whether the PAT index is reserved or not.
> + */
> +bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index);
> +
>  #define xe_cache_pat_idx(xe, cache_mode) ({                             =
     \
>        const struct xe_device *__xedev =3D (xe);                         =
        \
>        enum xe_cache_level __mode =3D (cache_mode);                      =
        \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index ccf7ef3cf3e7..516da74b542f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -847,14 +847,18 @@ static void override_has_cached_pt(struct xe_device=
 *xe)
>        struct xe_gt *gt;
>        u8 id;
>
> -     /*
> -      * Wa_16029380221: The affected GT will always use non-coherent
> -      * access to page tables, so we must do uncached writes from the
> -      * CPU.
> -      */
> -     for_each_gt(gt, xe, id)
> +     for_each_gt(gt, xe, id) {
> +             /*
> +              * Wa_16029380221: The affected GT will always use
> +              * non-coherent access to page tables, so we must do
> +              * uncached writes from the CPU.
> +              */
>                if (XE_GT_WA(gt, 16029380221))
>                        xe->info.has_cached_pt =3D false;
> +
> +             if (XE_GT_WA(gt, 14026539277))
> +                     xe->info.has_cached_pt =3D false;
> +     }
>  }
>
>  static int probe_has_flat_ccs(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index a5fe1beec652..66378128377c 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -313,6 +313,40 @@ u16 xe_pat_index_get_l3_policy(struct xe_device *xe,=
 u16 pat_index)
>        return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value=
);
>  }
>
> +bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)
> +{
> +     struct xe_gt *gt;
> +     u8 id;
> +     bool has_wa =3D false;
> +
> +     for_each_gt(gt, xe, id) {
> +             if (XE_GT_WA(gt, 14026539277)) {
> +                     has_wa =3D true;
> +                     break;
> +             }
> +     }
> +
> +     /*
> +      * Disallow 2-way coherency for any L3 cache policy because
> +      * XE_L3_POLICY_UC could still be promoted to a cached policy
> +      * by MOCS indices.
> +      */
> +     return has_wa && xe_pat_index_get_coh_mode(xe, pat_index) =3D=3D XE=
_COH_2WAY;
> +}
> +
> +static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value)
> +{
> +     if (XE_GT_WA(gt, 14026539277)) {
> +             if (REG_FIELD_GET(XE2_COH_MODE, value) =3D=3D XE_COH_2WAY) {
> +                     value &=3D ~(XE2_L3_POLICY | XE2_COH_MODE);
> +                     value |=3D REG_FIELD_PREP(XE2_L3_POLICY, XE_L3_POLI=
CY_UC) |
> +                              REG_FIELD_PREP(XE2_COH_MODE, XE_COH_1WAY);
> +             }
> +     }
> +
> +     return value;
> +}
> +
>  static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
>  {
>        struct xe_device *xe =3D gt_to_xe(gt);
> @@ -373,18 +407,22 @@ static void program_pat_mcr(struct xe_gt *gt, const=
 struct xe_pat_table_entry ta
>
>        for (int i =3D 0; i < n_entries; i++) {
>                struct xe_reg_mcr reg_mcr =3D XE_REG_MCR(_PAT_INDEX(i));
> +             u32 pat =3D wa_14026539277_fixup_pat_value(gt, table[i].val=
ue);
>
> -             xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
> +             xe_gt_mcr_multicast_write(gt, reg_mcr, pat);
>        }
>
>        if (xe->pat.pat_ats)
> -             xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe->pat=
.pat_ats->value);
> +             xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS),
> +                                       wa_14026539277_fixup_pat_value(gt=
, xe->pat.pat_ats->value));
>
>        if (pta_entry)
> -             xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), pta_ent=
ry->value);
> +             xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA),
> +                                       wa_14026539277_fixup_pat_value(gt=
, pta_entry->value));
>
>        if (tr_pta_entry)
> -             xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA), tr_p=
ta_entry->value);
> +             xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA),
> +                                       wa_14026539277_fixup_pat_value(gt=
, tr_pta_entry->value));
>  }
>
>  static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
> @@ -534,13 +572,16 @@ static int xe2_dump(struct xe_gt *gt, struct drm_pr=
inter *p)
>        drm_printf(p, "PAT table: (* =3D reserved entry)\n");
>
>        for (i =3D 0; i < xe->pat.n_entries; i++) {
> +             bool rsvd =3D !xe->pat.table[i].valid ||
> +                         xe_pat_wa_14026539277_reserved(xe, i);
> +
>                if (xe_gt_is_media_type(gt))
>                        pat =3D xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDE=
X(i)));
>                else
>                        pat =3D xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(=
_PAT_INDEX(i)));
>
>                xe_pat_index_label(label, sizeof(label), i);
> -             xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].va=
lid);
> +             xe->pat.ops->entry_dump(p, label, pat, rsvd);
>        }
>
>        /*
> @@ -747,9 +788,14 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct d=
rm_printer *p)
>        for (u32 i =3D 0; i < xe->pat.n_entries; i++) {
>                u32 pat =3D xe->pat.table[i].value;
>
> +             pat =3D wa_14026539277_fixup_pat_value(gt, pat);
> +
>                if (GRAPHICS_VER(xe) >=3D 20) {
> +                     bool rsvd =3D !xe->pat.table[i].valid ||
> +                                 xe_pat_wa_14026539277_reserved(xe, i);
> +
>                        xe_pat_index_label(label, sizeof(label), i);
> -                     xe->pat.ops->entry_dump(p, label, pat, !xe->pat.tab=
le[i].valid);
> +                     xe->pat.ops->entry_dump(p, label, pat, rsvd);
>                } else if (xe->info.platform =3D=3D XE_METEORLAKE) {
>                        xelpg_pat_entry_dump(p, i, pat);
>                } else if (xe->info.platform =3D=3D XE_PVC) {
> @@ -764,6 +810,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct dr=
m_printer *p)
>        if (pta_entry) {
>                u32 pat =3D pta_entry->value;
>
> +             pat =3D wa_14026539277_fixup_pat_value(gt, pat);
> +
>                drm_printf(p, "Page Table Access:\n");
>                xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
>        }
> @@ -771,6 +819,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct dr=
m_printer *p)
>        if (tr_pta_entry) {
>                u32 pat =3D tr_pta_entry->value;
>
> +             pat =3D wa_14026539277_fixup_pat_value(gt, pat);
> +
>                drm_printf(p, "TRTT Page Table Access:\n");
>                xe->pat.ops->entry_dump(p, "TR_PTA_MODE", pat, false);
>        }
> @@ -778,6 +828,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct dr=
m_printer *p)
>        if (xe->pat.pat_ats) {
>                u32 pat =3D xe->pat.pat_ats->value;
>
> +             pat =3D wa_14026539277_fixup_pat_value(gt, pat);
> +
>                drm_printf(p, "PCIe ATS/PASID:\n");
>                xe->pat.ops->entry_dump(p, "PAT_ATS ", pat, false);
>        }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 19b3d0be7928..92a1d5098aac 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3829,6 +3829,11 @@ static int vm_bind_ioctl_check_args(struct xe_devi=
ce *xe, struct xe_vm *vm,
>                        goto free_bind_ops;
>                }
>
> +             if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat=
_index))) {
> +                     err =3D -EINVAL;
> +                     goto free_bind_ops;
> +             }
> +
>                if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
>                    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
>                    XE_IOCTL_DBG(xe, obj && (is_null || is_cpu_addr_mirror=
)) ||
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_v=
m_madvise.c
> index 0474768a38aa..265273294756 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -500,6 +500,9 @@ static bool check_pat_args_are_sane(struct xe_device =
*xe,
>        u16 coh_mode =3D xe_pat_index_get_coh_mode(xe, pat_index);
>        int i;
>
> +     if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat_index)))
> +             return false;
> +
>        /*
>         * Using coh_none with CPU cached buffers is not allowed on iGPU.
>         * On iGPU the GPU shares the LLC with the CPU, so with coh_none
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_w=
a_oob.rules
> index dd69ad07f7a9..46290d039fa8 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -71,4 +71,5 @@
>                GRAPHICS_VERSION(3511)
>  16029897822  MEDIA_VERSION(3500)
>                GRAPHICS_VERSION(3510)
> +14026539277  GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
>  14027054324  GRAPHICS_VERSION(3511)
>
> --
> 2.55.0
---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu usta=
wy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w trans=
akcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by others is strictly prohibited.

--_000_BYAPR11MB2597185890315624024390B18EA02BYAPR11MB2597namp_
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Ack from Compute side.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Filip</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Sousa, Gustavo &lt;gustavo.sousa@intel.com&gt;<br>
<b>Sent:</b> Friday, August 21, 2026 11:42 PM<br>
<b>To:</b> Souza, Jose &lt;jose.souza@intel.com&gt;; Hazubski, Filip &lt;fi=
lip.hazubski@intel.com&gt;<br>
<b>Cc:</b> intel-xe@lists.freedesktop.org &lt;intel-xe@lists.freedesktop.or=
g&gt;; Auld, Matthew &lt;matthew.auld@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH v3 3/3] drm/xe: Add up-to-date implementation fo=
r Wa_14026539277
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">Gustavo Sousa &lt;gustavo.sousa@intel.com&g=
t; writes:<br>
<br>
&gt; Wa_14026539277 is a temporary workaround that targets only A*<br>
&gt; steppings of graphics version 35.10 and requires that we avoid using<b=
r>
&gt; 2-way coherency for device-cacheable memory accesses.&nbsp; For<br>
&gt; driver-internal usage, we convert those configurations to be<br>
&gt; device-uncached and 1-way-coherent; on the UAPI side, we reject<br>
&gt; VM_BIND/MADVISE calls that are 2-way-coherent and leave it up to<br>
&gt; userspace to select the alternative option that is most appropriate to=
<br>
&gt; their usage.<br>
&gt;<br>
&gt; v2:<br>
&gt;&nbsp;&nbsp; - Add missing bits to convert the PAT value to device-unca=
cheable in<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; wa_14026539277_fixup_pat_value(). (Sashiko)<br>
&gt;&nbsp;&nbsp; - Also validate the PAT index in the DRM_XE_VM_MADVISE<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; ioctl. (Sashiko)<br>
&gt;&nbsp;&nbsp; - Match against the graphics IP instead of the platform.<b=
r>
&gt; v3:<br>
&gt;&nbsp;&nbsp; - Handle any 2-way-coherent PAT index irrespective of L3 c=
ache<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; policy, because L3 UC can be promoted to cache=
d by MOCS. (Matt)<br>
&gt;<br>
&gt; Cc: Jos=E9 Roberto de Souza &lt;jose.souza@intel.com&gt;<br>
&gt; Cc: Filip Hazubski &lt;filip.hazubski@intel.com&gt;<br>
<br>
Jos=E9 and Filip, I would like to request new acks for this patch, because<=
br>
now it rejects any 2-way-coherent PAT index, not only those that are<br>
device-cacheable.<br>
<br>
--<br>
Gustavo Sousa<br>
<br>
&gt; Reviewed-by: Matthew Auld &lt;matthew.auld@intel.com&gt;<br>
&gt; Signed-off-by: Gustavo Sousa &lt;gustavo.sousa@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/xe/xe_pat.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; | 10 ++++++<br>
&gt;&nbsp; drivers/gpu/drm/xe/xe_device.c&nbsp;&nbsp;&nbsp;&nbsp; | 16 ++++=
++----<br>
&gt;&nbsp; drivers/gpu/drm/xe/xe_pat.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; | 64 ++++++++++++++++++++++++++++++++++----<br>
&gt;&nbsp; drivers/gpu/drm/xe/xe_vm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |&nbsp; 5 +++<br>
&gt;&nbsp; drivers/gpu/drm/xe/xe_vm_madvise.c |&nbsp; 3 ++<br>
&gt;&nbsp; drivers/gpu/drm/xe/xe_wa_oob.rules |&nbsp; 1 +<br>
&gt;&nbsp; 6 files changed, 87 insertions(+), 12 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h=
<br>
&gt; index 7060f66e1d63..10374022f1d2 100644<br>
&gt; --- a/drivers/gpu/drm/xe/xe_pat.h<br>
&gt; +++ b/drivers/gpu/drm/xe/xe_pat.h<br>
&gt; @@ -82,6 +82,16 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe,=
 u16 pat_index);<br>
&gt;&nbsp;&nbsp; */<br>
&gt;&nbsp; u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_ind=
ex);<br>
&gt;&nbsp;<br>
&gt; +/**<br>
&gt; + * xe_pat_wa_14026539277_reserved - Is this PAT index reserved from<b=
r>
&gt; + * use due to Wa_14026539277?<br>
&gt; + * @xe: xe device<br>
&gt; + * @pat_index: The pat_index to query<br>
&gt; + *<br>
&gt; + * Return: a boolean indicating whether the PAT index is reserved or =
not.<br>
&gt; + */<br>
&gt; +bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_ind=
ex);<br>
&gt; +<br>
&gt;&nbsp; #define xe_cache_pat_idx(xe, cache_mode) ({&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct xe_device *__xe=
dev =3D (xe);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum xe_cache_level __mode =
=3D (cache_mode);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_de=
vice.c<br>
&gt; index ccf7ef3cf3e7..516da74b542f 100644<br>
&gt; --- a/drivers/gpu/drm/xe/xe_device.c<br>
&gt; +++ b/drivers/gpu/drm/xe/xe_device.c<br>
&gt; @@ -847,14 +847,18 @@ static void override_has_cached_pt(struct xe_dev=
ice *xe)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_gt *gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 id;<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Wa_16029380221: The affected GT will=
 always use non-coherent<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * access to page tables, so we must do=
 uncached writes from the<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * CPU.<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; for_each_gt(gt, xe, id)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for_each_gt(gt, xe, id) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * Wa_16029380221: The affected GT will always use<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * non-coherent access to page tables, so we must do<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * uncached writes from the CPU.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (XE_GT_WA(gt, 16029380221))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;=
info.has_cached_pt =3D false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (XE_GT_WA(gt, 14026539277))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;info.has_cached_=
pt =3D false;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt;&nbsp; static int probe_has_flat_ccs(struct xe_device *xe)<br>
&gt; diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c=
<br>
&gt; index a5fe1beec652..66378128377c 100644<br>
&gt; --- a/drivers/gpu/drm/xe/xe_pat.c<br>
&gt; +++ b/drivers/gpu/drm/xe/xe_pat.c<br>
&gt; @@ -313,6 +313,40 @@ u16 xe_pat_index_get_l3_policy(struct xe_device *=
xe, u16 pat_index)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return REG_FIELD_GET(XE2_L3_=
POLICY, xe-&gt;pat.table[pat_index].value);<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_ind=
ex)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct xe_gt *gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool has_wa =3D false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for_each_gt(gt, xe, id) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (XE_GT_WA(gt, 14026539277)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; has_wa =3D true;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Disallow 2-way coherency for any L3 =
cache policy because<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * XE_L3_POLICY_UC could still be promo=
ted to a cached policy<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * by MOCS indices.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return has_wa &amp;&amp; xe_pat_index_get_co=
h_mode(xe, pat_index) =3D=3D XE_COH_2WAY;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value=
)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (XE_GT_WA(gt, 14026539277)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (REG_FIELD_GET(XE2_COH_MODE, value) =3D=3D XE_COH_2WAY) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value &amp;=3D ~(XE2_L3=
_POLICY | XE2_COH_MODE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value |=3D REG_FIELD_PR=
EP(XE2_L3_POLICY, XE_L3_POLICY_UC) |<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_FIELD_PREP(XE2_COH_MODE, XE_COH_1WAY);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return value;<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; static const struct xe_pat_table_entry *gt_pta_entry(struct xe_g=
t *gt)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_device *xe =3D gt_=
to_xe(gt);<br>
&gt; @@ -373,18 +407,22 @@ static void program_pat_mcr(struct xe_gt *gt, co=
nst struct xe_pat_table_entry ta<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; n_e=
ntries; i++) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; struct xe_reg_mcr reg_mcr =3D XE_REG_MCR(_PAT_INDEX(i))=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; u32 pat =3D wa_14026539277_fixup_pat_value(gt, table[i].value);<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; xe_gt_mcr_multicast_write(gt, reg_mcr, pat);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe-&gt;pat.pat_ats)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe-&gt;pat.pat_ats-=
&gt;value);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; wa_14026539277_fixup_pat_value(gt, xe-&gt;pat.pat_ats-&gt;value))=
;<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pta_entry)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), pta_entry-&gt;value=
);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; wa_14026539277_fixup_pat_value(gt, pta_entry-&gt;value));<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tr_pta_entry)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA), tr_pta_entry-&gt=
;value);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; wa_14026539277_fixup_pat_value(gt, tr_pta_entry-&gt;value));<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt;&nbsp; static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)<br>
&gt; @@ -534,13 +572,16 @@ static int xe2_dump(struct xe_gt *gt, struct drm=
_printer *p)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;PAT tabl=
e: (* =3D reserved entry)\n&quot;);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; xe-&gt;=
pat.n_entries; i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bool rsvd =3D !xe-&gt;pat.table[i].valid ||<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 xe_pat_wa_14026539277_reserved(xe, i);<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (xe_gt_is_media_type(gt))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pat =3D=
 xe_mmio_read32(&amp;gt-&gt;mmio, XE_REG(_PAT_INDEX(i)));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; else<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pat =3D=
 xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; xe_pat_index_label(label, sizeof(label), i);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; xe-&gt;pat.ops-&gt;entry_dump(p, label, pat, !xe-&gt;pat.table[i].valid=
);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; xe-&gt;pat.ops-&gt;entry_dump(p, label, pat, rsvd);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; @@ -747,9 +788,14 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struc=
t drm_printer *p)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (u32 i =3D 0; i &lt; xe-=
&gt;pat.n_entries; i++) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; u32 pat =3D xe-&gt;pat.table[i].value;<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pat =3D wa_14026539277_fixup_pat_value(gt, pat);<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (GRAPHICS_VER(xe) &gt;=3D 20) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool rsvd =3D !xe-&gt;p=
at.table[i].valid ||<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_pat_wa_14026539277_rese=
rved(xe, i);<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_pat_=
index_label(label, sizeof(label), i);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;pat.ops-&gt;entr=
y_dump(p, label, pat, !xe-&gt;pat.table[i].valid);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;pat.ops-&gt;entr=
y_dump(p, label, pat, rsvd);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; } else if (xe-&gt;info.platform =3D=3D XE_METEORLAKE) {=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xelpg_p=
at_entry_dump(p, i, pat);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; } else if (xe-&gt;info.platform =3D=3D XE_PVC) {<br>
&gt; @@ -764,6 +810,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct=
 drm_printer *p)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pta_entry) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; u32 pat =3D pta_entry-&gt;value;<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pat =3D wa_14026539277_fixup_pat_value(gt, pat);<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;Page Table Access:\n&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; xe-&gt;pat.ops-&gt;entry_dump(p, &quot;PTA_MODE&quot;, =
pat, false);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; @@ -771,6 +819,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct=
 drm_printer *p)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tr_pta_entry) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; u32 pat =3D tr_pta_entry-&gt;value;<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pat =3D wa_14026539277_fixup_pat_value(gt, pat);<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;TRTT Page Table Access:\n&quot;);<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; xe-&gt;pat.ops-&gt;entry_dump(p, &quot;TR_PTA_MODE&quot=
;, pat, false);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; @@ -778,6 +828,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct=
 drm_printer *p)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe-&gt;pat.pat_ats) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; u32 pat =3D xe-&gt;pat.pat_ats-&gt;value;<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pat =3D wa_14026539277_fixup_pat_value(gt, pat);<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;PCIe ATS/PASID:\n&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; xe-&gt;pat.ops-&gt;entry_dump(p, &quot;PAT_ATS &quot;, =
pat, false);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c<b=
r>
&gt; index 19b3d0be7928..92a1d5098aac 100644<br>
&gt; --- a/drivers/gpu/drm/xe/xe_vm.c<br>
&gt; +++ b/drivers/gpu/drm/xe/xe_vm.c<br>
&gt; @@ -3829,6 +3829,11 @@ static int vm_bind_ioctl_check_args(struct xe_d=
evice *xe, struct xe_vm *vm,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto fr=
ee_bind_ops;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat_index))) {<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D -EINVAL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto free_bind_ops;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (XE_IOCTL_DBG(xe, op &gt; DRM_XE_VM_BIND_OP_PREFETCH=
) ||<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_IOCTL_DBG(xe, flags &amp; ~S=
UPPORTED_FLAGS) ||<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_IOCTL_DBG(xe, obj &amp;&amp;=
 (is_null || is_cpu_addr_mirror)) ||<br>
&gt; diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/x=
e_vm_madvise.c<br>
&gt; index 0474768a38aa..265273294756 100644<br>
&gt; --- a/drivers/gpu/drm/xe/xe_vm_madvise.c<br>
&gt; +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c<br>
&gt; @@ -500,6 +500,9 @@ static bool check_pat_args_are_sane(struct xe_devi=
ce *xe,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u16 coh_mode =3D xe_pat_inde=
x_get_coh_mode(xe, pat_index);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_r=
eserved(xe, pat_index)))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return false;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Using coh_none with =
CPU cached buffers is not allowed on iGPU.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * On iGPU the GPU shar=
es the LLC with the CPU, so with coh_none<br>
&gt; diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/x=
e_wa_oob.rules<br>
&gt; index dd69ad07f7a9..46290d039fa8 100644<br>
&gt; --- a/drivers/gpu/drm/xe/xe_wa_oob.rules<br>
&gt; +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules<br>
&gt; @@ -71,4 +71,5 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; GRAPHICS_VERSION(3511)<br>
&gt;&nbsp; 16029897822&nbsp; MEDIA_VERSION(3500)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; GRAPHICS_VERSION(3510)<br>
&gt; +14026539277&nbsp; GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)<br>
&gt;&nbsp; 14027054324&nbsp; GRAPHICS_VERSION(3511)<br>
&gt;<br>
&gt; --<br>
&gt; 2.55.0<br>
</div>
<p>
    <hr/>
    <strong style=3D"line-height: 11.25pt;">
        <span style=3D"font-size: 9pt; color: #595959;">
            <span style=3D"font-family: 'Arial Narrow', sans-serif;">Intel =
Technology Poland sp. z o.o.<br>
            </span>
        </span>
    </strong>
    <span style=3D"color:#595959; font-family: 'Arial Narrow', sans-serif; =
font-size: 9pt; line-height: 11.25pt;">
        ul. S&#322;owackiego 173 | 80-298 Gda&#324;sk | S&#261;d Rejonowy G=
da&#324;sk P&#243;&#322;noc | VII Wydzia&#322; Gospodarczy Krajowego Rejest=
ru S&#261;dowego - KRS 101882 | NIP 957-07-52-316 | Kapita&#322; zak&#322;a=
dowy 200.000 PLN.<br/>
              Sp&#243;&#322;ka o&#347;wiadcza, &#380;e posiada status du&#3=
80;ego przedsi&#281;biorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o prz=
eciwdzia&#322;aniu nadmiernym op&#243;&#378;nieniom w transakcjach handlowy=
ch.
    </span>
</p>
<p>
    <span style=3D"font-size:8.0pt;  font-family:'Arial Narrow',sans-serif;=
 mso-fareast-font-family: 'Times New Roman';mso-bidi-font-family:Arial; col=
or:#595959; mso-ansi-language:EN-US; mso-fareast-language:EN-US; mso-bidi-l=
anguage: PL-PL">
        Ta wiadomo&#347;&#263; wraz z za&#322;&#261;cznikami jest przeznacz=
ona dla okre&#347;lonego adresata i mo&#380;e zawiera&#263; informacje pouf=
ne. W razie przypadkowego otrzymania tej wiadomo&#347;ci, prosimy o powiado=
mienie nadawcy oraz trwa&#322;e jej usuni&#281;cie; jakiekolwiek przegl&#26=
1;danie lub rozpowszechnianie jest zabronione.<br>
        This e-mail and any attachments may contain confidential material f=
or the sole use of the intended recipient(s). If you are not the intended r=
ecipient, please contact the sender and delete all copies; any review or di=
stribution by others is strictly prohibited.
    </span>
</p>
<p class=3D"MsoNormal"><o:p></o:p></p>
</body>
</html>

--_000_BYAPR11MB2597185890315624024390B18EA02BYAPR11MB2597namp_--

