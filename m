Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC15C27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 17:46:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB1110EA49;
	Thu,  6 Jun 2024 17:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uf6p99uM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BED10EA49
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 17:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717695960; x=1749231960;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0ix9+iTyC7n5DJHUP+fY9bb88r5y3p0qImjli5EacFg=;
 b=Uf6p99uMq5TGlVUCP+mL1ngPzkUWnBvfut8i/mRht/wqYRalEdZlJEqc
 C1WdN+DcQp1fG7QezGvNgnw6rSOYGeJt/dtMtBZKrQOgiiocs3uJEzYS+
 EJXj4IQuWPYlCukDd1gXr/w9C0rMm/uaPpjR5BSyMF89qSyC82ZdHlZXY
 rxQlp2hVgbGG/FNFUxKqVqN6sg1WOd6VGkJyrP0+VLSIlawpZ0MRvDxz8
 T49L+z828l/KJpqmurnzBc8bC64gc37r7H2JomjJUWGNWzkblvEmQOIhE
 1A/Nq4Fbzfzww0kAAZWRGZB9sdoEXjYeUuEV0X25mBgP6/OTi+N1aAyc2 A==;
X-CSE-ConnectionGUID: A4TE2iXAT7aacDc/L9dCLQ==
X-CSE-MsgGUID: tBMYdKAnTfS66GUn+LFyDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18212916"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="18212916"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 10:46:00 -0700
X-CSE-ConnectionGUID: umZUery+SV2g7UWtTaP1BQ==
X-CSE-MsgGUID: VewFnNQpTqmBxVfNcfmh4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="37900799"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 10:45:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 10:45:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 10:45:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 10:45:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcknhpTtYBmW6VHfElXtOOd0PdpgBpXLAL5Cox2Z/oLH1bCqoda8jMroBP4MP+HekrGeP/ZwnfoMddXKB8Xm/BoSG71L8788zkhaEn/v6otef+ejjoNBqMkEuEq4ml7f9Gt9xSVboLG3kJWPPJugcZw+x/5OnD5yjf2Eajd0NAOUPMYJFdMtoALyoi4TqIF278sg4iOl3Bm6A9T7N2ci76VS3o11eovO/Uv/LqL0m8cyTPJU6t3T6bXdMcZzmjd0FWGA0DaYP3YZ83uo1qyfCt5o0Cwfwlq6BjLtXSwjuT4HQLCEuKkJjAW+fYOK/BaWetVFDerB8lX50a8M3U92sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZVkGEOvNQbnrdllfQuIAc9Fxw+O1rH7O91VJ31SdpU=;
 b=GeEZbu0bi5mtk+Hxz403M2YgWaMvNUdK8dlPMcG8irpRX2FDWOIf8KZ+onEl+IC6ZSQDWKYEVHchGqUlaTmGQLI/uKVlVPR39ky+ucU9SJDr915+uS4SR/iB97fJ0WxxiMN7b330FcxmfhZPqaBlX/ocGd088qt/0jQRzF+l/Z0xyX0ODpg6vNfxPSGhKt/s24K+K0LLqpzZOFpwhLYSAIqnCRPUMs9t/qkbfnymQ5bGHyx85sVKMRJRCdQe0vjI2F6n7wxNzcCBgIMcXAtHpMUnVowPRpM3HQWCC5kW+6tDjO+SWkOIX8ixgBAO1SDToQDD58RgPB6M/JpsCWMU7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB7860.namprd11.prod.outlook.com (2603:10b6:8:e9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.33; Thu, 6 Jun 2024 17:45:56 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 17:45:55 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
Thread-Topic: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
Thread-Index: AQHat1xc98ApSoJSkkCqes8UMcIlE7G5u3GAgAEJZgCAACjCAIAAA2KggAAQNACAAACiAIAAAhIQ
Date: Thu, 6 Jun 2024 17:45:55 +0000
Message-ID: <CH0PR11MB5444E3D94394A92B97391AFAE5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
 <ZmDiLcMGBdCcz2Rx@intel.com>
 <CH0PR11MB54444909E70839CD751A14E6E5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZmHjAAFZ0i9Xg2-S@intel.com>
 <CH0PR11MB54446ACC83247A5E623A89EDE5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <b5huvz4dqw52xaj64uf4sgxumbn7avp3nm3tfe5rhwtxhf44xc@kq4abeay2rnc>
 <ZmHz9p1EyCyxPlFG@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZmHz9p1EyCyxPlFG@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB7860:EE_
x-ms-office365-filtering-correlation-id: 68a896c3-0c1a-40e3-8bd8-08dc8650848a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?BLq+LJvxZsYfOXTisnUgeHgLbY5xVkYqHVTwzlw7fuVOgDG/YIyOl7uyhTPo?=
 =?us-ascii?Q?Gl6QNgj+MaDCs4bhbiS/k4tr7Glp0zjJe3rK8bhdnEbpaPZk6QrfDkd90HqA?=
 =?us-ascii?Q?WWegUqJyvgUFBFv5SMvcyeKaQQcqm0t+v1+sHWpZjmm+yOKTYMkcqFbNiZW9?=
 =?us-ascii?Q?sVssz/ILGmAdRaY0kaNk3S9x3Qr7r04msxnu0LtZuQjpct8HdZn8pw4IWSMz?=
 =?us-ascii?Q?+3i7F/cotvf5OvZpxaFEyS0iAKLCXjoh232p4KOjp1xPViuto5C4uD87pqjS?=
 =?us-ascii?Q?MeyxSbz4jtyff4tKocxc/QTEZF4UaG/JC9Mdj5u774gLDGV5/1Dlm1FHbPSB?=
 =?us-ascii?Q?Vb4zPvpmnUA70v48c8sq9Rxbb9nlFI/oBW9FboMbA8i0VVSkZgJwYirlHeUR?=
 =?us-ascii?Q?Nn2BaVF1BUKA9XdHXY6VzbA4exD9v9MkX+grQu6ZIKI8qcqoyh0VBQglU4XU?=
 =?us-ascii?Q?i7rEjSwM6Xh99IcM2U5/yXtuQwg9zFjMx1pblBmZkoJTOhXBAa96oNFVI0TQ?=
 =?us-ascii?Q?xXvgnha68rRBdbydOyrckqFtnqFaH8GOQ9sYB7d+ZRall+aWiOsN788g94L5?=
 =?us-ascii?Q?XurNsyrSoHUOr75LiSKSGCrAbxfPGGqbFO2j8XLF7HSWu45YaJpI+ZSHDEGj?=
 =?us-ascii?Q?vDcWOajfsjUiSYPQoQyaoxdpdcvg+joAK/SpudtKzwEWv7N/fHD/i7jPhvEx?=
 =?us-ascii?Q?DgPYPVToFpI3cY5yD109ZevJ0ThqRnpZwqOSAgvclI1iyVW84HeuMhzA9tZS?=
 =?us-ascii?Q?VdPkJRXfe6W1xBm4AOUVaajRqaKSR/tUYwltfpInf9Cf7trY9Dj8eeeCshfO?=
 =?us-ascii?Q?mYbxL+y6Aj90r0IgWHbzysLQfUozEThcfACUHrdV6rR9BiQgP0JssJMJ5rGy?=
 =?us-ascii?Q?aD/307WersUGCeEk8oH/1d8fjXc+qSUDHp+RFsyLfwwNj2qgA8L6KoahUEfz?=
 =?us-ascii?Q?coZ/Fy2M5aE9McOAx9CkwwnI6bP2ZEzUh3yCNCI3gQpdqPM0R4dt4jfBC4Nm?=
 =?us-ascii?Q?IclJQRxy2hjog1/vFCvw9yu07JGV9G/Sc9Y2+k5L/prj54Fauyk8dhNOS3rT?=
 =?us-ascii?Q?B+xyNecyKFumWEmAkCiRgipbedjokaXwKYu3XPBErGG2zrQc5q0atchtR0pq?=
 =?us-ascii?Q?rlkZ7zseRXdSrhO9dY6MnT4qHUdvJWMo5zHHBj1ersLI1xzvLOw865y3F5lr?=
 =?us-ascii?Q?7MTf8ekt1HW7GS4Zg3+1G9EBBSEm0WZklQUHIe2ZOsCXkWKZCImLe7CNLHt7?=
 =?us-ascii?Q?0OnQd0A8M1KTo5XXRUdsZrIlyIz9LsjxRLxc44NfNq9qLokqTBljP2BNxFEs?=
 =?us-ascii?Q?KJ+rfi2AvJhQQkvX5kiX9P6n?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MrB4jcIJfcxdyjXwS8iRfred10YRa9TvWyR7PWEym97oaTCwc6AsRD+MJEWV?=
 =?us-ascii?Q?QZHQ4WkUAhdQz9FTU7RhSLC6vQ9Ka2nM3Za/cLAZoR1s9GK5ayJvU9C4eLYI?=
 =?us-ascii?Q?1BBbEJGDiby8ksgS+Wf/VgmrR7AqsODWP7htmA5SIHGq01+8tpXeSSYo6jio?=
 =?us-ascii?Q?aVkEXdX6fqrE2MI+cZJ5m7VLDktrsJrTb5tTq9poQXg8Or6VyK40T2AGaKWp?=
 =?us-ascii?Q?rk9ZDFncK2mTIsvpCBLaMCNP0HFW5HSa3OtNgfGCYV6nQ0ARrve+N2N8gsTD?=
 =?us-ascii?Q?j7KdXjt27Bbu4h7YtyDSwKRlLRYqzT6wfSM9J8kR2komv9cJNTYJgQuXR8++?=
 =?us-ascii?Q?In/JwYeHKQSz4g8dkRIEG1RpvzdEcBzZuKG3YqVwFKKQL2cNxowb9PHNAISE?=
 =?us-ascii?Q?y4WwonCHJ74bpJQGQ49mEaYOPbjrEH7FC6I4gvzK2AG/BR/VOE8L582dbXMz?=
 =?us-ascii?Q?Nas8YfEn5se1JekzKGfyMUSULoBWltWdskS04TQlD++VB798yy/Tldgx4MNs?=
 =?us-ascii?Q?UOKgIhVsb4dRHWRBJN5SQ5p8KmMrTpVfpO37WteEc0GSGx0/m/7Vfs32QaO2?=
 =?us-ascii?Q?2kTaTLN0XlkgGRla9n48lwV9z56rC3bThy/haC9cv/VgWfLoIuxvdoV8S+lV?=
 =?us-ascii?Q?sWT6cbyoh07SAqABDAnIX6H9q25bRiTHc+1JSENj2m0cekXfjmdpF3ukrGXQ?=
 =?us-ascii?Q?pCsvrFSphrs19OnuFJ1SQlIiyj7s9HR7sCLJz0eZUS3WlpjmywUIIEStaq6F?=
 =?us-ascii?Q?Xa9/rzctzdJzzAbLdxRrsgxOERORArhf2LZxUx2U4k5BbR8fdfO4QW0RXcL9?=
 =?us-ascii?Q?dSh1okn5AnIhBjvPM/M3U7WeX6HYns9XCT5+jHGXdvmZgoNZ9DObNA65BpY2?=
 =?us-ascii?Q?ZX4y55aFg9+AV8BDE7Xd5Bq/zJkWwcLUH7aUhi1kKCncq6OP01uGYEOzBLec?=
 =?us-ascii?Q?gOnXIDdFWu3t4KiDzXtsXtq9DV5iH7u/SJ0vyLANz5dtC4MqPo2XiSPHN10c?=
 =?us-ascii?Q?WeZmzLKMjdrQyL2oZEW1fyjrZLD1vUWZ3OLRDi8oVBVCy03JhcGtHn46rrEH?=
 =?us-ascii?Q?3/XUR8V8nsw8bXamY2NNhw5BFiA3nRzJNSyqr5/1uk1l09008FmGSMZjlQuC?=
 =?us-ascii?Q?PlYWLQh9DW7KxvRAAL42ck+3mRnSTbp77yEZa6ceK40kqNxFgqsgLM1JhMWK?=
 =?us-ascii?Q?cXMP4x/NsyLyn8dHKAbJ4wor8YUMa4BWOTjZ9P0q+2ET5QgB5qgZYvGoxNa0?=
 =?us-ascii?Q?U0wPzfNUrqIYpAGD1+16OhOHTQH/M1AvboK40RWvLq4h9NTxffD4+LgIz3BP?=
 =?us-ascii?Q?3bTgPmIHZGHTL8fpfnJck3IGrmUuekb5kaug/LsiDd8zla28NG6ZcmxIB6RI?=
 =?us-ascii?Q?0J2TvGyPbf3cacbVvoXuzbI2t+yL4WLdLE5QXsNEaP1viQFw7uGJ2ouNMsp9?=
 =?us-ascii?Q?giRdM/aWjLpvQl0NgAMiPshYNd78WAyK+gS8TaO0Ez3WMfiF4p07uaAOvZHz?=
 =?us-ascii?Q?zc03/Tavbo8ulk8BJG2baBEczB6cttPhsfO+66xhp8iZrV0MRjvZXl4zVFbT?=
 =?us-ascii?Q?VZjVODhVBzpDVlRyjHWi7RJZeTkqUGtn2ngGc+SIlFvom7gYPtgSkKfCaxXG?=
 =?us-ascii?Q?4g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a896c3-0c1a-40e3-8bd8-08dc8650848a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 17:45:55.8799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 76VASgPLXgQmCBzeQxUf/pua8Veyja1qezBopxJWxnknRApSadQVpgqhTvo13dXvVICGXd2eOwqwhj2BGlw2h5NJxdJPZ1CSNem2qKRmlG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7860
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

-----Original Message-----
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Thursday, June 6, 2024 10:38 AM
To: De Marchi, Lucas <lucas.demarchi@intel.com>
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Vivi, Rodrigo <rodrigo.vi=
vi@intel.com>; intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gu=
pta@intel.com>; Harrison, John C <john.c.harrison@intel.com>; Summers, Stua=
rt <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
>=20
> On Thu, Jun 06, 2024 at 12:35:42PM -0500, Lucas De Marchi wrote:
> > On Thu, Jun 06, 2024 at 04:38:49PM GMT, Cavitt, Jonathan wrote:
> > > -----Original Message-----
> > > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Sent: Thursday, June 6, 2024 9:26 AM
> > > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@i=
ntel.com>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <john=
.c.harrison@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> > > Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset d=
ebugfs
> > > >=20
> > > > On Thu, Jun 06, 2024 at 02:11:02PM +0000, Cavitt, Jonathan wrote:
> > > > > -----Original Message-----
> > > > > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > > Sent: Wednesday, June 5, 2024 3:10 PM
> > > > > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > > > > Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gup=
ta@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <=
john.c.harrison@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> > > > > Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt res=
et debugfs
> > > > > >
> > > > > > On Wed, Jun 05, 2024 at 08:08:28AM -0700, Jonathan Cavitt wrote=
:
> > > > > > > We currently have debugfs support that allows the userspace t=
o initiate
> > > > > > > an asynchronous gt reset on command.  However, userspace may =
also wish
> > > > > > > to wait for the completion of the gt reset before performing =
any
> > > > > > > additional work.  To that end, add a version of the force_res=
et gt
> > > > > > > debugfs function that operates synchronously.
> > > > > > >
> > > > > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues=
/1068
> > > > > >
> > > > > > do we already have the igt changes that really closes this?
> > > > >
> > > > > The IGT change that closes this issue has not yet landed.  It rel=
ies on
> > > > > using the new debugfs, so if it landed first, we'd be attempting =
to call
> > > > > a nonexistent debugfs function.
> > > >=20
> > > > Please provide the IGT and the kernel patch at the same time.
> > > > you can copy patchwork or lore links in the one or the other cover =
letter
> > > > to explain and justify each other.
> > >=20
> > > Here's the related IGT change:
> > > https://patchwork.freedesktop.org/series/134509/
> >=20
> > great. Let's remove the Closes from this patch then.
> > We can do that while applying, but...
> >=20
>=20
> I think Rodrigo just pushed these...
>=20
> > > > > > > @@ -116,6 +116,17 @@ static int force_reset(struct xe_gt *gt,=
 struct drm_printer *p)
> > > > > > >  	return 0;
> > > > > > >  }
> > > > > > >
> > > > > > > +static int force_reset_sync(struct xe_gt *gt, struct drm_pri=
nter *p)
> > > > > > > +{
> > > > > > > +	xe_pm_runtime_get(gt_to_xe(gt));
> > > > > > > +	xe_gt_reset_async(gt);
> > > > > > > +	xe_pm_runtime_put(gt_to_xe(gt));
> > > > > > > +
> >=20
> > why aren't we just calling force_reset(gt, p); here?
> >=20
>=20
> Opps, I missed that in my review and agree what you suggest is better.
> Given that Rodrigo just pushed this, let's do a quick follow up to fix?
>=20

Will post follow-up later today.
-Jonathan Cavitt

> Matt=20
>=20
> > Lucas De Marchi
> >=20
> > > > > > > +	flush_work(&gt->reset.worker);
> > > > > > > +
> > > > > > > +	return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > >  static int sa_info(struct xe_gt *gt, struct drm_printer *p)
> > > > > > >  {
> > > > > > >  	struct xe_tile *tile =3D gt_to_tile(gt);
> > > > > > > @@ -261,6 +272,7 @@ static int vecs_default_lrc(struct xe_gt =
*gt, struct drm_printer *p)
> > > > > > >  static const struct drm_info_list debugfs_list[] =3D {
> > > > > > >  	{"hw_engines", .show =3D xe_gt_debugfs_simple_show, .data =
=3D hw_engines},
> > > > > > >  	{"force_reset", .show =3D xe_gt_debugfs_simple_show, .data =
=3D force_reset},
> > > > > > > +	{"force_reset_sync", .show =3D xe_gt_debugfs_simple_show, .=
data =3D force_reset_sync},
> > > > > > >  	{"sa_info", .show =3D xe_gt_debugfs_simple_show, .data =3D =
sa_info},
> > > > > > >  	{"topology", .show =3D xe_gt_debugfs_simple_show, .data =3D=
 topology},
> > > > > > >  	{"steering", .show =3D xe_gt_debugfs_simple_show, .data =3D=
 steering},
> > > > > > > --
> > > > > > > 2.25.1
> > > > > > >
> > > > > >
> > > >=20
>=20
