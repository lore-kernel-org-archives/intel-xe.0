Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7E2606A31D
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PPh2AaFn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5108A112703;
	Fri, 30 Oct 2026 10:18:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC178112701;
 Fri, 30 Oct 2026 10:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793355481; x=1824891481;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=/nIEgdeO4gsSv44d6/rVgLPpqZ3cTgTxKbPmxQADmIg=;
 b=PPh2AaFn/Qk6164E+1EN69+r4DinH+CvMCFycAqJyGW0IwRlI5BTTMEW
 XQaDYw1yZor6aaL6ksN16rJSvjuax7kSEcgz2g8otRfzy1xn+uB6vQ3Uo
 YtPu/OGz/To+3t2kh1zpeLSo9fxVG6N4G6EJ6d9u33Nlx6SsyuhN3uBya
 zzHEKRM7NV5/QBDgci9tGl0J/Zh0tEWvR+l6dE3I5b+RZ0QizvlmmnfFU
 voORWxRMw9mUdQGDTLrFJe+M3m3ghTB3tmfvI6uyhUa6rFLh7P1aB2aDi
 sjiaCggishv07Cn69tOtaHCR0f+XjeEzQuTrft9W8IdvXqRk2aUVTX4gz w==;
X-CSE-ConnectionGUID: HIqZaSGrRsuY2YosHV/zMg==
X-CSE-MsgGUID: nJnCov2YSfOOpiGdaeacXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2117036"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; d="scan'208,217";a="2117036"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 03:18:00 -0700
X-CSE-ConnectionGUID: QvVS4Fn4Q3W6Q7SlV7RKPg==
X-CSE-MsgGUID: sEvX1jqTRIW2GOOpODek6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; d="scan'208,217";a="5361771"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 03:18:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 03:18:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 03:18:00 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 03:17:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYSHKRX9RXL6NLvdQeM5ehhTBMN8X5gGKL1di3CDN+Pedho8199SvejroCmvBoqpwBbCwCOQBhmwLebodlMoo87QLlMA9XNA0aJvp8VokIe5dIRYmiSj4gyBCoCPTkOyV5Tbme8MpxKzsTG42szI3r0fw8JJsv559TeR/RC0bgZVPpZDNpXb3X181sHtS/lCQqOpj2YnVN9kkyBMChpIUYzln7n+7t6JacgKRwMI3vC7jA8QZfyp61koGxxBRtXbRnApXQgiBoePMPR91SKEiCFG1da+7iCLPjwFfMWtcQRensf2dAB9phb0E+3/Oe8xnpWY7y1YHkzrcrZWurgelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMKc9sD6io0NDx0cJ+vY6ls17FoQ6HE7aVlXrEchJqQ=;
 b=rMxXGgM8ydI9J0S293qYHmxTKBjuAu1oLDqFthoDqjP0Q7Lq8O7VWicy3zSLbGmkLkcK/Rm69Vm+MiBc//+qXBr00Ifc9ueYQcLVtb5+gJqGuls0f+hMhqr1VYe7j2FNc4rvHv+5UK57y52V8Ee0El++JG8qcfyEfXSBA4zOhDdgyFC2yN1H1/LKnTykKTZbf+kHLdT6YK6HlSPvzVVk2ivZSrAPRJSxnSIE4Ck3QNEOASrZ7dtBeRo9f6SOlhanFrUjwwAD1IfVg1SE5oVtfJGwhRUfYc1aCMnSytqcfgp2wcMrKoBDelnMkMrkmd+u9+HdTSaOvAX9jVvW9ty5fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2890.namprd11.prod.outlook.com (2603:10b6:5:63::20) by
 CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.9; Fri, 30 Oct 2026 10:17:52 +0000
Received: from DM6PR11MB2890.namprd11.prod.outlook.com
 ([fe80::1a49:9e37:563c:6153]) by DM6PR11MB2890.namprd11.prod.outlook.com
 ([fe80::1a49:9e37:563c:6153%3]) with mapi id 15.21.0546.021; Fri, 30 Oct 2026
 10:17:51 +0000
From: "Pramod, Ambica" <ambica.pramod@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/2] Frontbuffer tracking fixes
Thread-Topic: [PATCH 0/2] Frontbuffer tracking fixes
Thread-Index: AQHdaD1D0MfeB/BlAU6g/MtAeNyEpLcV3vht
Date: Fri, 30 Oct 2026 10:17:51 +0000
Message-ID: <DM6PR11MB2890BA35E537583292286DD4E16D2@DM6PR11MB2890.namprd11.prod.outlook.com>
References: <20261030070613.181026-1-jouni.hogander@intel.com>
In-Reply-To: <20261030070613.181026-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB2890:EE_|CY8PR11MB6939:EE_
x-ms-office365-filtering-correlation-id: 648f4523-3975-48ce-9761-08df366f0e06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|23010399003|376014|18002099003|22082099003|8096899003|56012099006|11063799006|10067099003|261021123027099003|261021121427099003|261009223027099003|38070700021;
x-microsoft-antispam-message-info: vXgfOgixfd0IBCqzT0kyqQwlR8+bto/pt+dA+u2X6568Y5O4nE2zY8YJ0dgSCbB1bBfhn4xCD1IkhvstjZi47avaRHyzs72UR0jNOWv063h/lwXJ3YtOPSdKhyjBzdDAnsF4L6gHMeEW8Ewik0sT3Q0SVzlwsDho4fLWiefgCr9qnBRNVS3EZ0gDkHdbHbwMsYNI9rv6gEMVwAXL9Z87MiRNWNrsp/jPT0d0/4k2c8zxZZSXy/hQeinoqmgzdtyLGeBxt40Y7FwLWXB9vzFM959SNaola7Tsuzxb4d9/l89gBL7B2uVDCJS7LH2KpNk5aEmQG/TH8938eRFI8cbcPMmEMXM4VFycgF0gJAbTNsLWjrf+RPjLiiO3Gq0Lypyb9DJPxmlVDtQZFE9amUC3IXOwoqOvR6k5v3QZ1lk2ZaFeWDLblkJAiufAFbS2rTgI8DHa23AJl/R3/2VCliajnS8GH04eA2FQxhgmpH4ahhez1ZnwmSodtgO/tlfH0XQmerdLo9oeeG0xBTKKdnD3TJicF8gVRTtYksnc6b4+BmXWXbmje6/Uf/CqlBy0iakgi4hOoLGlVZhTmJPZjabdWMhKvDrWG03XYijrgkPW4ni+kKr3r7ufIizSVSZUFcyDWQTCAZeIr+SdnHkzS7jNc7UzrYca0M/BbBnMWPYqXAGoZAimyQweCXq97ynBnng22fnrKpjXdRk4j8ZIjQnYZoM75Rf9cvoaWvPR9YdYF0s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2890.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(8096899003)(56012099006)(11063799006)(10067099003)(261021123027099003)(261021121427099003)(261009223027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kbgtOYRKdC1MydvhRgUvobHBYI5K+PxQsC3n4bar4Rcf44yH+d5qZ68+NV?=
 =?iso-8859-1?Q?d6rLwzR256vJYkar870M8yGk8n6qGYpf75qbqm+eT10pFv9/16dgQTuFhY?=
 =?iso-8859-1?Q?QWzI1SGbV856i4hUDGthNqTJxCFqf6BF0js0evJ6lfAajXDJvnkfIjP2ZS?=
 =?iso-8859-1?Q?8vBR+D2F+B8krN4CgA9lgYaA+gO9trSGcenc9SGm2DomrwRi0ziSTMS6S9?=
 =?iso-8859-1?Q?8cnYcqjCHRcGrmkdZ6tyYMAKln9mO1gsHI3wDAFAlAITWhYnMWarpDxxfb?=
 =?iso-8859-1?Q?T9hZzdtKutBa6kHnlxeflIFh6zHzqCrIfE1kRVr1dhkaPtZk41KTCRvW0a?=
 =?iso-8859-1?Q?+/2I22rablcxn22RoQ4Qk+X/fdCDZ/+KCNX5Zmr9CwvLvwumyVgxCwF8cU?=
 =?iso-8859-1?Q?47pyyY9q+mHmnfyuxr9YQq7Q6piAiWl2iJX7v28x1C1FtD6jU4S3fQsBdR?=
 =?iso-8859-1?Q?dTejaRDOzAKg70VGq2PCp0klXzvBwGuqIXtFgWgtmjGOCMhErKNLe73mDw?=
 =?iso-8859-1?Q?pJgPOAZ+bKCKhdtHgm3DtI426hx0qGvQ5irAD5LVHSJN9KFtKUM5gsLTbT?=
 =?iso-8859-1?Q?IOY2i2+7rHV2RaYwkBh+R60eQq9/Z1twyt+uzoz6xuhMtJg+CIkV+2EAnp?=
 =?iso-8859-1?Q?t+ed2K8nOrtPgGYNLLKMVA5u4yYiINJQK9NkOL6pMUk4eN//y9OUgSdF1s?=
 =?iso-8859-1?Q?xn7KaHy07R1EkwjbhMJi4Qu9sBdXJgDpoT3KMHMyFkA9Bb9RyDd4whQWa/?=
 =?iso-8859-1?Q?z38FegmgL/cw0xURbfpK4xZmS7sNWK9LXU7ZnDCXPMIbxYcsEKShrP33C0?=
 =?iso-8859-1?Q?gZu+mrVt07vQmN77bVJMryWr4Iso9asLmyjR9ywfBD8pNkqGBvvNwrbOfW?=
 =?iso-8859-1?Q?KZ2N+j5W90279NDhMnYufm1JFBUdoL4m5gkXpXUqKDbK0fpvEpTSJzH5wJ?=
 =?iso-8859-1?Q?jz6KRClcLd/UjYacE6torr8+nIAnV0F5iJ7lDS+BhDurIKhoTxuvMBodVM?=
 =?iso-8859-1?Q?w6DWFA4FgCjTrTuaRjM0K3WlZ30+rpygBjFC9eBHY4fu7YePbFALZ2G5u9?=
 =?iso-8859-1?Q?8ZPTdHUzVEe10iNxriwkT2EqUwrYyh6+B9ZkIiZOy2bJeGhEJId0iF/Ioe?=
 =?iso-8859-1?Q?vpmRopHUm8Pg/2UbfoyRvxKnzeUkxR8uWr/8Gki0kW0gTbVIFg2fLunwAW?=
 =?iso-8859-1?Q?2LKYD6Jbzmi7zpNNz9V4druVxvv6iF7Cq0sd4PyBsz+dLakQkylziDubX0?=
 =?iso-8859-1?Q?5vtvZcULHD7GwH0oI4zmYUzoo1u/XYgJ9gfg3rn8VbyX6utmOuj85dxrxH?=
 =?iso-8859-1?Q?CIo3dmbNlUFu4hKtapz7rrx82FXoPryYBGLypxNQIuG/dMF4NC7KdycKOr?=
 =?iso-8859-1?Q?KBCQWgq/KfTk6a1QaQRtNyiSrMvmL6S7M0R8XjhWmRMfUjnKVh2YFiYEWk?=
 =?iso-8859-1?Q?WNy/lB6Pl2R+NNO/1oAOaLdAIIgSl6NpNUQmAHnnrEoYnQA4iJHiDPECD0?=
 =?iso-8859-1?Q?+1pDxaRTgXeacMJ9OLTOkHl/abXftQBx4h+gixo4kP7Hia1jW13oYzzEaB?=
 =?iso-8859-1?Q?0+UjANU86ZubhH80yziO51//HbQrVDHHrUXdfdDucs7kLtccRy6bKqb7it?=
 =?iso-8859-1?Q?x9N9qPbvPwoaNcyo8ymWC2NrjVYDGe9YuhFq5shG/1BZziW/TBZX1RJaxN?=
 =?iso-8859-1?Q?B9eQXPRI4/j1CUHHLNKit13WdQnaqVL4bTVvMdIbbSwkUdR/5wT8le+gOa?=
 =?iso-8859-1?Q?oZ3IrrNBVoWxjpV0WiVb63SeFsOBkDs4Cn2QA+2L21xrzaPovEFKx+4JNJ?=
 =?iso-8859-1?Q?NGWdyCen6+8TKR9qGucnxCQd/hxEdB+IX+huWojZQb/Gj4vO+dnPTjXPIw?=
 =?iso-8859-1?Q?23?=
x-ms-exchange-antispam-messagedata-1: bKYkoOPSWO5zHw==
Content-Type: multipart/alternative;
 boundary="_000_DM6PR11MB2890BA35E537583292286DD4E16D2DM6PR11MB2890namp_"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YqZxmUKD3jbNIe0iNhSBOyn1HN71JzzCFRsvRM7atoWaaBS6iP8wD3Fh+qqXdJ/PpamgyrJkn0vezehs+WoLoIK/tXhDsFmQZtRhrEwkeg9KO4i5sgxptiRxVXvoGrGk94WvqUmcqrJbELlRVVjVmzUFlNBbzpDXoJy8QasjnLpMs4s+NxLqmtiRXTwrxibYL/wtCfS4jx7YSujo+79tnmhZ9iABpcKJK/SABsTLZweeFtz07dMUBH2eVdictE8Lx7N5KIhIh2vNSV/PUttofOCVVori1dQmsNIjztM3f647LQZhP3/dhVH29fL7O97TEM0Ykbf8KdW3jfcAbbpstw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2890.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648f4523-3975-48ce-9761-08df366f0e06
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 10:17:51.3505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9UJSIxlR3zvPiEDnNqkV8am1H/287ANyu3CHTZqQqrT5JjAErN1B1GdvbnYEjWcmMjArbp/IXssVw1WMJhlhuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--_000_DM6PR11MB2890BA35E537583292286DD4E16D2DM6PR11MB2890namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Test passed PC10.3 entry on NVL platform with auto-login enabled in gdm3 co=
nfig.

Tested-by: Ambica Pramod <ambica.pramod@intel.com>

________________________________
From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> on behalf of Joun=
i H=F6gander <jouni.hogander@intel.com>
Sent: Friday, October 30, 2026 12:36 PM
To: intel-gfx@lists.freedesktop.org <intel-gfx@lists.freedesktop.org>; inte=
l-xe@lists.freedesktop.org <intel-xe@lists.freedesktop.org>
Cc: Hogander, Jouni <jouni.hogander@intel.com>
Subject: [PATCH 0/2] Frontbuffer tracking fixes

Two frontbuffer tracking paths can leave display power saving inactive:
flip flushes may not re-arm PSR, and fbdev updates may leave busy bits set.
Re-arm PSR after every flush and flush fbdev updates once complete.

Jouni H=F6gander (2):
  drm/i915/psr: Re-arm PSR after flush
  drm/i915/display: Flush the fbdev frontbuffer

 drivers/gpu/drm/i915/display/intel_fbdev.c | 13 +++++++------
 drivers/gpu/drm/i915/display/intel_psr.c   | 11 ++++++-----
 2 files changed, 13 insertions(+), 11 deletions(-)

--
2.43.0


--_000_DM6PR11MB2890BA35E537583292286DD4E16D2DM6PR11MB2890namp_
Content-Type: text/html; charset="iso-8859-1"
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Test passed PC10.3 entry on NVL platform with auto-login enabled in gdm3 co=
nfig.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Tested-by: Ambica Pramod &lt;ambica.pramod@intel.com&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Intel-gfx &lt;intel-gfx-bounces@lists.freedesktop.org&gt; on b=
ehalf of Jouni H=F6gander &lt;jouni.hogander@intel.com&gt;<br>
<b>Sent:</b> Friday, October 30, 2026 12:36 PM<br>
<b>To:</b> intel-gfx@lists.freedesktop.org &lt;intel-gfx@lists.freedesktop.=
org&gt;; intel-xe@lists.freedesktop.org &lt;intel-xe@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Hogander, Jouni &lt;jouni.hogander@intel.com&gt;<br>
<b>Subject:</b> [PATCH 0/2] Frontbuffer tracking fixes</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">Two frontbuffer tracking paths can leave di=
splay power saving inactive:<br>
flip flushes may not re-arm PSR, and fbdev updates may leave busy bits set.=
<br>
Re-arm PSR after every flush and flush fbdev updates once complete.<br>
<br>
Jouni H=F6gander (2):<br>
&nbsp; drm/i915/psr: Re-arm PSR after flush<br>
&nbsp; drm/i915/display: Flush the fbdev frontbuffer<br>
<br>
&nbsp;drivers/gpu/drm/i915/display/intel_fbdev.c | 13 +++++++------<br>
&nbsp;drivers/gpu/drm/i915/display/intel_psr.c&nbsp;&nbsp; | 11 ++++++-----=
<br>
&nbsp;2 files changed, 13 insertions(+), 11 deletions(-)<br>
<br>
--<br>
2.43.0<br>
<br>
</div>
</body>
</html>

--_000_DM6PR11MB2890BA35E537583292286DD4E16D2DM6PR11MB2890namp_--
