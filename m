Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C88C3ABC3
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 14:56:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFF310E266;
	Fri,  9 May 2025 14:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0K49uwE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5821610E266
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 14:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746802573; x=1778338573;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O3GfdveKLx3gOcQCZpHDizbacghooQwEJnavgCdqJGI=;
 b=M0K49uwEG3xis1lEySjdd5W9SO4ip57Cvvk9q0xKyzaA1HFTa0aZce9v
 8pNkfupK9cpVhysDO2i6kNTssKyZF032zRxAOlYekaqAKtMMmyq1wkSuH
 NgYMZbQvTX2FlZ/M0PEDDo4+nvgGOZN0d+C4zcLtx9YNEVUakXV6IPEYE
 N+kVU0DJZTqztMYXAhOG5p6TmZvihqFAe2DLCyXnQIvLX/+VBjH7Ra2fb
 zzhygmb6mv1bvgDmB0Qi2Zro9o12XdsQ2a++bHkG7a/20+1Dfh3xagiee
 5OvbmYolEAcxS+OOjt2dKtPYQauoj4PMsuO8dNr7hAu3ZxVsyjdMAtN+b A==;
X-CSE-ConnectionGUID: oC2qvhbkSB+DbTkcbT+Pgg==
X-CSE-MsgGUID: 3XGmzrvIR0C4Yfosbc2klw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66167697"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="66167697"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 07:56:13 -0700
X-CSE-ConnectionGUID: BYxfETLhTbCaAssqCYyK6g==
X-CSE-MsgGUID: 5OksoQy+Q/C+0c2drKaiyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="137572441"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 07:56:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 07:56:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 07:56:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 07:56:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPX9j6D+FJMI9Rlt4Y5KqYiuF/YkHT1X/RJ4eeMPtMX3oaOSnspgr/s0GyujcbQFe+zS7kg6aWgwOImwx6qlYAy/kdukZJsjAc8xaY6yMEhVRkKQY3J/cS/WjdCzKJXlUwEQpAubKiN2W4h0CxDBODOKERA0bkb3yqp+IiQICdkAe1GQPmgAI3SYp3JhEgnI4DBXzhjoNRYsVQcWMEp9/4kCDA18+sMTL8O9IIIuQWRWQZXnjkViUskB7znw3rHcD5wfQ00alLMxZHRzPgS76Cfaz4qPyZTZsrfzo3GO0c79rYtYp79k7XN9q+09PRhWMP6bl2aJiKceDIsyYZLanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/Ck7+zcf4QZtMf2Csq+Kp8BScY3V6xpbbRu5IpV7vc=;
 b=qik+jkt6TguPuaklh70C7R6Z0NCO3fvTssTUqAFQERKLxr3v0gA1b5Rlq5dF3ONZouU6dntvWH6Xse2HiDFElLLL9RkA9lT6aR8DgBVMQ+8L87/68q8S0GL8AhyDcIx1nzqlKtfgFp3pmsdzFz3zinujjTGNgYnAxbHylyxelbKsSXeRQqEujDs8Yv3fcdD/GRbQGIvuwT9GxH6TXCiFATbXGwCcsR+3/3u4w5VzhVgI+LALtmMsgz5Up1iK1+qAK9IhULCex2Xz/l7G7QU0XdoxPzSh58EN2Qp9ADGiSvGkdJEPGHZuMvR0RR826UKlV05tXuYIDueyh5YIBVSYMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Fri, 9 May
 2025 14:55:28 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8722.024; Fri, 9 May 2025
 14:55:28 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Do not print engine reset message on a killed
 queue
Thread-Topic: [PATCH] drm/xe: Do not print engine reset message on a killed
 queue
Thread-Index: AQHbwEyQeNE+NGCigkKNU25Qhxw3Q7PJQAJggAAIggCAARuNoA==
Date: Fri, 9 May 2025 14:55:28 +0000
Message-ID: <CH0PR11MB54448464A54AC5A8B1527D53E58AA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250508190920.1343610-1-matthew.brost@intel.com>
 <CH0PR11MB5444B702AA6676DCAAD5BA49E58BA@CH0PR11MB5444.namprd11.prod.outlook.com>
 <aB0pZmcGVFHSRb6y@lstrano-desk.jf.intel.com>
In-Reply-To: <aB0pZmcGVFHSRb6y@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB5142:EE_
x-ms-office365-filtering-correlation-id: ba8ba29c-842f-4672-f437-08dd8f0989db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PvulzWhWReQnjbw5hBU3srqKjwukEcZAXhzkZN2OkfacOiBG7WIscETwlGE5?=
 =?us-ascii?Q?nnfvDmRhmfhJEb3PBg/0WjZB8RQ+4kwBF3/Tuizwxnb6wqfm9yITGNtzkiXF?=
 =?us-ascii?Q?J72PuvnXXAvCCljWAjzhtaUSjOCBfvTvoXQIv7ItEONBxjfbEaKzosLB1m4p?=
 =?us-ascii?Q?07WeIOd4KKAYCv8ArYcC9xAmJlhJustaWRl/iMH/JZEcOBd/IuROAF4lpU+8?=
 =?us-ascii?Q?rxGG09ndhjNP17nH/l8c6S6XMOU3JAS2cOGeWTYSc7se3gkmyR2YcYGi9jIB?=
 =?us-ascii?Q?/ddxgDy2VeLlhkW1JQrZ7/g1kcatlBZZRV2r+h5kiDU+B8fmnzrKokXOzLul?=
 =?us-ascii?Q?WfuStDwsnDdiMTEX4PwslZMrXBUui0kiqBjk9reukpuVbk1Z63e4Z7Lm/01e?=
 =?us-ascii?Q?XgzhA/j8OLsWYZso64F6vrwB3WiPa5YFLp05N78yvg0GUFgN30xC61IVpHzG?=
 =?us-ascii?Q?/Vz7wbqDFtD4FpcOF7YWzeIOiKrH6odMRkSexEF3Ok05SjHO2Zx205AuqSoS?=
 =?us-ascii?Q?MJiZUs5GknwJTPq+Tm9j6fcI2QzngQTsiotV1EvVaWay+pN5vrkp+tuIoUr4?=
 =?us-ascii?Q?uJqry7fRbebhapsNp+3uSlRPkFuG1An3x5RwMVJpoSpJ1tUP7kYLrrYNrXM4?=
 =?us-ascii?Q?BIDItfefSvv4Xe80U6nmgWsNv+dkXLpWgIkMZvGn4qzSj3fYsfx9fWbCPKVk?=
 =?us-ascii?Q?Vygsl5Cn8PNNgCTTHurIy9iMI2JzJgiaGqPZFMbElWiMADkoMBUwzazvW+MV?=
 =?us-ascii?Q?Lzw50MQnq60uVK8/VhVIdpmnCCeYcBWNu3nXqE5Yu/X2HOVpisLnjJLLun7W?=
 =?us-ascii?Q?Ak5irp+9/cFacVanAhx++Wf3DNUZIvuX2lMOpmOPL+sTCXPP3CgQvU9UvdnD?=
 =?us-ascii?Q?lNwaJNJER1uPf6NEYYM7USxTqzB+Q6WJKRHVZoJEBYZFACRkSsVNY8gSBCNl?=
 =?us-ascii?Q?w05Rnl7PpoMJYFM8JtRR/hQlUeioADArTXcKcHKZIbA7TP60xXqgCPCdJhwP?=
 =?us-ascii?Q?NBlJgyW7mtXumYkZnH8RXZlxPDl7p4MtlaiQSRsd5KAU2crLoDXrPD0XUW/X?=
 =?us-ascii?Q?7fbBqje6UhBxuTCP3D/wJ9NaLyxlz/S/MOAjlYklACOKIKjddER0TUf1AwEQ?=
 =?us-ascii?Q?7TdQNMitwa5UNdBkEefZxln5fTfOwcPmPVSnyIPFYBw5MBeSLnnvLSMX0OzZ?=
 =?us-ascii?Q?Wdn4PS0ciLZdXMZvKC1ffBeKgvD1UnGhvthl673EmeYQSER2mwTK6I0/KDaQ?=
 =?us-ascii?Q?uRqlOfCgDshGScOWXWw643iRWUrvea54vyXDoT0NTkoU+BRRm+3+W7Wr6bCk?=
 =?us-ascii?Q?R08/5pWrUnZ7tfC+GX9Innp0s4qRnjUIKmN1HH77c3CWEC3wLqxL7Yf/vFKK?=
 =?us-ascii?Q?sB7fchrUSAOqh+sfbP+IoV3VnzJgxXI+Tm+6JFQ69Fi010Yim23/aeIEFWtd?=
 =?us-ascii?Q?YG2DeCksCCg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RF4+w2550nX7k2tgrde0pICFJ365jUQRsvx15xxZBxgj6BBX56mbfu4Btb5/?=
 =?us-ascii?Q?6jdxaTJTv48f1vBH8Hekez34r49JR0buUE2KkqB7GEF7yZ+NsegveUGEAzBq?=
 =?us-ascii?Q?C9Mbd8w6Hh0XmfUad6VSx3Mze3t6R/6MmMNbcl4lBDJFEoyIMe9z0/6Wb1iO?=
 =?us-ascii?Q?iwqM6/yYuI9bZ7KkxdvSiAyHzMPL/pDGeKfoDdMYvqh6t8BfdxGPynku57yY?=
 =?us-ascii?Q?khmPbMwCUuR+zLgPL2+c6LfGp95HjG5Z+E1clnORA3hZb1xte9BL5LSU1y3D?=
 =?us-ascii?Q?vqJeFRqInaW8KpyNlRysgFbCiwiCfB4EvQU52esLRG4zkBTWDEHSlNPeO2xf?=
 =?us-ascii?Q?FIiaGCfTYi7pawhxTd/LNYxCoPDQI7u4olKiYALWKMuqZmtuwHfvSe2F9L/4?=
 =?us-ascii?Q?tCf22LslsSWzCC1s/gNkLUP9wyVym7u09B34cy2W6el5gJx7cmiQsfzrG12U?=
 =?us-ascii?Q?1F6MnDSdxBeYQut8u9QetFyIqOLCoMSt6W1XQTg9YKnm5dfXrUb0SCAKqvqO?=
 =?us-ascii?Q?eY33DS32CSB89tatryMksW+0bYKf6IiSN/9ExAnQu37IzVX9vrT47O9u3Wlp?=
 =?us-ascii?Q?cDzC/CTOeCM4jh3/v7O6P1TPj1GAWcUQJalVLxU8Jh1tJaMVgIw992ofR81Q?=
 =?us-ascii?Q?C8ZAYvgHkVnlFAghTTbRKzqtyy2ffeXq5JzIPUvGrvBwyUhmNAQZ0j6c1HaN?=
 =?us-ascii?Q?iD9TxxlI+AWjrSX/znvaDmbAEcFBsRFCX89j2zLFuZANI9zP75rLb1+FGndJ?=
 =?us-ascii?Q?94TqNYngU5TjqAvAs1AjvqhQNH3otj6bifBakRTFAHapNd8vWXZPAeqmEU4z?=
 =?us-ascii?Q?2gOnQKY36oZm+4erXOJkmQ2Uhm+Fqb2bZJ6BLp5AIuUQmD0RjtrCp1mqauLk?=
 =?us-ascii?Q?jaUivnuvI8lsrkUzMhnjLLUk6i4kc/ENxXghHgokzGn06v5KafmCHBPRv5sQ?=
 =?us-ascii?Q?eIhgKwROxkHRb8JppPomaPqC2bawI0alMv2zWOcZz+3yUHZDmX5+8DNeOw9P?=
 =?us-ascii?Q?UFkYnAfV4HGTyeSnJCcrgpCiKrvfQHkSX2UJdYdl2i8ou+UFOPR1I7czKTGL?=
 =?us-ascii?Q?3Sb98oITa5yw0dwqWDCKbA+QXsOmuN0chtMOJkptQU1o6d4UppbUsB4+gv1s?=
 =?us-ascii?Q?pChE4Dl5GvKVI/dzwMDZq4wRxr096OiYOpYsqwoVkbDNeIkdDHYg5CWK8Bkd?=
 =?us-ascii?Q?VBf5OHQfpehF53oOrOHaSzZzkV+6ZQ/p6UlAUAZqFiwMavEzujOf5z8ynsGj?=
 =?us-ascii?Q?GDXC55Vo05E0pXOYlM2YJu5V9FpONQO2SctUfea9dfAdmzf85gCDwOlg3dtX?=
 =?us-ascii?Q?wvzJx6wLrI7yRX+DH9HA7Ytuxt9oqa8ZMn9elTfWI67rcssevo+8MWDSTMfo?=
 =?us-ascii?Q?kQQlsvhxKmi0jfmPu3enx+/x98Gtx3T+bRH1VQ2EFQsXNUQrTWgSoyf/iynZ?=
 =?us-ascii?Q?zbvyM3c3hxR1/dafBWnKErAKE4BIxfpgFY8PM8uDH+L2jkGT9m6Hreec0txO?=
 =?us-ascii?Q?V3GYSbJiWYDnc8Dz6TUd3H8DdM3asBqu3KB2tu7GiQVIIO0W9B2YsoGfVxJ5?=
 =?us-ascii?Q?MAveYASumyYyER8fmXfkGVCX+TtLoObHWaQ16EwF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8ba29c-842f-4672-f437-08dd8f0989db
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 14:55:28.6454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uVmIXU/iFgvl17WR7Ln2l6vpLDFbz583wh+VMZkUkAWdFcxsgz0noG7xGAqzdDli86latYX5Z+edzV750TT8XQn5lifMtrnTIqz/ehKCqlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
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
Sent: Thursday, May 8, 2025 3:00 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Do not print engine reset message on a killed =
queue
>=20
> On Thu, May 08, 2025 at 03:36:40PM -0600, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ma=
tthew Brost
> > Sent: Thursday, May 8, 2025 12:09 PM
> > To: intel-xe@lists.freedesktop.org
> > Subject: [PATCH] drm/xe: Do not print engine reset message on a killed =
queue
> > >=20
> > > When an app is ctrl-c (killed) any queues running on the GPU have the=
ir
> > > preemption timeout set to the minimum value and scheduling is disable=
d.
> > > If the queue has something active on the GPU it is very likely for th=
e
> > > GuC will trigger an engine reset resulting in the engine reset messag=
e
> > > being printed when this is fully expected. Do not print the engine re=
set
> > > message on queues which have been killed.
> > >=20
> > > Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4904
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/=
xe_guc_submit.c
> > > index 369be36f7dc5..efff462ddd75 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -2005,8 +2005,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_g=
uc *guc, u32 *msg, u32 len)
> > >  	if (unlikely(!q))
> > >  		return -EPROTO;
> > > =20
> > > -	xe_gt_info(gt, "Engine reset: engine_class=3D%s, logical_mask: 0x%x=
, guc_id=3D%d",
> > > -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > > +	if (!exec_queue_killed(q))
> > > +		xe_gt_info(gt, "Engine reset: engine_class=3D%s, logical_mask: 0x%=
x, guc_id=3D%d",
> > > +			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > > =20
> > >  	trace_xe_exec_queue_reset(q);
> >=20
> > Hmm... what does this trace do, again?  I can't find the declaration of=
 this function in the code for some reason.
>=20
> Yea, those generated by macros in xe_trace.h so grep is not going to
> help you there. These show in /sys/kernel/debug/tracing/trace if
> enabled.
>=20
> > If it's also in charge of printing additional debug data, then we shoul=
d probably shove it into the above if statement as well.
>=20
> I think we still want the trace as these really show us everything going
> in the KMD. Here we don't want to spam dmesg with can expected user
> event but the trace which captures everything should have it.

Understood.  Below R-B still stands.
-Jonathan Cavitt

>=20
> Matt
>=20
> > If not, or if there's other reasons why it needs to be run every time t=
he exec queue reset handler function is executed, then:
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > -Jonathan Cavitt
> >=20
> > > =20
> > > --=20
> > > 2.34.1
> > >=20
> > >=20
>=20
