Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895F8D2CE17
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 06:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD0710E666;
	Wed, 10 Dec 2025 06:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SnbJeL52";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA81C10E666
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 06:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765346899; x=1796882899;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S1w1pPNAdXm8QTYuKOh0VDbMMhr4axR9cOLoL+RI/oo=;
 b=SnbJeL52oHpB50sk6BTa9bXNLShCUFPAEb6LaPIQyEk11Mo6RLNPHqD3
 gtMNit62jgwcT7BnGvoIB9TWBp4hv3NqGgAl0ChSx5/KXCncDwtg5BCmC
 ixvehYdXXg96b21fZHRStERIN1GiJcQnZegVdN9hCkVIhBm61kKGlMlcB
 7paTcRt4krMdGpLo1r/uMr3B/aVYSpbFOg+Gfi2oGp51nW0blN9s3bR/x
 vXEjgZOi+h8lazGFyTkYhkSiJRYckaikNZEjhTY9gdpmK4JXU/aab252D
 GW0vBBeTKcAXsyvckdorN7vzbB35BGryd9jkLMwkwUfF3lvSbbWX6U067 Q==;
X-CSE-ConnectionGUID: UW8K2Oz8SiCOOUVbSRVOkQ==
X-CSE-MsgGUID: UxXeBfvET2W83IqS+3JMIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78005321"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="78005321"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:08:19 -0800
X-CSE-ConnectionGUID: 5trFtWEmRzyJabBanjVzTQ==
X-CSE-MsgGUID: mJIMJS/1SveXSxIb/2Zpgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="197208738"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:08:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 22:08:18 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 22:08:18 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 22:08:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCaqFUPcIR1YnL3mE1T9pD0LEzS7+nL4Kuq32+wJbHr5kguNgDytEE92Q28XQdMYQxjJI0L638AEInDW68WU3wiRWtsTquJ6GSpNsze5bOfyTMVgFAKzFJ1zjV2MfE38qpOssafabA0K3+Fi6/N2cCNe3zTe3wMCgDHd1q7/8k6yA5UNyZ1sD7eOu7hCyrqymUjkzC07EooazNopldrMS9AoiPzJmI2SFkxPAvZ/xQ6Qwlg272fcqwTPWmVMM85muN9IvyGQItJIJ97glGW+XiCRP4iNPFBR9dE8kKpPPXsMHkWgrSy/GzeAAOS9SN3QRwFt394kLu8RfhDpNbUh+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQWG4O/QGZ3//JFPzvMRzP/yoncUtyvqYt0VmI8qNq4=;
 b=Sy/npSZ/qLDG0LsxhaykdJH/nRmzhefJjNX6RvEfvA4DPZVupc9MbShW0KO/tZAl35jhW/Nwp2zNaNlIYCCTsCjrnyuW55VvpUi6itxXDluvXFPgB22SqmjqB8Jp7JzUshvDSLV3B3QYniA2ADfoc499Xw81syor8kbJSNCIMApRiM8LYY0WVUXfrcGF2zDCGnSTQhL/wByAGQsl7dahQMu86okf84tNPyvr7iGpdJ2DmlraTnAjEWnviAovcEsBojphgG77v76z32NacbDqfK+LBHdor9Z+Qpw3Q7XkC6o/vN6gD78PnKWEi3mn1R/Pba7gZBM1B/CMV8sJQQx8mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA1PR11MB8793.namprd11.prod.outlook.com (2603:10b6:806:46b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 06:08:17 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 06:08:16 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v5 09/10] drm/xe: Optimize flushing of L2$ by skipping
 unnecessary page reclaim
Thread-Topic: [PATCH v5 09/10] drm/xe: Optimize flushing of L2$ by skipping
 unnecessary page reclaim
Thread-Index: AQHcaXa1J8OpU4lECUO9luXXKGwHhrUaYl3A
Date: Wed, 10 Dec 2025 06:08:16 +0000
Message-ID: <SJ1PR11MB62042A41A4F6B342ABB9A87C81A0A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20251210014517.3184135-12-brian3.nguyen@intel.com>
 <20251210014517.3184135-21-brian3.nguyen@intel.com>
In-Reply-To: <20251210014517.3184135-21-brian3.nguyen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA1PR11MB8793:EE_
x-ms-office365-filtering-correlation-id: 85c9f1e7-b23e-4a88-9635-08de37b28272
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?M/GNZxgpqN4LYtT6LIPFKjqA/lYfWPKQ/0TOSyEw7FNF2G9/DBPar7VXkp+I?=
 =?us-ascii?Q?X3TBftPY28jS2itqKLRlybHL6f47CAk92zB1NI+OMeUocVp2GagxPIgnZbIt?=
 =?us-ascii?Q?Un1yYbdgGoC+ozvZbIqwXgkeghmNrvd+v9pTLDsjq+FhoYkUO59PiM7pZuKM?=
 =?us-ascii?Q?GxqjIe1HkuunPKh3xajcmBZ7NVqL/OBD59z7ExdrA4Djnog9vwqbhCqIkSB1?=
 =?us-ascii?Q?AlA7UZ/Gq86u+h6tGMZfzIdgamHn3rr2NNWc4GHnUtjNQgSltQUSdWiprRD9?=
 =?us-ascii?Q?0QBMd2RdzwoMyuhmlPdK1sgImY6xXvLZ+bzo/G0vBrwWL0MQIH87L2j8GAl6?=
 =?us-ascii?Q?KGrCDGDN0ytauFiJ74ioCd9IC0vFyTVot6qTrciCfZfGtCs9jniAD4BxUgZq?=
 =?us-ascii?Q?gsmxUDEssy0Z2Pxoh0EFPL8ippam/lJpT3B5vRwgVUDiKl2BA4JWSdcnqIes?=
 =?us-ascii?Q?QJMK6x0BWiIPDYWMMZCkL3VsW5+/J2sdpXJTbgSyxwJu22u9iS2xKHQ0FTFo?=
 =?us-ascii?Q?dstmdZKjqLpxSO242m+134F9twVOII6+1PYZhE72+LtI/47UuoTCyqeGyiNZ?=
 =?us-ascii?Q?pDPMh66q4txkYzazpMBfabGPtDvhYhtevSZ8hyc/bOvTJHc9yH5vvDotElNL?=
 =?us-ascii?Q?7ifRT/JuQLaA0mS80mHe539w46WZfKW9fwm+Y54gTGIN6CTnZUjIHNUrAVxh?=
 =?us-ascii?Q?ZYcJ5/GpW2i7uzJWuVc69xBX7aV9xkqJ986nKe8dNK62bmQzvAmjjU/ef4tI?=
 =?us-ascii?Q?wORGgVNYzKDXaRk/SqmpUEGPR35K6H5JNjDc0XqneGs9ELb0qSfHwTqiLTic?=
 =?us-ascii?Q?aQex1cihNecHoo1knr2BMTQa0AaflkEskgUCZadk6xtLWaEA6kWpgr8+rsIQ?=
 =?us-ascii?Q?u4uYa9YHQhwAe18Oqd+2D80iAaNJUwWMQNFkz7zGRDRsP8Nli/XQpL1gh++A?=
 =?us-ascii?Q?kutE3hEyyZJhUH2S6fOvKs10b+Po0Y8WlaPnHDBRL22YIOcT3qC3fS72balu?=
 =?us-ascii?Q?COqVnBYtliCdb6vj12jmac3Q5AN7PANJyR9h+mjjXSvLDRlG2m2kSYtOE4Y4?=
 =?us-ascii?Q?qDRALm1ne5L2nDtlHO/tUPLTo74gw0fhxSsigiu2WXE7Nrqsabi0yQ3ekNsJ?=
 =?us-ascii?Q?omXPn/nmQflv3sFnWXl8htlG/Y1866VD4ooeQKN4s+s4rH3sYrx0mF+8ZurI?=
 =?us-ascii?Q?7zNWFXC/Tiha7cyqtZuHptY4hF0lg2XKfysyrb6OhlckyRkOfsmYYJzh+OUz?=
 =?us-ascii?Q?qVMAVWn5sLKJ1JgPBcvrZIxXAyvWyIZ+1DFm7WgUEXIg1Kc609d8eYqTjnl8?=
 =?us-ascii?Q?yhsF/huMZaOcg7KMVCd1CeBEdnO4Tc3/TjKsdtWQmZ7U7eo5y57LFO/42YOr?=
 =?us-ascii?Q?ZBdYHoorBk7SDguq/w7j2lvfr7DlkJdv6cSJq0AsitMrX5wduovvBNpZgjU2?=
 =?us-ascii?Q?KUU5gbk2+9zrqw6UE9iAUOmhikJonq3sRQWbPr5PSc9voPODrvGi6mtu6NEY?=
 =?us-ascii?Q?j1Gwp3uD3Aw1/rv00wapi5QcVc+cjE6AxCFy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w84jtrcEg0zBiu3td2tzUJJ2pqJW7CFH06EMUi47HA+FbEYfL924BgWQdVZg?=
 =?us-ascii?Q?1eSfbxDuoK1eFZdXtf8nyvYI4sIA0wLk8OMYulbzIT8EGAUOjWfDrQVj4jfN?=
 =?us-ascii?Q?NYMVvN+oH85iRNxK1hWW1gg1i6IREiSfKnnNZnZ32bWYIobP/ZneXAhGsjbB?=
 =?us-ascii?Q?kN0pZdJeKnJq5c/TH/dgh++in5P5jYzi8oMuSvI3yWeHuq5DK7tlDvAoUqV9?=
 =?us-ascii?Q?RV4OdS+MbbC1q5PN25wljCnaCGg3+rFHerj2QRsQgojvYrFfXICJ+IJowKRE?=
 =?us-ascii?Q?mqQkSzHhoVDzqb3+xnis8OFUCB+ID68Qp2qS/myPbr4jP8Rvx7N9Du3fNf9H?=
 =?us-ascii?Q?LfRVGnYWeYd5xnhmgjPGPIggiKYuza+ImrrXdvT8VwRfBQZrEv1WIzPB4IrB?=
 =?us-ascii?Q?tzBOudSIes5EG5/7apRcG8w2UeWN4JaQLIQtvmKMRoSS2z7DC+aTz9t2/ExV?=
 =?us-ascii?Q?9DURxvE5ahNqnJ40oSBn1BkCQHraQXRtVEaeWr4fq6ZsG7bhERsBcMr3qD/Q?=
 =?us-ascii?Q?xb+uxcZzE+AcxlFkSgVT/tYbd/7NsbtN7PFhl1IYb5l2HDqiaHg4v3oBrVOb?=
 =?us-ascii?Q?vTjCkH4rfoSoqsIExxeTdotGh2qke7wIf2CuEQcieKPKMK35FxmxUhmW2Bib?=
 =?us-ascii?Q?tl2bjxh1SFWSECZv1gU938iw4CAHG0WEtYiPmeuVHCR2as0pSlV6DOze2j0C?=
 =?us-ascii?Q?iQDVoSe8LmSMFWe7Aa2uwgOf8p4gHknIdpy79JbiOS5KJ9MOA815CjVQtNvI?=
 =?us-ascii?Q?ZldyWW2tfNzQBgxWpK39b6nawF3QX71BF3v7/7kT0ioPbFArCg7G/TULW9AH?=
 =?us-ascii?Q?WCjmZ40v1qQBjRua/Cih3FGEMjjKff6oPsDbjBVEHafr7s37vUFiyqG7TkrB?=
 =?us-ascii?Q?fZurZAnHOa/rOPs7kqCNda/XKobenaHmdOi2GV82GB00YfBIPeTOvgb88Vex?=
 =?us-ascii?Q?0h5Z5C7bbI26iCYbvYozn4AKia3PraMRf10BkhsspkwJ+K45dyKx/5yZNU/E?=
 =?us-ascii?Q?HMRuoYbeihO4AT81Go/CCNt5BYTZax8iNATbRMZlifI0IwJJnTZm3fZuhvIU?=
 =?us-ascii?Q?qdKaJsbvk4NKQzH4Ib9aa6gLwqndPSJyUiAZMFBRAWtbrjHso4LxH5OYmwaz?=
 =?us-ascii?Q?FkpcQiQ3aGhLgaSfUcNDYnaCsydvxo28MLtxZowQwSmvyLud+OGr2qfZ0YeE?=
 =?us-ascii?Q?sX5WbazC2MZjsmNUK1eP+jHubpgPHkoA0+gDyinZorP9RT86PuT6kWJmd/QA?=
 =?us-ascii?Q?z9vcQJthKXCgv4fpUOUwxAEF5bFh3NJtWXgYSQm6zopuGUTVgF26zIGtBRQz?=
 =?us-ascii?Q?1Tk9sim/Z63K76rM42UnSG9hE/0gtcidqQ5hWkfhSh9mafFb0KSM9hr1iAGT?=
 =?us-ascii?Q?a9kUMm94mxvNVeLmkruXeUtf9TM/4GkQ/KCmV0bje2U1Xi1yXvEtO7uMoPJm?=
 =?us-ascii?Q?9Nz1Lh7lRDiMVl58IjPki4UXAYdthxy0vWtGChkgHYhDB7RhBiP7uAApHcN2?=
 =?us-ascii?Q?Wk83TFEqjTkbKlYLh3lAq+rGeH6U8LQ+lxu06jR6L3fwxxLyVSKaqNvU9bnj?=
 =?us-ascii?Q?XzSdEzyDnszxi/93UyEff6WxNRu+1TR972SViXl7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c9f1e7-b23e-4a88-9635-08de37b28272
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 06:08:16.5430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eixWXZmAURqqls9ttLNUq9uZMrragMb1z8CXHD5YttZDs/Rhl+fZ2btts0b1Sj4sEqXFAO1dfF/Bh3FEP6MREz8WUP6tBpYvGqxqY5dHt1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8793
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
> From: Nguyen, Brian3 <brian3.nguyen@intel.com>
> Sent: 10 December 2025 07:15
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>;
> Summers, Stuart <stuart.summers@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>
> Subject: [PATCH v5 09/10] drm/xe: Optimize flushing of L2$ by skipping
> unnecessary page reclaim
>=20
> There are additional hardware managed L2$ flushing such as the transient
> display. In those scenarios, page reclamation is unnecessary resulting in
> redundant cacheline flushes, so skip over those corresponding ranges.
>=20
> v2:
>  - Elaborated on reasoning for page reclamation skip based on
>    Tejas's discussion. (Matthew A, Tejas)
>=20
> v3:
>  - Removed MEDIA_IS_ON due to racy condition resulting in removal of
>    relevant registers and values. (Matthew A)
>  - Moved l3 policy access to xe_pat. (Matthew A)
>=20
> v4:
>  - Updated comments based on previous change. (Tejas)
>  - Move back PAT index macros to xe_pat.c.
>=20
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_page_reclaim.c | 32
> ++++++++++++++++++++++++++++  drivers/gpu/drm/xe/xe_page_reclaim.h
> |  3 +++
>  drivers/gpu/drm/xe/xe_pat.c          |  8 +++++++
>  drivers/gpu/drm/xe/xe_pat.h          | 10 +++++++++
>  drivers/gpu/drm/xe/xe_pt.c           |  3 ++-
>  5 files changed, 55 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c
> b/drivers/gpu/drm/xe/xe_page_reclaim.c
> index 0cce5ad2e33b..fd8c33761127 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> @@ -13,8 +13,40 @@
>  #include "regs/xe_gt_regs.h"
>  #include "xe_assert.h"
>  #include "xe_macros.h"
> +#include "xe_mmio.h"
> +#include "xe_pat.h"
>  #include "xe_sa.h"
>  #include "xe_tlb_inval_types.h"
> +#include "xe_vm.h"
> +
> +/**
> + * xe_page_reclaim_skip() - Decide whether PRL should be skipped for a
> +VMA
> + * @tile: Tile owning the VMA
> + * @vma: VMA under consideration
> + *
> + * PPC flushing may be handled by HW for specific PAT encodings.
> + * Skip PPC flushing/Page Reclaim for scenarios below due to redundant
> + * flushes.
> + * - pat_index is transient display (1)
> + *
> + * Return: true when page reclamation is unnecessary, false otherwise.
> + */
> +bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma) {
> +	u8 l3_policy;
> +
> +	l3_policy =3D xe_pat_index_get_l3_policy(tile->xe, vma->attr.pat_index)=
;
> +
> +	/*
> +	 *   - l3_policy:   0=3DWB, 1=3DXD ("WB - Transient Display"), 3=3DUC
> +	 * Transient display flushes is taken care by HW, l3_policy =3D 1.
> +	 *
> +	 * HW will sequence these transient flushes at various sync points so
> +	 * any event of page reclamation will hit these sync points before
> +	 * page reclamation could execute.
> +	 */
> +	return (l3_policy =3D=3D XE_L3_POLICY_XD); }

I think you do not want to skip anything here as far current HW capabilitie=
s concerned on upstream. Though normal flow of transient display flush by K=
MD driver will flush, you cant be sure and you need to flush full at page r=
eclamation. The idea of skipping came because of HW capability to flush whi=
ch is not there in any of upstream platforms. Probably we can drop this pat=
ch itself!

Tejas
>=20
>  /**
>   * xe_page_reclaim_create_prl_bo() - Back a PRL with a suballocated GGTT=
 BO
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h
> b/drivers/gpu/drm/xe/xe_page_reclaim.h
> index f5f07e2e114f..0faea29f3964 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.h
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> @@ -18,6 +18,8 @@
>=20
>  struct xe_tlb_inval;
>  struct xe_tlb_inval_fence;
> +struct xe_tile;
> +struct xe_vma;
>=20
>  struct xe_guc_page_reclaim_entry {
>  	u64 qw;
> @@ -68,6 +70,7 @@ static inline bool xe_page_reclaim_list_valid(struct
> xe_page_reclaim_list *prl)
>  	       prl->num_entries !=3D XE_PAGE_RECLAIM_INVALID_LIST;  }
>=20
> +bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma);
>  struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval
> *tlb_inval,
>  						   struct xe_page_reclaim_list
> *prl,
>  						   struct xe_tlb_inval_fence
> *fence); diff --git a/drivers/gpu/drm/xe/xe_pat.c
> b/drivers/gpu/drm/xe/xe_pat.c index 6f48d34711a6..2c3375e0250b
> 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -9,6 +9,7 @@
>=20
>  #include <generated/xe_wa_oob.h>
>=20
> +#include "regs/xe_gt_regs.h"
>  #include "regs/xe_reg_defs.h"
>  #include "xe_assert.h"
>  #include "xe_device.h"
> @@ -231,6 +232,13 @@ bool xe_pat_index_get_comp_en(struct xe_device
> *xe, u16 pat_index)
>  	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);  }
>=20
> +u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index) {
> +	WARN_ON(pat_index >=3D xe->pat.n_entries);
> +
> +	return REG_FIELD_GET(XE2_L3_POLICY, xe-
> >pat.table[pat_index].value); }
> +
>  static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entr=
y
> table[],
>  			int n_entries)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 5749a488d9a9..d5dadfb7f924 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -69,4 +69,14 @@ u16 xe_pat_index_get_coh_mode(struct xe_device
> *xe, u16 pat_index);
>   */
>  bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
>=20
> +#define XE_L3_POLICY_WB		0 /* Write-back */
> +#define XE_L3_POLICY_XD		1 /* WB - Transient Display */
> +#define XE_L3_POLICY_UC		3 /* Uncached */
> +/**
> + * xe_pat_index_get_l3_policy - Extract the L3 policy for the given pat_=
index.
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + */
> +u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c inde=
x
> 78e2f037f8e1..43426979b164 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2030,7 +2030,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
>  		xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
>=20
>  	/* Page reclaim may not be needed due to other features, so skip the
> corresponding VMA */
> -	pt_op->prl =3D (xe_page_reclaim_list_valid(&pt_update_ops->prl)) ?
> &pt_update_ops->prl : NULL;
> +	pt_op->prl =3D (xe_page_reclaim_list_valid(&pt_update_ops->prl) &&
> +		     !xe_page_reclaim_skip(tile, vma)) ? &pt_update_ops->prl :
> NULL;
>=20
>  	err =3D vma_reserve_fences(tile_to_xe(tile), vma);
>  	if (err)
> --
> 2.52.0

