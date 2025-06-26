Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BD3C7EE33
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 21:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D7910E917;
	Thu, 26 Jun 2025 21:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EquVrC3b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B8A10E917
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 21:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750972818; x=1782508818;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3yyw2MQikTrFRsRpM3VgSwaqchFqPWkaZH8S2N6XLUw=;
 b=EquVrC3bw8gR4XN/aThoVBJ+REl39KBZE/9EOsbBShP4E7AztpNcwCHH
 yXBXzfkSQmo7KS7T8+Pb0B+Dtxn968TkuM2lZP6+lhzOfpDp9MNdTmfu6
 /XbK5W6dO9K3rdop/5uf/b1U5vLAFJOQBFIeTb6/CSZUEG8gstgJpT215
 /X5mlm/VGUxZ6t+2sjq93S2yVPljQroUedlTy2AH1U7IlusOshkWyRyn+
 CzqDsA+DDFw3bjB73exWXjTxZgVTGiP5tG09gl7rujnTM/6WT1UecWQ/3
 YPsSEqLBAEbyG5JWkRBTHaOGOMLxpadVxV2KjK//fxJVllHDE++DmwEyt w==;
X-CSE-ConnectionGUID: VKUn8FzrQtyi/xeZ3R7Azw==
X-CSE-MsgGUID: mkp230XYT8Kdv5ne1Dsd3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="56963033"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="56963033"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:20:18 -0700
X-CSE-ConnectionGUID: m0PkHgwJQumYKAR8MK9Uzg==
X-CSE-MsgGUID: odmuhZYMRni5mczWqvvSyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="157006366"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:20:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 14:20:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 14:20:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 14:20:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixNYUrxXY/PVC76yvnOBw+h92PNn9TzaU6NcEOf3G4nvc4yuhkABgR1MmK9EoWNuFTiZePlIpFEUtJnnmZYn4fOn8iOFID1+2013mSbbUlAvWJOTJYVrD8PG9oPDzx9uN6bQYLyDP+LvptNzFTV6C7KbBfzu0ibaMuj/Du3ZDIe13eP1chLUbJfCnDNCtJZFC9r+NtzSnkMNMHrZ7GuHGRDJ9q3LqQ9aCwy7RIFsElZkvTcf9RNyYXyxcnQNX50WuejN5x72++/CpZXOuA8vIj8swNJuUta+A8aUMNyqdynatc+0ZJuEP5ly011eKZ2qzQWyW/ED2DW34ek4e2rThg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7AVJXdX4Ki614nf9+sgAnrZ0a62lwkh0A5P6ePRa78=;
 b=VGVbcl0f4H9gEljiSYAqDZ6un9vdXf0iPwRvpLMxv/DjnvP5YS76cJB0YJTVW9sV9FcI5MusX7p7BDEE1ZoJfN76xq2FHcKwKNwbRfc8ge8P9kAAOnra65lLo02hW42Njtoq1+5wvompiMc7jWMVBoJtJcBFchvfJ+2i9mVDzqPSNzynSoo9AYAiBPVrBXnonWSCqgbO8kwMczx0HXHQ09m1iVAuMEj4s/OvbbvGAT4XW3OfS2rsQiLXQYLYcUTTwBYOm3oUv6q5W798dgo8LR4rFCqko35YS5Hc5stFjij51sDflKdQSmcI8Hf+p+KOn/V+ELjSdGQDTfe77bLe1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by MW4PR11MB6738.namprd11.prod.outlook.com (2603:10b6:303:20c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 21:19:59 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::701c:c42c:4440:5420]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::701c:c42c:4440:5420%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 21:19:59 +0000
From: "Yao, Jia" <jia.yao@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Nguyen, Brian3" <brian3.nguyen@intel.com>, 
 "Zuo, Alex" <alex.zuo@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Patelczyk, Maciej" <maciej.patelczyk@intel.com>
Subject: RE: [PATCH v2] drm/xe: Fix out-of-bounds field write in
 MI_STORE_DATA_IMM
Thread-Topic: [PATCH v2] drm/xe: Fix out-of-bounds field write in
 MI_STORE_DATA_IMM
Thread-Index: AQHbzyTK02qF3Skq20ea1rjsn++aoLPmy0YAgBb53wCAGBYDEIAARdmAgAAAeSA=
Date: Thu, 26 Jun 2025 21:19:59 +0000
Message-ID: <PH8PR11MB804091392A0276F7270D840BF47AA@PH8PR11MB8040.namprd11.prod.outlook.com>
References: <20250523150418.168362-1-jia.yao@intel.com>
 <20250527163050.287042-1-jia.yao@intel.com>
 <aDYDsozeWc+kpEfV@lstrano-desk.jf.intel.com>
 <DM4PR11MB5456F18EC221141CB3388FE6EA75A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <PH8PR11MB80405061D209DFD27B39DE50F47AA@PH8PR11MB8040.namprd11.prod.outlook.com>
 <pd75v3ytcxr3h4tnallo6fr4yka62dj6r4yk3xbio6m5ypm62t@dumhlqpjx4ke>
In-Reply-To: <pd75v3ytcxr3h4tnallo6fr4yka62dj6r4yk3xbio6m5ypm62t@dumhlqpjx4ke>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8040:EE_|MW4PR11MB6738:EE_
x-ms-office365-filtering-correlation-id: 78699256-bb59-4138-3e97-08ddb4f734fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ayTzFB1Ztvg6FCg/9ih8zDKBTSYn8mGf4cmFbs99PpgOu2M5wMaq6wJQBDpg?=
 =?us-ascii?Q?XC8LvAvTlEm7XUtWzhCZ6uxpVKgCh68dOrKbuvXOetx0932sP0iG5R5RhFXQ?=
 =?us-ascii?Q?zoyfE3YCgCHL5D8Y5OmZj/hqBtHyDE3td3TXorSgk4ofIhlCKy+QiJ3BIy/0?=
 =?us-ascii?Q?TR0KD0V/KaPuWhAGaMJJrb8F4j26FMe8MK9j4pGGoJo9tBrDo5mI++wJYj8i?=
 =?us-ascii?Q?UvQUqwy+FiiG+GchIc0TOQLX6422YR4bg93y4CXvvEHG2j7PN4q8LH4A+Se0?=
 =?us-ascii?Q?vUnNjGQWHOZqs9/VeTbfOD90gAaGKHWjlHMGz72P1R5HP1+fHhaNBc606T2D?=
 =?us-ascii?Q?QA1UN9i7jXGGwcEKdoM7qzAN9V2DuYzVs6AQIjo6H8ABShK50w4JLK5Utfpc?=
 =?us-ascii?Q?E8P28fPP1kilZppbAqywwrqi4EXLO1Q//gnIYBGFpnfIkvb6WYBaq0vcO9zk?=
 =?us-ascii?Q?dBFAmKzrzM2Z2F+gH0QzmA5z26X9t9x/PMARQxZ7suj1tWnyAMAF7Cf0NC/h?=
 =?us-ascii?Q?UGNBx4CWNK8rH0iuOcAZrgU8G+ITfexB98v6jLDlp7f6Dh/KMWakHr+xWgrL?=
 =?us-ascii?Q?m8XASuNDkZKyxZFTiNP3s9139ZEoNpftYO77Anx1dmKqBn1fsFqXGmxgPOtf?=
 =?us-ascii?Q?drwEfVWvDRw2BRCCuKC/laE8y2gzuriWLEvFQmgDshGBXlzumWWE0syvRMJH?=
 =?us-ascii?Q?ytWtIar31tng8BgmJBOrETF2qH/HvjFzj1WYAPFNOjyYD4IM0WgTjU1HEgb7?=
 =?us-ascii?Q?Y567/y4MGalemOBccCo6YUdOaUBCTgsGWEvfSUm5NQ6r++8/s/f1IKgnqT0T?=
 =?us-ascii?Q?Mx/cPhZffxHRgiOx7GvAVuEdQI7Wmrk/yqDynz40yMPzsHLvO6H8+66dxH7s?=
 =?us-ascii?Q?tatOsVqh1WltHZ/+3hcMSVVBugliSV9jZUD8aH0NyhAS6K2m86ZlhThJfxSR?=
 =?us-ascii?Q?1OiM4hkgnRk7nwtSDOUZTmrzjLzOu6MuYlcGR5wHr6TjZrmXxB85V2Me4yRA?=
 =?us-ascii?Q?g9UJsOGj95eoEODrcuN3dGwqPALK2wHVaIX7Ha26E5UKYtB3DjoCxCVkpnrr?=
 =?us-ascii?Q?g2b6+AQNM+v7mSSSB+HuMGKMATE/NM+X1GMXpzY3s8kqwgYAQ91e0dBdeTd9?=
 =?us-ascii?Q?Ifxx2R99yS8nTl9wmxS35wOJpu+1AW7zNGQ1YAZGfQZUgXuOy8vaZgbMx861?=
 =?us-ascii?Q?9MOYd5ZQQdEGzPvU9OghuUjYXovF3oUehAlnl4HbRwAWorV0e5xm61mX/9KQ?=
 =?us-ascii?Q?cU4AXloPsQaDG6THNs6HUWOYsmeOx0fbbU/GKuBkgrrNpBDCI7O6i7rMsjmi?=
 =?us-ascii?Q?/XRoD16qTOPl/Grf33Cu7Sy1LCsis/xsTUQOyGD/xJitLQ04gxuzGxYzYX6O?=
 =?us-ascii?Q?6UazpQfEPgi4Cz85z8g/6Fkvz4dcL+xEFbZfETe2owpmei+y9y1kXNEmH5xW?=
 =?us-ascii?Q?FKivWi4X3ivuf0MXA/moJAKb94aQJDWxM64F9StBt6oH+mQAqjvZvQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8040.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L/Inq8EsKAsWNX6w1WIo6OysfT/LLWsxNVo8rmKtznr5Wnf0CyEFW4k4Qzfg?=
 =?us-ascii?Q?Wp4ThnneOKhvRvli+B38GWz++6zI9d1o7KVa8TaCFTvAza1ihT4lBkmBx+rU?=
 =?us-ascii?Q?g20ZDnVsdQ8UscycF1Gfrk5xUwui0ZVLhGYuRuDavabhxQDMPBjnCFsKkMer?=
 =?us-ascii?Q?L6KUUZTt1aOyErzllXawn0LQg0KzD01u/QSsO6fK9tZuURoOIJ3MYbSciJsh?=
 =?us-ascii?Q?XF9wttWA8hFgpkPr+kI8x0Z6TLnootVXavYt/xLvTdQq3oT1UYEyORu8ftcF?=
 =?us-ascii?Q?zo8SkWgLXX/fr584fiKJFWpqxpidY247w9/9LNWGKhSyXbRm6dNKWcrN1XAu?=
 =?us-ascii?Q?nKSVhF+g90cJkvdr9TiEArjtdk8pX4z/BFIJzHG3nu8kNj5IqSqqU2vyV+gY?=
 =?us-ascii?Q?A+e3kg3MrS2KisjCjZuC5MCi+houB8d76Dj1GMPbcA5lOsi1MHluMTu09H5w?=
 =?us-ascii?Q?fKpVSJIfCDEzn8XxB7mrux+jJ5UWgeIEsSHSXtXRGhHPGH7Na4BmSLup+LfH?=
 =?us-ascii?Q?mPFkW18D5SVM1fsfpDWGt1+MZpREayCrTWg7ioOQYw3DfsmNOPXNMXpmNolt?=
 =?us-ascii?Q?4CBBJ4hTYKqIHrUOnx/x31O+rgiD+C/a2l0BdI1Ezp/xC0aXdUzyVhVoJvfp?=
 =?us-ascii?Q?Rx/5g1oGGUYFAtqj1dT4ZY+n56ROvOqI4ux+HxONnkgEKepRFYjS0KIDm30U?=
 =?us-ascii?Q?8zt4//9YRc5hIGeTWLmeKvUaWViG93tpVpwRxEqLG1IJwV/yuBSdgkn+gSNX?=
 =?us-ascii?Q?UAgI7Yo7ltJ8Ee/aruQ7ZqlX+4DT8nHEYXgEjMJP0qxP/dMpqWoR9YRn0q9Y?=
 =?us-ascii?Q?jTAgl1fu97A7GKYCAmmH0svXrwpHQlYaXE0E50yh0A79VIXe65Fqn2Rg6ceh?=
 =?us-ascii?Q?P+2lOeQ5552Y1/itwExIa3i8C6AwpqCdl47HkNNMz+b6R+vCJLC0gH/DIYIA?=
 =?us-ascii?Q?B46mrubZ3j0I+rjVxUjoLmUqUbuRLJcmpLPEI4bBYbbifuZVoSYNT4RWz2ml?=
 =?us-ascii?Q?n3HFR8TAMW4iW9GJD7CyPxKu4JwDQoegSZMaOB027T+jJXkIZUUvMCzKTg02?=
 =?us-ascii?Q?ks8JtPs75q3JhuFv/q70YEsRHP5ZF8I4jbmom6/XSmj6bdbm3AvVPyZrIcNG?=
 =?us-ascii?Q?AbdSEOcsXUzulOYvDr30q8+P4A5cyL5h2T2/41T31MX2T1VK5EB7xpR/MQ12?=
 =?us-ascii?Q?icoJJZ8GTwrEvFNfsUX1NOjVvtZPF5cEZ8tKwyoYPLkZsEr41OOhsIR63Nle?=
 =?us-ascii?Q?js0dmGXTimcThJS9d5Kv/7/+pCAiZd8e3ZGJi1XiANMg+PBAQ2jdbsFuk+fX?=
 =?us-ascii?Q?+VoWYwfTNb9AMpk9sc7RQSbgFad47wnpW3jhjEOzlInbIfnFr+nnx2xen8ri?=
 =?us-ascii?Q?iXi8wbNBgfcOW0n46MMHf2jvwwOH/5UC1rWCRhDrPLhrELtmdbnIdR1AdyGo?=
 =?us-ascii?Q?zWF73HhhIf3k7EFXqqONCGZvyNOHdQQubAJ2/WHZCPqgg/cY0NIl5cJU412N?=
 =?us-ascii?Q?LszoHm29ZsF5PD6dwMa5Ix9OMCcS4i9742Pt7bWw/b4vSpbMde0os1VsCbtn?=
 =?us-ascii?Q?OsSlDhqLKlFG9LYKImAAJND5JzXgauaInpD/Ayh0dkGzsiiRfOUfmthoQPh1?=
 =?us-ascii?Q?DGuBZ3OwgvXEdHoQc/MmKFc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78699256-bb59-4138-3e97-08ddb4f734fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 21:19:59.4969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBCBBrAqXtxSdxMwmwMJqUPFeaXDSZInbhESfUE7xjXcLsWVZtWMxlCN38Iu1lxFmUHtDHTINcVlPTCJls3idA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6738
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

Thank you very much for your help!

Thanks,
Jia

-----Original Message-----
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Thursday, June 26, 2025 2:17 PM
To: Yao, Jia <jia.yao@intel.com>
Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Brost, Matthew <matthew.brost=
@intel.com>; intel-xe@lists.freedesktop.org; Nguyen, Brian3 <brian3.nguyen@=
intel.com>; Zuo, Alex <alex.zuo@intel.com>; Auld, Matthew <matthew.auld@int=
el.com>; Patelczyk, Maciej <maciej.patelczyk@intel.com>
Subject: Re: [PATCH v2] drm/xe: Fix out-of-bounds field write in MI_STORE_D=
ATA_IMM

On Thu, Jun 26, 2025 at 05:08:22PM +0000, Yao, Jia wrote:
>Hi maintainers:
>
>Could you help merge it ?

Even after v3 there were still some s/0x1fe/MAX_PTE_PER_SDI/ as I mentioned=
 in my review.

CI results of v1 should still be valid. I amended the commit and pushed to =
drm-xe-next.

[1/1] drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM
       commit: c038bdba98c9f6a36378044a9d4385531a194d3e

thanks,
Lucas De Marchi

>
>Thanks,
>Jia
>
>-----Original Message-----
>From: Lin, Shuicheng <shuicheng.lin@intel.com>
>Sent: Wednesday, June 11, 2025 2:18 AM
>To: Brost, Matthew <matthew.brost@intel.com>; Yao, Jia=20
><jia.yao@intel.com>; intel-xe@lists.freedesktop.org
>Cc: Nguyen, Brian3 <brian3.nguyen@intel.com>; Zuo, Alex=20
><alex.zuo@intel.com>; Auld, Matthew <matthew.auld@intel.com>;=20
>Patelczyk, Maciej <maciej.patelczyk@intel.com>
>Subject: RE: [PATCH v2] drm/xe: Fix out-of-bounds field write in=20
>MI_STORE_DATA_IMM
>
>Hi maintainers:
>Just to avoid this patch be missed, could you please help review and merge=
 it?
>Thanks.
>
>Best Regards
>Shuicheng
>
>On Wed, May 28, 2025 2:26 AM Brost, Matthew wrote:
>> On Tue, May 27, 2025 at 04:30:50PM +0000, Jia Yao wrote:
>> > According to Bspec, bits 0~9 of MI_STORE_DATA_IMM must not exceed 0x3F=
E.
>> > The macro MI_SDI_NUM_QW(x) evaluates to 2 * x + 1, which means the=20
>> > condition 2 * x + 1 <=3D 0x3FE must be satisfied. Therefore, the=20
>> > maximum valid value for x is 0x1FE, not 0x1FF.
>> >
>> > v2
>> >  - Replace 0x1fe with macro MAX_PTE_PER_SDI (Auld, Matthew &=20
>> > Patelczyk, Maciej)
>> >
>> > Bspec: 60246
>> >
>> > Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM
>> > support")
>> > Cc: Matthew Brost <matthew.brost@intel.com>
>>
>> Thanks for the fix:
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
>> > Cc: Brian3 Nguyen <brian3.nguyen@intel.com>
>> > Cc: Alex Zuo <alex.zuo@intel.com>
>> > Cc: Matthew Auld <matthew.auld@intel.com>
>> > Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> > Suggested-by: Shuicheng Lin <shuicheng.lin@intel.com>
>> > Signed-off-by: Jia Yao <jia.yao@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
>> >  1 file changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c=20
>> > b/drivers/gpu/drm/xe/xe_migrate.c index 8f8e9fdfb2a8..1ede50780a14
>> > 100644
>> > --- a/drivers/gpu/drm/xe/xe_migrate.c
>> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> > @@ -1555,13 +1555,13 @@ static u32 pte_update_cmd_size(u64 size)
>> >  	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
>> >  	/*
>> >  	 * MI_STORE_DATA_IMM command is used to update page table. Each
>> > -	 * instruction can update maximumly 0x1ff pte entries. To update
>> > -	 * n (n <=3D 0x1ff) pte entries, we need:
>> > +	 * instruction can update maximumly 0x1fe pte entries. To update
>> > +	 * n (n <=3D 0x1fe) pte entries, we need:
>> >  	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
>> >  	 * 2 dword for the page table's physical location
>> >  	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
>> >  	 */
>> > -	num_dword =3D (1 + 2) * DIV_U64_ROUND_UP(entries, 0x1ff);
>> > +	num_dword =3D (1 + 2) * DIV_U64_ROUND_UP(entries,
>> MAX_PTE_PER_SDI);
>> >  	num_dword +=3D entries * 2;
>> >
>> >  	return num_dword;
>> > @@ -1577,7 +1577,7 @@ static void build_pt_update_batch_sram(struct=20
>> > xe_migrate *m,
>> >
>> >  	ptes =3D DIV_ROUND_UP(size, XE_PAGE_SIZE);
>> >  	while (ptes) {
>> > -		u32 chunk =3D min(0x1ffU, ptes);
>> > +		u32 chunk =3D min(MAX_PTE_PER_SDI, ptes);
>> >
>> >  		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
>> MI_SDI_NUM_QW(chunk);
>> >  		bb->cs[bb->len++] =3D pt_offset;
>> > --
>> > 2.34.1
>> >
