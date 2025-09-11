Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66F0CAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 08:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C0E10EA41;
	Thu, 11 Sep 2025 08:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZ4SGlwh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430A410EA41
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 08:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757579685; x=1789115685;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=58zGZIQ1kXcp+FgpQZUcLGK/rFz9DiarRgU1OlJJja0=;
 b=DZ4SGlwhmCY2X2cKnzFUb0fWFix8b2MAEA343H9WEZlzFC2syVy2O4E6
 BzzmvJpW0Dpu/+nUqDFT1xmziD4PdNFehc43agyLGfzUHv7iVSpIp7miJ
 wsAQINWr2rR5OQxdEY5+tyhqSr25kH+NLgx5M7UyzIESrVHzTiYI9nrcm
 z3+sx/rgnZ8ASa3ZFc0avQXHEDhG6avI4iHNoulxKEHoEBBv2nNhUpb9R
 RUKtEaikeDg2oi0kS0fQ1ftGisVt0NwnHEmpyS1xfqCtQ6RRV8e9jflms
 AmXTEtH3xjEKkcsfOaFai0qQTouK0RBDDccAMnJFcykiwxasJoZozzazo Q==;
X-CSE-ConnectionGUID: jswVmJ4nQ9uuJAVDzgSx0Q==
X-CSE-MsgGUID: uXRFyBWoQpW0molsZObwGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59133657"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="59133657"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 01:34:41 -0700
X-CSE-ConnectionGUID: V1KsDcs+QV2rkxwNt3AoXQ==
X-CSE-MsgGUID: UzUwQ9/6SAOQBFlId5In/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="172922700"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 01:34:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 01:34:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 01:34:40 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.52)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 01:34:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r44VTIehhpOY49lUg41w7T904s3K0tWwkhOm04SnhDK5memoa3OII8kRljFOotsfQjV0D4YTHCc6PU0kl/E1jXsPzeOgtvDntLURvsr+Zsm11veD5JcrrWzeH1iE0EGCIWnarvLzTv07JrnOkgMHWPjt/4lAdCXzVzn1c8n+DlTVkuovYtt1DjX+hngSkcu456s5HsvB41zn9VU9YymZbAVeQ98D4Dwt9o6kCj6Gue7dljrBLc9x4HvtSdtaN9WZpi8WLj2CcmXqUisJBBxt2aYy7xwzzkAAJc6PuFfKjq5FRl0qlxXEVAQsoW0jxhZ0TTWsY4gg3DlRS7mdqBSqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HoPm+i8IJL9xfOaYT9fKk/1BavBv+ZkVHHBVHsMT/Y=;
 b=DjBpMbC24Jwl9gcGIvNgLokv3skdOeYd6q3Fmo2sMzyONEw16QFxkPCaoCFaXB8glN1aYKzPDmka6iHqPAcox731EX8yDjgdror0t6D6aOYiHKQvi206WLEHVem3oCgDY8kpEHl6l5lLAOOUF/mKQ3v/pck7qKDPerUKs0r/LEz7+JF6nS9FkbJvM2v/jsj+5wIMuJNiIXKlhYssfrzLVEI4UbbdPLxlNL89OqoEPhoDF3kFfbQor+3L4PHuQTHINPwJIBlzKZVtoRNAwBz3EyJVfKHaRw5vkAtdQYJRzcDMlRFIhpfBfu49gmMrC8BR+VHAlV/jlXUvfFFKtG70wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by LV8PR11MB8605.namprd11.prod.outlook.com (2603:10b6:408:1e5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 08:34:37 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%3]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 08:34:37 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe: defer free of NVM auxiliary container to device
 release callback
Thread-Topic: [PATCH] drm/xe: defer free of NVM auxiliary container to device
 release callback
Thread-Index: AQHcItjjv5dkUuvqa0ie4Nm0LtQBYLSNp1YA
Date: Thu, 11 Sep 2025 08:34:37 +0000
Message-ID: <SJ1PR11MB62043168C5C2CAC20EF19D958109A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250911052823.226696-1-nitin.r.gote@intel.com>
In-Reply-To: <20250911052823.226696-1-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|LV8PR11MB8605:EE_
x-ms-office365-filtering-correlation-id: ddd7c08b-7fa5-4a45-e93b-08ddf10e0b17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+jCuCTCOu9acWTCBV84/HejFSp7Nu0ChRpfbfYJ5uk0BBrxIz5W8chU59evw?=
 =?us-ascii?Q?//K8OBtV4oZXmBWmX+sgmA8x9xkLk4pggo84v2zyTJGLMcErejSjWZ2ufreS?=
 =?us-ascii?Q?v/j50OUqzYNQJ18bkbc9jqtJs7g1snR/TnOZCQ99jXGYbxveDqJN6TX/kmwD?=
 =?us-ascii?Q?9LEbMzl+cbkBuoJinanhRRK6CXI18n+C6Ry7T1S/9efCrBisPVKrtoW1rzxy?=
 =?us-ascii?Q?d/XEUeXmwyAOh9GyOxbq09WnMNGH19aw8/pLPBB5oL4ugigSQ73b5rrl/ThB?=
 =?us-ascii?Q?QXqgrDWpb0T44R/Kcxo5BJxNdu4vQgf1izL/hL9bwoUytg5Y0D1YHEIf70Zt?=
 =?us-ascii?Q?w3MpvwuA3Iw7xiPxHXK67vu7kRnPhFynCBOW2msKSsQIBsvB8m3m/xyVAsYC?=
 =?us-ascii?Q?3YQpDzz504dWU9jwqpBLPvqdhdSkusTggVVilH0M//28xKtPW+NXgOFjoK6Q?=
 =?us-ascii?Q?g+Hn2nME50+pqQTGWyPIHpTQFKU8B06YBblA83zMbkjma4pVQhduYsp4euZc?=
 =?us-ascii?Q?ECtMeZyriyE2FAZlQ9GTGtz7k/DzWIyOuidIg/qWtebtcMP+Cmq2BwfHrTXX?=
 =?us-ascii?Q?SEcQ5KfmPgVVHvLMqB+r1FRB3DQJTelqnmyHBtRfYs84fmxrgpFqn764yKiE?=
 =?us-ascii?Q?BGnL5ac5VGTkmaSv44BYbSKmqgrpxdK1NtSX+QY6rNaJoyRezI8+zwIDD18f?=
 =?us-ascii?Q?9NHAPiDaqEoJh6cXAeYGjOlR3ToPHXQlbrDwYCMZtsWCXXCeYL0l9kfigWm2?=
 =?us-ascii?Q?Oo7CbDnLLOpmhK0/YbX3rRVuBtqe6RV41q1DjsZMf8jAhVLYCIm4vNqUaWVx?=
 =?us-ascii?Q?4CT4HzioWtIcQhNCGbi0r4A165ZZhSTQf0+Wu3/UpWEKuj7t8u82qYCh0VGC?=
 =?us-ascii?Q?MEeKY1qchCrchruDlmSBZkLsV+bI44BRPZqj7BW4qmNtP0SQBx3UuYTe/In9?=
 =?us-ascii?Q?g2ALwPaje+2PPIcSku7Cc1WhloLmIfgN/4DOy5FPhPvdM67l+vBGNLeT+GJK?=
 =?us-ascii?Q?uzPE9RG6f9EwsQqXaMMALwNj25Qd8hzWOq21/NlnuGv7dM3MxyONHR0A/kYL?=
 =?us-ascii?Q?qDbl9kGBjcQkRLH+KUjKihGZRlt1tvoZEsDKY3qv6lPYsohkoFop51lwfDyL?=
 =?us-ascii?Q?NXWin1IjoPpN5XJBJh3qX+bN/LdDZ9LqlfVnn7wNZHKoh8/ein5X3kbXZhlt?=
 =?us-ascii?Q?MluAT4alzYmpIWt1Ehm5uFhVgYihpgtCZHpsq4ySxpkxtjI9Jo2NtRz8us7E?=
 =?us-ascii?Q?qJ2+HVkRbgBUmRpdA4I8lJYeS+BcT2Bwkm058GQTKMh5SqYr8bwKcmWs//o7?=
 =?us-ascii?Q?YrR73qfZ+QqUy6iQla+L4xaQwi0IITtIt3zZW1MivQdhtiVUY5y3yKGrvH6S?=
 =?us-ascii?Q?eUXM+g5zhJVKM5HIwnRJXyPOSSuOId+ChG/4ZWW57GK2TKw83Wqgy6w9qZXm?=
 =?us-ascii?Q?z9r6r+VIq1yvEHUqxpm4YC4d69GA8zsPtr3Ng0Wi46hFc8/edMcbqNXEazly?=
 =?us-ascii?Q?jDTvrNPIsbB+L44=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mpNsNg+2mKImxNWwzB++dqM2lfgmbWgbR23RPFKTqyNE375/dR9417+ut0MP?=
 =?us-ascii?Q?lD4k7okIYPeFoZ4PVAzaaSzDpC7/rOIxsDB8FJP6E2Q8xykxh1weLb/F1/Yy?=
 =?us-ascii?Q?llrdwZVIxGIoNr6hL/CrQxPG0Xvj+VqeF8kAsEd1ZpDbtx7N4st/Yxnp+mZ6?=
 =?us-ascii?Q?HSRi6vl7kUoXqj7vZ2fDtezYA93BGKtqNpZ7WFPJhk0XlwPNrGL1WTolK/68?=
 =?us-ascii?Q?M/HkeOmU6CwY2aP8JS/hzHRow7fCVg1PpfXZ7JW8qg9SWHPMFazuFO3omkFH?=
 =?us-ascii?Q?ZJtLMR3X3D8bBNpdEAwl1CPoDcRhG71xtqrWOrmzlrL1uveU9b3garAdraBG?=
 =?us-ascii?Q?jFY7PcwGWkngZMpzRJ7LuwJsNRyhAEd6vyC14151COPxqlPi3v6/SAP1wbcm?=
 =?us-ascii?Q?cc/+7K41BUb6MbhBrFCdBCxRooCnHzVkbg36TrnCPGKZlLRNjpY1vg2fQNi9?=
 =?us-ascii?Q?Yi3/PJpTexjCuJHp6yEc/1Aq0vCgcDm41PYovj/8LdEFgxU9ilc1wbwv2cgz?=
 =?us-ascii?Q?OJb+HkvgzGNTjpZuIlK3K1og6OKl1d1gr6GWQ76vNb0pHyuzRXbUj70l1uYB?=
 =?us-ascii?Q?XwXCtVStXYhtbm6UPld8sAlGAPfaWOELzsXVuk7vGVIFuMD2WiawHvEqVxSI?=
 =?us-ascii?Q?4GNj0AODOl74CaQEtWmah0xK6h2Zk+lx0VdYLSR/6yRPm0LeZZI68SCtznUK?=
 =?us-ascii?Q?pxnVJkncsgq7lcMGP/m9RJFQ94oAfr1eIg6xn2ES/hadxU4bvHKhgHPu0xlN?=
 =?us-ascii?Q?utp33XAIRFRV2dSgiOqOJgbMDSH5cpmRFfQ5rqZZkXh0BFLDvkk+iAK044Hp?=
 =?us-ascii?Q?dBQA0Sqbay6OPIu6GXkxfPLjf/dPgiVYw2JOuD36lvzV2aaA2nmnxqgFn+fl?=
 =?us-ascii?Q?Aj9kxwZ/2UK/o/bbdDO4+YXzOiPn4ZAEY3LoC2xlJTuMPY1bHMaBdHEVDOfM?=
 =?us-ascii?Q?UR+xkbVkjbglq1NjU54gnYR2xQ+Jrgev37zxSIjlGxkRX79eWU79zOZZAEUf?=
 =?us-ascii?Q?bCgWFI99aE/dRRhpW+3ebDGK9TYYO3LDTrJt8uh/vHmUEvlmKSGinnea03yy?=
 =?us-ascii?Q?2gnjNhqqb0YISiX1m/WO5AXGciN6I5N3YJtiJyolSjDr1xvejkd5YcahmLQi?=
 =?us-ascii?Q?nX/xdwpOj7OJYOk10O9VGk8lvIJBqkdrIztYU+VinV6vdLL0bI2E0bK6j+9c?=
 =?us-ascii?Q?dvaJjhnA/xM3xH6XTT5bQPaZz6f5VlT3NmVJV0T1GG8svd0pEPf/Ooime2aM?=
 =?us-ascii?Q?+JHVDb4BOjL6fqpUCzjb2HWVojtGa6t3T3vFUZhRfSqhcGKsJh17XUh2ZFcl?=
 =?us-ascii?Q?9s9Eej4Oygt5OcgTr0Yty4I7x25EpKMbnxoIquqs4YDMGOIk2IxEHbSOeYJK?=
 =?us-ascii?Q?gFxY/r9k/74u8guOSBOw9vnqth+7fIbHTgX2+D0YPKAzXGrNC/+aq9kX43tl?=
 =?us-ascii?Q?r0eTp7gUQFoqt4S0HG9IY0QYaFujS+F1IEFIG0qBZWO4Vjwbn/Iz9SYRaEJm?=
 =?us-ascii?Q?DH6OeZ0G7fhdl0VvLGTyKrDgMkA4/Pu0Z4nEUZf6TFhOCcb1gIZ9cTB6D6gI?=
 =?us-ascii?Q?6Mob8C7pVHb5h43lLhjw1rI9aZhsbL38Eiz39QhM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd7c08b-7fa5-4a45-e93b-08ddf10e0b17
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 08:34:37.4307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iLjot9IcgL0ZKuUjuoNbmnzAdLGoctds6X0Qa3i1GjwTtr+Or0Y1uO+iVp//Aonv1rKz4GQmTZG/vkEcmpbUudmbsTUvU5KjJnYgZskPidY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8605
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



> -----Original Message-----
> From: Gote, Nitin R <nitin.r.gote@intel.com>
> Sent: 11 September 2025 10:58
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Gote, Nitin R <nitin.r.gote@intel.com>
> Subject: [PATCH] drm/xe: defer free of NVM auxiliary container to device
> release callback
>=20
> Do not kfree the intel_dg_nvm_dev in xe_nvm_fini() right after
> auxiliary_device_delete/uninit. The auxiliary_device embeds the device/ko=
bject
> (and its name); freeing it too early can race with asynchronous
> device_del/udev processing and cause a use-after-free.
>=20
> Set aux_dev->dev.release =3D xe_nvm_release_dev and free the nvm containe=
r in
> that release callback. xe_nvm_fini() should only unregister the auxiliary=
 device
> and clear xe->nvm.
>=20
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_nvm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
> index 9ca4a5ae1693..cc8d7c6cf69a 100644
> --- a/drivers/gpu/drm/xe/xe_nvm.c
> +++ b/drivers/gpu/drm/xe/xe_nvm.c
> @@ -35,6 +35,11 @@ static const struct intel_dg_nvm_region
> regions[INTEL_DG_NVM_REGIONS] =3D {
>=20
>  static void xe_nvm_release_dev(struct device *dev)  {
> +	struct auxiliary_device *aux =3D container_of(dev, struct auxiliary_dev=
ice,
> dev);
> +	struct intel_dg_nvm_dev *nvm =3D container_of(aux, struct
> +intel_dg_nvm_dev, aux_dev);
> +
> +	/* safe to free the whole container here; aux is embedded */
> +	kfree(nvm);
>  }
>=20
>  static bool xe_nvm_non_posted_erase(struct xe_device *xe) @@ -162,6
> +167,5 @@ void xe_nvm_fini(struct xe_device *xe)
>=20
>  	auxiliary_device_delete(&nvm->aux_dev);
>  	auxiliary_device_uninit(&nvm->aux_dev);
> -	kfree(nvm);
>  	xe->nvm =3D NULL;

Why are we clearing from xe->nvm here? Its still alive! By the way I feel f=
ini and release are almost similar functionality defining destruction, its =
just that before calling this we should drop all references to nvm?

Tejas
>  }
> --
> 2.25.1

