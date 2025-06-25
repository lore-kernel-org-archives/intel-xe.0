Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD66C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 14:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29F310E74D;
	Wed, 25 Jun 2025 14:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dkp9sADH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAF710E74D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 14:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750862840; x=1782398840;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Uu0LoHc4N/UQLPIInqfBRkWtpFnkkrUO2sgGKgOVD0k=;
 b=Dkp9sADHWoII9PpWJN4uNUNbb190vDBNffkHG8HDiO63NclfbhGwKB7k
 blXmGPMM3Rt6HGPUd9HnBhCgI0mLf92oDQ2LDvE4n7RjjZVV4xxzI+JK/
 RMgAMDcOwcRmfdnZejT+EzSHbb3r1XJNfQRotE9Je7C6FxGRVhZeIIdJD
 syzqBGTLDttnUNddbMfCltKSvj/FsZcvTge5UqyM+j11FidG4/kk/W01H
 rbTdp4tRaPX8u4Wgpbe9TbCJxP9dI3PVRc9qt4o+BLW/m9BmUzdYE7L14
 kj2VdMGv8QihH2uPCZi/LBDicCxDyISTM1NgR7KXm8ibS2vbMVcDADTQh Q==;
X-CSE-ConnectionGUID: t5uU4Vm5Qmu+96Sn1GqZdA==
X-CSE-MsgGUID: QpF4c/8hSMyAu00ObTytsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="40755374"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="40755374"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:47:19 -0700
X-CSE-ConnectionGUID: n1EL22eHQbW2uDOL4V2vBw==
X-CSE-MsgGUID: RMDNEa0IQPCheAD9ce21/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="151854775"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:47:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 07:47:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 07:47:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 07:47:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJpQvpye9lsketvnUh7tZzKUTESE6yl6vnQNLyburSTXpYM4FoXIny7f2HwX/RopCTfjXk14i/J9yDnokFtuEADBPoQOHilFwom7Mflq15lPBR4WsPK+hwznri6nOoCVsEonhLOtZ1FnN1CrepZVUHTBvy1vjpawNbhAdc26zHnZsbQ/HWVcqqdcvyBJ4UTHrJfiYRehAlwQxSL9SqRgGgfr86K1obtOBKxpBWk4iQAhY7GtSO8DQX7pu9jfaXJbX/0l46kNbUlJNCo9t+eh/Pn4UkJl+jGaYapatFfgcJjZHygJbDwclBV1tZaPORFAJPw77jWQIwBGDvo0kH92Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtx8G2YGKTEKXverqLl0XP/mWG9WdjSIfa6FGDxWwG4=;
 b=T1THclzFweKf7RJ25WtHa5s3e9dNQPylqJ4VxPK9K3YnT0gt502u6PehT7/gxRGwRU6uHawjevJJDxNOpd/vvT+ohRYI6M0CeiO4BpJk2ep6VS7n8iFjD9Be/qmgTpgsswNnKe9VYgeuKiPghLcMkesnA/eLU1g7slgmKckxmRLOUb22W4ZQ4P+pR2/aVs3VZklnKjGv0uQQA3ErJTEyQuaCxdXR6AwkP9N9WG0ODpFRN0U2I0z5wfGjr5Kipy1hZLN/rE0/vS9uVCo3AM3KU7ztjVuEv+hGYPhVHTidlE9KpMDNWjm8b5Odr1S2wb2WI++FybRI8XtemRBTEgOEuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB6119.namprd11.prod.outlook.com (2603:10b6:8:b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Wed, 25 Jun
 2025 14:46:45 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 14:46:45 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v6 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie
 link state residency offset
Thread-Topic: [PATCH v6 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie
 link state residency offset
Thread-Index: AQHb5d7vSA3SlJ9sPUiTEGMDoXAOXbQT827w
Date: Wed, 25 Jun 2025 14:46:45 +0000
Message-ID: <CH0PR11MB54441FE7C1243F0C77D1A53FE57BA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250625143254.3505218-1-soham.purkait@intel.com>
 <20250625143254.3505218-2-soham.purkait@intel.com>
In-Reply-To: <20250625143254.3505218-2-soham.purkait@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB6119:EE_
x-ms-office365-filtering-correlation-id: e1c69558-89c1-4da6-05e1-08ddb3f71b45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|921020|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Sh6OpLXqeFa8Sv2KZmO9Dwpd5mZTOaMKjvbVdCp0wXUSxzNy6Kbrf8bDica7?=
 =?us-ascii?Q?1uipOaiv6OZjBdNpEtVIDlF+tszdMi9slq8ydoQNVBtk0vAphM8Fej76j3v2?=
 =?us-ascii?Q?UestKkZIvcb+65nG+zto9ntRscO/dxw2ngKYrAlzM42PJUM4JF9zlVCVRlyb?=
 =?us-ascii?Q?4ptT4xDh27/yw3YeGialSpYQLhfgvS+cAU2YgrAsUTSsXR6bQMdkS17hxxn+?=
 =?us-ascii?Q?WQomaqPIipmMVbVefxHea7cBY9emZhrdpExMeGPQ0eTWik/5xaHrYeAwuYEt?=
 =?us-ascii?Q?iR9RfN4aEv+74xAxzFkEH0d8MUdsZhAuaooHv5UrWDR/btAnjWCgig73519g?=
 =?us-ascii?Q?4RBLB/wcQVXTYuXbxxKPe/zHKVYgPBf7b2kfXc9f+YCjkGOmjzoaKV41atE4?=
 =?us-ascii?Q?+llswI99bz9zZ9KhOpwpDvPLU6BciMxuy/fciuamG83A32NuvM2MyWoji6Ts?=
 =?us-ascii?Q?r9ziWx3m9G48SBu3v5dlLPgu4CrVXUnbBYys0zB7hsn2OEEA7ryJNtnFUB1a?=
 =?us-ascii?Q?rGH0xAx27B6huv8xjvk5AygsoLZfFpfjlnFGLPdvEO+nA1zxuCIDqPKPBQAo?=
 =?us-ascii?Q?zAgCLC5UV4+aRGIQEKn6TMJaZ+08Ksb8DyQikjb9N6w0k+Bvg3BJvV5qyAJ6?=
 =?us-ascii?Q?OmE0CBlRF3jFrV9MQ7q7YUIe0o94mNVsRBYlYYSHT+BHr5pmRkyFP2B3CwwV?=
 =?us-ascii?Q?QhK7wF6zQpEn69HnX4l8fyik2nJg3jZvDU5X5Q8YYSKWVmSDT2FqFgg0lC8U?=
 =?us-ascii?Q?mPNx5laR6rG2e0rA8TFbDDlRRcR2r45OdVwv2yjHsQUPjkHwW2D4WZ9WUxmi?=
 =?us-ascii?Q?I01/YYlndQGSQ83WzsbW31ydwEDBjzxWeUEApE18W0dVE/N8O/nfVASq4rcx?=
 =?us-ascii?Q?j3w5cpGiosqZRv/LcUqQd7Jj6DNHw5Xl1Jguj4OPC9BxUsV7kozpPtvM/xUf?=
 =?us-ascii?Q?5T10eFO/Yp/4AFpgl1pEYaXN9mN+/g74eQZXp+2DLsU+r7WBj076fTrSAx/Q?=
 =?us-ascii?Q?RFTKzNH0ul2b0bfph3agdeWzX9eiypkhdEkkutT+H9ZeNbccWD7TnzqLteTj?=
 =?us-ascii?Q?OIpVg4hl2wU8T9fJ6LSYNGR9Z9bQAVu3tAofMC45isFdOl7q3smEXu+Xz3D4?=
 =?us-ascii?Q?x7sX7s+720GD609pUxX+ERpQLVN1Rl6GqRO3uuhkjY2ch7XrlT5aqg72iBuY?=
 =?us-ascii?Q?YTGrK9qC4gIhyyS3zPYR/oO+HqaqUgNZtGJUuWcm54gjf2B07QfG/2bbCwtT?=
 =?us-ascii?Q?9CwgTVCsmsQG6tjSVd2CYUdEvg2u/awrNkZ6GmN4n2cNKbMDKhmB4DMW/T1I?=
 =?us-ascii?Q?x7ztZCkUCAAQF90umKGJ7wBWD2qw/vAJJGh/TGdsjEzBQoIzaQucucJn3nuE?=
 =?us-ascii?Q?p4J9qjxYOEYezcnVICH51FIpMTWmPPeNi0feF27e+pfWXTeKJJA+hzwLojZr?=
 =?us-ascii?Q?GkYiFlnHknnlatq94iZ3MminvtLWH9b/YOSUNECRh02GEnI2KxTY3cZQH5w3?=
 =?us-ascii?Q?4JiH6LwahncaAOY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(921020)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?328/ii6riz9+/fTjrz8GZLmiL2W7XHWDvo0/Ru0gmqffmqzHRTLMtkTu3G+8?=
 =?us-ascii?Q?WpH9B4WZPivDGpf+vmNOzo4kDtQ134QvOOjeUqSHhyNq28olToWRlFUB8Ppo?=
 =?us-ascii?Q?P1vMSDddNmTIA3ISUr2FWn9b/pL4D5+qgh1crhL2XH0bo680ZBWV4giMR26o?=
 =?us-ascii?Q?N4hrT2cxpxYVBnNAjIXvRuAkd7oCABoBIReWOTf8XfBFdOPiItQKc+Ib7TtT?=
 =?us-ascii?Q?RUl2NbulmBNDKIgYTsQWLB7vUP81rvhb5NGdicFBm+9chuJpDvNOCJgFXUzs?=
 =?us-ascii?Q?691QoxvjhWvVSASlQ0QUiOG5MGY0ThkKVAqAy9fLGFSwpwBIx+Lj+tFVGljl?=
 =?us-ascii?Q?aNbn4YlNNoj3lf6yoLTLBErxl90cCLOUEbhiEXcFH6Z6ADe2372eh41X8SXB?=
 =?us-ascii?Q?F1SC0IG5Jq0dKeZzhUxOLhjQGXS2X5lkmp5YLiIkrGlK9SH05cN4KzXruzNR?=
 =?us-ascii?Q?D8By8DIUllAtmlPhnmYnWmwUfFUZ9lVXt4hvt+5SAeHLxJVBZ4FgHLXEWobs?=
 =?us-ascii?Q?30qUIq3Skz2P3wuqVmcXnQGKULcBm7ynt9ekdzI5jI7mjagn6L3ILX0ExmOn?=
 =?us-ascii?Q?wgTOMrDpMFGC8ma+Wk+O3dXRICtF1IPIhcOh3DFOrObbZJer2EraW4m1HQI9?=
 =?us-ascii?Q?tm7oY/vpOHg16CoTDh9vnwAe8s2EBjnBSOEJC7kUE8jq9vGFErOBjBLRxjRm?=
 =?us-ascii?Q?Pn1GCaSKmNiDEezs1K/fPnqOormSB/r8xNRmdWOYLKNiZKBEYp/hoiE1QVfU?=
 =?us-ascii?Q?30elXkLRCwa+R+oSVaSWQiEuoiL7iL0Mj8jaJtAiWKYVrfaWV5Mf2vxzbNI8?=
 =?us-ascii?Q?p6LPIbQU4l1cG8litLCsC/qoaA5Teoabu1+uSl4qhS3aPBzG8eNOCqo3wj+A?=
 =?us-ascii?Q?833FIwQAAdbWUDJlPBhCqeLP6YeBGGHUb9tuvnd3A4+F/h4OkJi7XTVjv9/n?=
 =?us-ascii?Q?7P8eduoQdU6kFwe/Aw6SmoMc7oZsqK2Q9hFKO7yoTDbIhp7+CmBXqQrTpu6x?=
 =?us-ascii?Q?TyIHHxghEUonzb2cnHZx7QZRP8kdRkXyNk6/YeN7rqj+xlmkWjc17zshuVo3?=
 =?us-ascii?Q?6i06Opew/lHaNtloo39byAtcXXNDVsYsPtwHirKT7Ys2Z3kFwcdPkJsRL9Qk?=
 =?us-ascii?Q?trfEb8nUGOlB6CfstLX8d8offxTUMQek3zFoPzikyYOG+B5XEvcJTqQGfmig?=
 =?us-ascii?Q?lKQ2Ov8ILdncDdmN2t6qVGxFKObZbxa03N0TMpzRGbkmYLZzsdOrJ1P+qPDc?=
 =?us-ascii?Q?xtTUB/daJwvqvZY4kHfiuKTrkqQIGqp1MMU0tvoJqqqFSvVazXZfnqQ0x5ZL?=
 =?us-ascii?Q?pE5FLPL3UHgMiTA6vn63nrGqV00zNRrd55pc5hU5Ont6TXP6cqqzZERnLYUC?=
 =?us-ascii?Q?GYeBZxopzXCWSREeZ3dK9snJ5RFprRStvwOjitwEyDSxS5F5YVzcMlZMNNkN?=
 =?us-ascii?Q?7zVWGiMK1VcOVE49A8gMfA582azqahVdH54UC2teC1hJe+ZTqZMLMUQk2yAV?=
 =?us-ascii?Q?bkh4QJnCJCYuEo6SPxSUoTLv72howQny2JmvkZOQHvuSmvorzXrXT1bUc2iP?=
 =?us-ascii?Q?neAse3qARdc5iHLibSKb5wtVxzsRLondMff1NXT9GHsMAxYlGr6aKt4hocr2?=
 =?us-ascii?Q?EziucqrLYQTE52dzr7Q5mvK8OW6sf09a3Q49l7HpDP80?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c69558-89c1-4da6-05e1-08ddb3f71b45
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 14:46:45.1943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: skxgjUgVEkC95flkZKJpZOY1bFmL9NP/akgi5ZIodOR4hMOFcfuNhAisEMoc6QjvS88R2KjtDUQtx/J+lx8anDHlqAYqRq73vnohe5Wz34g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6119
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
From: Purkait, Soham <soham.purkait@intel.com>=20
Sent: Wednesday, June 25, 2025 7:33 AM
To: intel-xe@lists.freedesktop.org; Gupta, Anshuman <anshuman.gupta@intel.c=
om>; Nilawar, Badal <badal.nilawar@intel.com>; Poosa, Karthik <karthik.poos=
a@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Cavitt, Jonathan <jonat=
han.cavitt@intel.com>
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Purkait, Soham <soham.purk=
ait@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>; Nikula, Jani <j=
ani.nikula@intel.com>
Subject: [PATCH v6 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie lin=
k state residency offset
>=20
> Add G-State residency and pcie link state residency
> offset macros for G2, G6, G8, G10, ModS and L0, L1, L1.2
> respectively.
>=20
> v1:
>  - Move offset macros to drm/xe/regs/xe_pmt. (Riana)
> v6:
>  - Mark MBG to pcie link residency offset. (Anshuman)

s/MBG/BMG ?

But otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/x=
e_pmt.h
> index b0efd9b48d1e..34f5bfdffe46 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -21,4 +21,14 @@
>  #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>  #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
> =20
> +#define BMG_G2_RESIDENCY_OFFSET			(0x530)
> +#define BMG_G6_RESIDENCY_OFFSET			(0x538)
> +#define BMG_G8_RESIDENCY_OFFSET			(0x540)
> +#define BMG_G10_RESIDENCY_OFFSET		(0x548)
> +#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
> +
> +#define BMG_PCIE_LINK_L0_RESIDENCY_OFFSET	(0x570)
> +#define BMG_PCIE_LINK_L1_RESIDENCY_OFFSET	(0x578)
> +#define BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET	(0x580)
> +
>  #endif
> --=20
> 2.34.1
>=20
>=20
