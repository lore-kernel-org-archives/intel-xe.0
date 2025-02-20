Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508FCC021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 22:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D3D10E082;
	Thu, 20 Feb 2025 22:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lyUdqW5n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC23D10E082
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 22:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740089000; x=1771625000;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iZ6SqcO1DHGEWAIhDRJ0cezbG0Acqs5rItBV4lnS4K4=;
 b=lyUdqW5nOswpB8oQvo1SOR6WzdI2sSHdE0LAlFQDcALvKQQG4didg4PT
 lxHYaOiUbXkozkJUpKQ6Gq3U279QrfVlJp92YMKmf7Wu4Ec1dkm2ZYX3M
 TYT4J+mzm9vXEoVUiceWW9QJJpZfR4qsi33iba+PhC86eyuU6bpW76Wtr
 YA46uYPk8rvhAS6FuV6rfDuoAd0EkkqlO+FaXtvpPui/8QZLwSdWIjyDF
 uuPM+HfsXNAjFSvof+qf6pVZmUpgQgoQ1b4tapt90xYNliDTNAWA34l89
 2S6kUjmbniHtP2rdumnuzBEnU47KNK5TeogMu0Jq761p+z2DnmOm5RJP0 w==;
X-CSE-ConnectionGUID: euX5VPF0Ro6GyZr+cr2juw==
X-CSE-MsgGUID: 1q/ygSyETPCPQ2Su+lIKAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="58437995"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="58437995"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 14:03:20 -0800
X-CSE-ConnectionGUID: dtQ5PqAOTSO0+g3QawT7Xw==
X-CSE-MsgGUID: pOBA1ypOQZO4MUY90XyDVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="119790698"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 14:03:20 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 20 Feb 2025 14:03:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 20 Feb 2025 14:03:19 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 14:03:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzs/5NtGQrrHOM9EhvHXkvLOqtG6Glj9rgfSdOp7Anf7SZQCUuFkAh7FBJi+AvrsMpStrQMprRo/1WwEs2B0FznocrmUcNnI1dvq0zAY5io/TaAszJe3uiM5GzWspzGAVcUYSc29gXwhrG0kg17KdRM8+rz/YrvGu77Xkh4sWT0muL53dkmPVq/947PxAaKcryZK4nOu9X3L+oh/e9ekZbWx5AkHWyZ5r0FfbM3/K6aAmYiqA4Pct4HfSgs8c7ajsiddjOUpYTIwo9169x6S/frBcY6GGb4w7jMQH0mu1+iVbm4orzwMjquqL0lo6Z3N95UntkVQe1MnMt8R6//2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8IXFYH0eqjmKJnCU78bj/VfUgdMwr1SO/eGHqQcUuM=;
 b=wjbOvWEyXMJ1b3O9zoiCSfQ+kNdS4VgGnJsVs1oI5kGOuwYgRpTtBDkAFxhyqxpxyn7IFFJT9bBm35inET/Q7v7GbrIrEQTD9ubcu0oxw1qYlKsQ0brHxNln8P+h1aJA04CM0TnL642I+OzS2hM5VmdJTnNRCeGQbKhNHsvR0geZvAvrF4dUDXCo5XBFUWZyz+Xt4cRxRDo9qaQXFm3DRL4P/azQxyMfECsEC3yk+JzA6EC82EPLY1sDA9x0vlEicf0TRbOcY6YT2ICU5bS84c06Bav8QzwLFWhBPmdrO8bOxIN+xIZ5oRKAc6CIUtHzYPMwJcZoc0dPOOO04CWfVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 22:03:16 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 22:03:16 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Dan Carpenter <dan.carpenter@linaro.org>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RESET
 action
Thread-Topic: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RESET
 action
Thread-Index: AQHbgwnEIcVjYqYueUSSRAUnTbsefLNPHw/QgAFpH4CAAA48QIAAFXmAgAAS1BA=
Date: Thu, 20 Feb 2025 22:03:16 +0000
Message-ID: <CH0PR11MB5444EF116E630184030FD23CE5C42@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250219192710.281-1-michal.wajdeczko@intel.com>
 <CH0PR11MB5444B00440112FF389883EE1E5C52@CH0PR11MB5444.namprd11.prod.outlook.com>
 <4ba44d2b-96fe-4cfe-a679-e3f6c9a23d24@intel.com>
 <CH0PR11MB54445213BCD785AD469D5FB3E5C42@CH0PR11MB5444.namprd11.prod.outlook.com>
 <4a78fbe6-54f6-499e-9bf4-62538fce97b4@intel.com>
In-Reply-To: <4a78fbe6-54f6-499e-9bf4-62538fce97b4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7381:EE_
x-ms-office365-filtering-correlation-id: 6f1a1a67-4382-4f99-e37c-08dd51fa60cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FOn3KsZcXnhBDKplCzy/CZt87w/IEc/53kKpNacnMX6vVfFT+WR9Uss6K00C?=
 =?us-ascii?Q?2Wi7EwTBiirIeCVJs47cIdA6rSG8BzmTZzpQdMGbLOrlrccYFMaIurSA5D2X?=
 =?us-ascii?Q?lSqBURowJwRV1//ALRhvqK1f61W/AaEHefYsXe4qPiw0BxPiqSnTYtVRsc4Q?=
 =?us-ascii?Q?OennfNtCB8/OFbZFnauqbxRa78TBhDTllNxyvx1Dn4QrF7nx4BrV8HhV4zuy?=
 =?us-ascii?Q?SysKUyX6oVZI553PKq9CwNbeDzK8p31uWCovfuhyG/tIuR+sE1Tg6dN9Wwj/?=
 =?us-ascii?Q?TMUsoUBRl6KQKkTiHb+Tt8dCbV2JqK0u+a2p7b0vmDWYw1bBr/4cgkWcT+bE?=
 =?us-ascii?Q?l+QXajiD5I7rEnfgs2EBr78d9c0T5fCm75zodDy92+M2UcJor2Z4vR2/fpu7?=
 =?us-ascii?Q?TI2MNt9ocDVkSVm0iYrt90M5D8mXKNeyz/x/ikmn5WEiyuorw6qptPVY2nTR?=
 =?us-ascii?Q?wtlSwXDIpcUaTzK615RsYkuFnv16pbZnVo1T46oQoPsNZmT5n2GHYvw1atH4?=
 =?us-ascii?Q?fjrDl0daXKKT2WTp8RZLU1yzwimKbDKTLbICe0vuhx8BghOK+Qa8/ysIyWKG?=
 =?us-ascii?Q?uDVIIW8vzIahL16XzcK4DMqKCZtubvY4RA9dQwtC1b404ejJdtaBpMphEyk2?=
 =?us-ascii?Q?oF+LasaukMkfX1Cq+swSVUZugaCO+cHvgnlHg5l1rurec7303/EMy/vSxWBP?=
 =?us-ascii?Q?itpAYTQjlbtl4diGQRUM3cn8dvYkhTIYikr7QY5bx4mAZJBVzNoI6DVCew42?=
 =?us-ascii?Q?vC5qejUlOS4i/Gi4se7yfQ1WDnj/YgNSsBTosuwdF9jzVR2izInOaCkOCzgh?=
 =?us-ascii?Q?3fAJzqbRmw+pzOkFKn15USoHTxu2zK9r8MyIBB2Igo3Yx9/AXQXtnV1Xle7F?=
 =?us-ascii?Q?ChpOdW8EUe+rEDnJBUuvRFp9xPx1tczHIAa5Nz5tEwL/6xrRNtzUYse3jCkt?=
 =?us-ascii?Q?WQscfpG3Zmdowg0mdxNEQFE0A9FnOg6c7bMVeHvHjRmUCyZBsnYi0A/3PCU8?=
 =?us-ascii?Q?9f7kOUVhzqM2JdQ32+YAMvwnP5t9JcsTNM9uJAwkCHY3jLo+vS6xM1IUNj4p?=
 =?us-ascii?Q?3iD1SOVtmWRIRFTtbhhem8HWlM+kFxPLpGM41pUCkKUYuwCvoX8if/9zbKqJ?=
 =?us-ascii?Q?KqzmxsP7oNFOOeeflDJz9ze/etMGHe4zopttiU5MlTOS0gR+dlCWgvfv2G0N?=
 =?us-ascii?Q?fLifpN3UNr+A2a4x8r7GSOVaZv2z9VfRmqtl9PuPxQXrMMs7zVRu7cQuEBU7?=
 =?us-ascii?Q?CgxwRmpO0iaUnu01J3D7AsDKRpddVMZiAKSEZf3dBSQWle+lI1y7iK5keCVP?=
 =?us-ascii?Q?iZJ5p2wU9Se0rs4F7KANiRaQRKkNs1oX3PiLR2cPW1gBP+UqUcBZSVaTeoUe?=
 =?us-ascii?Q?IkPbmlum0Eoj59961o1QO+ecMVjtn+DGAlMgRkrzXgMsl/nNl0pbs+wVeFKg?=
 =?us-ascii?Q?TZgBamJlVVluOwVM9j4rSnCxuG6F39WZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VaNw/TPJtrDGiRscDm6dEtwgtAqdDoboepPNUO9+iUqbIoO7RXwMopF4TYti?=
 =?us-ascii?Q?PwBqgzBG7IfuTV9mbDVn4penhAs4/lrX3/RlQo8enahtboD9n/7cMPCUAB2F?=
 =?us-ascii?Q?o1J3Bb6cmpGUquMzR+Ur+XfmgAX+yu7gjLu3lc2AqqMRaerkDAEhV5RgGGgC?=
 =?us-ascii?Q?gu4qlZ6i7ny1MYspVoN7DW0sgDHtAs+LbtQfs0n18ixaIOpZx5fcPI/P47gd?=
 =?us-ascii?Q?Wij4xzb4aYFJ2/dmVIkRexHc9c2UaThpVvt2twwoTlh4KB4WXurWs/5ua54s?=
 =?us-ascii?Q?VFJFUaVKIzfAAaj9Ex3Dbve5SSc6b3R1vW1JkkJLWm5OR6x9EohrfhA+xGgW?=
 =?us-ascii?Q?tsVdJKIPlFkz4C8evZSakMsELPRsuqSrCz0gE291LD0MqnluE++2Cr9uoaSZ?=
 =?us-ascii?Q?9IXokKLuWdn2opRTLanhkDpgx9VHnbXX6+uggC3ixm6topl8CcUnbjJCN6o2?=
 =?us-ascii?Q?h8FofP4UN9Vap2y6ksDGtv2V2EueWjOSeXSuGmVLC5S8yTRSJxg6ZxY/pSTC?=
 =?us-ascii?Q?Ah7RdjVQ+O6H072x9rtiX/swgq3RpHFhMnUkW6ad17Ub+rP5barnMpk00dWO?=
 =?us-ascii?Q?p1a7kOCDl00bmz6/nRQMKTLPO24SluBW+tbEuX1FejSXm9nWTNkLobAnzpJh?=
 =?us-ascii?Q?uvwWdyzGvD520wchJJ8U/vSLKKA+UTWUjKxxSYIyoSN6pysJSb0SFJc/okQi?=
 =?us-ascii?Q?5qy+bmSzfiR1CLvvrw55T+I096JyWZMFHkDLBAzFXK+kAeav7A8ECwVwEZrt?=
 =?us-ascii?Q?MfVgN6l6lqD5Q6u6FJBTxhIvjz+VK3BQgrWiojPdKaT2ErMRwdAoziq4NfBU?=
 =?us-ascii?Q?jipx3C3OTdoqf6ycuiXo0E3AK0ECMP823Qu4wtxt+jELTaC/fXxcbC/pfzfd?=
 =?us-ascii?Q?S1HDjWniigChIVfE7ocl2A3HHHlJbUaQ4JrIiA02tsRvbUC23zc+xUzvKkrz?=
 =?us-ascii?Q?yr6mJlTn2D0h6LszNKLtXz1nmQFpiDvs83WPvs5GpTynP3MdL2B6AMdtSzoD?=
 =?us-ascii?Q?z8jIVcY7PL8lwdsHYotO/9dEB3Oq9t3BqM61KfblWXNuMbFRfKmw1CbO9waP?=
 =?us-ascii?Q?umDtSDrP8Izq8Is43Zo1OiDCZmYGBVJqKJJKANWWzy3+dMe9jiNfl5C1Uo8N?=
 =?us-ascii?Q?tDKxGf7/mJ+f6HBxQk3vs4AqMx1yvRWuk8Lb4sWhRmEu83WcNsxrt7kKjisO?=
 =?us-ascii?Q?+a/IWWlqskw0PO/WxLF1sQueYT9XMkXMSgSeyoa5cs/bzyoN70RMY5RLXO5G?=
 =?us-ascii?Q?ffNWCHsBK/QQe6VHYOGu3RN90AxAzKoNFlffqyk9EvaQsaSv4dc2DaPiZNkL?=
 =?us-ascii?Q?RpO0umXuzECwTI4lkVx2l7N9QHoDrmfBCqBZPSVzDk7PFnMnWcM+5Vkzikzk?=
 =?us-ascii?Q?ToDnyEJqeuvytzE7MTjZlkqg8T8b2uhmE6TY+1Er4xC61mfUYYtlN5aBnaYs?=
 =?us-ascii?Q?5zp2yOKoXvi4ySL4zQn8+WXA+sEZoNtnhXtex4yjen1U2+ilbgVgV7t12Y7A?=
 =?us-ascii?Q?G+1e3jFsZdBR1U+eIpi+AQ2t4rEe8gv/HaVbTIRqrTafDwZvuvQtpja1jkW8?=
 =?us-ascii?Q?6JSGNoBlP8Gk+g5ULGXal9OVRo2oVQIJ9AZhe7Ql?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1a1a67-4382-4f99-e37c-08dd51fa60cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 22:03:16.4321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hLyDIEPK6EP0y6OPk89i4yY2cvWh1RtrEKFrUPCxh7EGjdr++QNu9zO+aX4X2JD4GXRknkN/rdLY0d4A+3zu/bnZWOZ06S8SOkAUJppYnxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7381
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
From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>=20
Sent: Thursday, February 20, 2025 12:50 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>; Brost, Matthew <matthew.brost=
@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RESET a=
ction
>=20
> On 20.02.2025 21:09, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>=20
> > Sent: Thursday, February 20, 2025 10:42 AM
> > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freede=
sktop.org
> > Cc: Dan Carpenter <dan.carpenter@linaro.org>; Brost, Matthew <matthew.b=
rost@intel.com>
> > Subject: Re: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RES=
ET action
> >>
> >> On 19.02.2025 23:10, Cavitt, Jonathan wrote:
> >>> -----Original Message-----
> >>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of =
Michal Wajdeczko
> >>> Sent: Wednesday, February 19, 2025 11:27 AM
> >>> To: intel-xe@lists.freedesktop.org
> >>> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Dan Carpenter <da=
n.carpenter@linaro.org>; Brost, Matthew <matthew.brost@intel.com>
> >>> Subject: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RESET=
 action
> >>>>
> >>>> Treat unexpected non-zero response data from GuC as -EPROTO error.
> >>>> This will also prevent passing positive value to ERR_PTR().
> >>>>
> >>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> >>>> Closes: https://lore.kernel.org/intel-xe/5fd5a4b9-88ee-47f1-ac3e-32a=
20960c5b0@stanley.mountain/
> >>>> Fixes: 12f95f9900c0 ("drm/xe/guc: Prefer GT oriented logs for GuC me=
ssages")
> >>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> >>>> Cc: Matthew Brost <matthew.brost@intel.com>
> >>>> ---
> >>>>  drivers/gpu/drm/xe/xe_guc.c | 2 ++
> >>>>  1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc=
.c
> >>>> index 1619c0a52db9..bb03db361512 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_guc.c
> >>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
> >>>> @@ -1238,6 +1238,8 @@ int xe_guc_suspend(struct xe_guc *guc)
> >>>> =20
> >>>>  	ret =3D xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
> >>>>  	if (ret) {
> >>>> +		if (ret > 0)
> >>>> +			ret =3D -EPROTO;
> >>>
> >>> I don't see anything wrong with this current implementation, though i=
t's perhaps
> >>> a bit unnecessary to nest this if statement in the "if (ret)" check.
> >>
> >> the idea for nested 'if' was to avoid extra check on normal flow, sinc=
e
> >> it will be very unlikely that return value will non-zero.
> >>
> >> with your approach below we will be always doing comparison twice
> >>
> >> but yeah, this is not on critical path, so who cares...
> >=20
> > Those are fair points.  I think overall, this means the decision is a s=
tylistic
> > choice more than anything, so I'm still good with either approach.
> >=20
> >>
> >>> Maybe:
> >>> """
> >>> 	ret =3D xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
> >>> 	if (ret > 0)
> >>> 		ret =3D -EPROTO;
> >>> 	if (ret) {
> >>> 	...
> >>> """
> >>> Or, if you don't mind ternary operations:
> >>> """
> >>> 	ret =3D xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
> >>> 	ret =3D ret > 0 ? -EPROTO : ret;
> >>> 	if (ret) {
> >>> 	...
> >>> """
> >>
> >> actually above pattern would be useful if move out the sending of
> >> SOFT_RESET to separate helper that handles unexpected replies in place
> >> and always returns only 0 or -ve error code:
> >>
> >> int guc_send_soft_reset(guc)
> >> {
> >> 	u32 action[] =3D {..}
> >> 	int ret;
> >>
> >> 	ret =3D xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
> >>  	return =3D ret > 0 ? -EPROTO : ret;
> >> }
> >>
> >> and this is what I'm usually doing, see guc_action_vf_control_cmd()
> >=20
> > Given that, currently, all but one uses of xe_guc_mmio_send have this c=
heck in
> > place to some extent, we may want to generalize this function a bit if =
we take
> > this route.  That way, we can suitably replace xe_guc_mmio_send in the =
locations
> > where we don't expect a reply:
> > """
> > int xe_guc_mmio_send_noreply(struct xe_gut *guc, const u32 *request, u3=
2 len)
> > {
> >         int ret =3D xe_guc_mmio_send(guc, request, len);
> >         return ret > 0 ? -EPROTO : ret;
> > }
> > """
>=20
> strictly speaking, due to a format of the HXG SUCCESS_RESPONSE message,
> that is is sent as reply to REQUEST message, the DATA0 is always there,
> so we can't say
>=20
> 	"we don't expect a reply"
>=20
> as for such cases we have a separate FAST_REQUEST message, but it is not
> applicable for the MMIO communication ;)
>=20
> I can try to prepare series that will introduce
>=20
> 	xe_guc_mmio_send_mbz()
> or
> 	xe_guc_mmio_send_recv_mbz()

I think xe_guc_mmio_send_mbz makes the most sense: we don't
currently appear to have any use cases where we want to mask the
return value of xe_guc_mmio_send_recv.

-Jonathan Cavitt

>=20
> >=20
> >>
> >>>
> >>> Alternatively, given we do something similar everywhere we call
> >>> xe_guc_mmio_send (except for in xe_guc_hwconfig.c), we might
> >>> want to consider modifying the function to perform this -EPROTO
> >>> step automatically:
> >>> """
> >>> int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
> >>> {
> >>>         int ret =3D xe_guc_mmio_send_recv(guc, request, len, NULL);
> >>>         return ret > 0 ? -EPROTO : ret;
> >>> }
> >>
> >> no, as xe_guc_mmio_send() shall remain as generic purpose function sin=
ce
> >> GuC ABI does not prevent actions to return data just in DATA0 field.
> >>
> >> and IIRC the XE_GUC_ACTION_ALLOCATE_DOORBELL, which is unused in xe ye=
t,
> >>  is one example of such action.
> >=20
> > I think if we are expecting DATA0 to have a non-zero value, we could st=
ill use
> > xe_guc_mmio_send_recv to acquire it.  However, I won't contest the asse=
rtion
> > that xe_guc_mmio_send needs to remain unmodified.
>=20
> xe_guc_mmio_send_recv() is mostly for cases where you expect more than
> DATA0 from HXG header, forcing callers to use this one is step back.
>=20
> >=20
> >>
> >>> ...
> >>> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> >>> static int send_get_hwconfig(struct xe_guc *guc, u64 ggtt_addr, u32 s=
ize)
> >>> {
> >>>         u32 action[] =3D {
> >>>                 XE_GUC_ACTION_GET_HWCONFIG,
> >>>                 lower_32_bits(ggtt_addr),
> >>>                 upper_32_bits(ggtt_addr),
> >>>                 size,
> >>>         };
> >>>        =20
> >>>         return xe_guc_mmio_send_recv(guc, action, ARRAY_SIZE(action),=
 NULL);
> >>> }
> >>> """
> >>> These aren't necessary changes, by the way.  They're perhaps nice-to-=
haves,
> >>> but I won't block on it:
> >>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >=20
> > My Reviewed-by still stands.
>=20
> thanks!
>=20
> > -Jonathan Cavitt
> >=20
> >>> -Jonathan Cavitt
> >>>
> >>>>  		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
> >>>>  		return ret;
> >>>>  	}
> >>>> --=20
> >>>> 2.47.1
> >>>>
> >>>>
> >>
> >>
>=20
>=20
