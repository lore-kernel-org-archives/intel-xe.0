Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BE0606A69A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D3mdm/Kz;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Sl5b/eLp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CE910E3C0;
	Fri, 27 Nov 2026 12:14:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F26510E457
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 12:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795781668; x=1827317668;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XXQynpgI4NyCYQ+9m5evF70cGFoOy/kkp0IBBmS+A/s=;
 b=D3mdm/Kzlo7Ez1TeQlIlr4u+OTKluNKx1vpKd3WPNIND8Jpf2F1hRrSL
 r/dXX6HKMy7baxqn+e5RVusBev8jY2JMaWe+H8l8ul48wJVXMuKzMMt3/
 /Oyg4cemwQJImf4W+n8lodezxwBOMF8xs3NCvq5SwsDDPGxz45mJ7NJDv
 lBd/hkWrwX/TsMI9nhie5/92fPU1o5HjQCtRfxN9ZqPP9qZT+k3fOUTbZ
 +kHvNBSAMsJlTpIOZTkAfPpqHwLfAycSqFYXM/3PNgMo4B/avIYFqeb34
 dA5yfqK1qE0HBJnY/Pomw1WiEXzSf6x0rktaR9rXabUJmkWEK+h8ga5zD A==;
X-CSE-ConnectionGUID: uAh9C/1XSuaDCoAMpw8J+w==
X-CSE-MsgGUID: Bx9fRAm3SUizcQDAxv65jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4684481"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4684481"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:14:27 -0800
X-CSE-ConnectionGUID: eIGsV0XhSVmPnQnxf9tayA==
X-CSE-MsgGUID: 5EeHHj8hS+6wf3JxQNDKMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14061634"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:14:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 04:14:26 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 04:14:26 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 04:14:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqVRVYeiyHRVbLfBAFJCg9Gqy/kED/OTFYvIaZ462D4vv00tpLzk+zVnJcw4VrfLXhy+ag/w2hh19OOquLgsg8Fp0me/Q320RRRk/m4gFtpimI1hzEqwnurY2ghiZt+M9+Egss9yg2aCGfgz8oCMC5nwgWW8T4dBoQTOZX/ZkITVsMUXpjFKLxCpMHqsHLIK45Eyl+9LKt8leGm+PoVaRcj6KXyDHQ5ZkB65T+4Zb9QhE3JvmMA11imvY1E9/ohHIUpXFc1OX5vOD3jvkEhaqCfO8OlQX8BK8edzabUo2YDUjNf4RPCLHQG9nN7IoBSO2J9oXldcZMKyZwE3V9acMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+NwuosSVa+UR4JZdngsMXWUgLbmtUP0lsjUCv0yTB4=;
 b=A0vCSpDtkdkDAL5w4CVstqa0Bw9kBzy5IGhxgZfoJvB+dpFD4QxAuPOfG9ImBhoUmqer3939fklBbvToIKS6dNSeqBHhtR+/K7RSzaDjY6uapuWIxM16cBb8E9lDT1pYSdGJdSHXmoTmkxGdwiwWhxOIz7qz9WtTHsFLjDqtQx5ROzc07ysagR2xHF5MDS4giqZ1lux5t/iGu0YaShDmQ6+6cQaTPfX5k6PQVVaZoNZv+/Hsn+6/zdoaK2bBUX2/g9dujTSk3U4DwhPCseJXn6kDxd0e0dbkZzzvMHia7D/lBY2r8enl34tRsahPgZeXC7rVNRr1Y8/SyWmpXm3+iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+NwuosSVa+UR4JZdngsMXWUgLbmtUP0lsjUCv0yTB4=;
 b=Sl5b/eLpiJ83Vv5tcfnFPWDsf4nSx7TEXmll1gWA76Kxxn4Tk3fdoAFp+vd2O0GXlMm6QVIM8O8/b0m1e87BrD/wLfGtG4Wpx0hp9Nf6BT5GcVorrpm1Y1+Y8Zz5Q8IyRj2k5guANRTB/EyKte1186/K1fNS8I6bwm8Lb41b7Wk=
Received: from CHBPR11MB250747.namprd11.prod.outlook.com
 (2603:10b6:610:408::12) by SA1PR11MB887662.namprd11.prod.outlook.com
 (2603:10b6:806:520::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 12:14:24 +0000
Received: from CHBPR11MB250747.namprd11.prod.outlook.com
 ([fe80::554b:b2f8:6717:77bd]) by CHBPR11MB250747.namprd11.prod.outlook.com
 ([fe80::554b:b2f8:6717:77bd%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 12:14:24 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Koujalagi,
 Mallesh" <mallesh.koujalagi@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>, "heikki.krogerus@linux.intel.com"
 <heikki.krogerus@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 1/5] drm/xe: Request cold-reset recovery on AMC thermal
 trip alert
Thread-Topic: [PATCH 1/5] drm/xe: Request cold-reset recovery on AMC thermal
 trip alert
Thread-Index: AQHdfjZ50x4gWD5UyEaTeUJnI2+LdbdB1AVA
Date: Fri, 27 Nov 2026 12:14:24 +0000
Message-ID: <CHBPR11MB250747FCF7252CEE4567DDCF8095412@CHBPR11MB250747.namprd11.prod.outlook.com>
References: <20261127061333.1019047-7-badal.nilawar@intel.com>
 <20261127061333.1019047-8-badal.nilawar@intel.com>
In-Reply-To: <20261127061333.1019047-8-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHBPR11MB250747:EE_|SA1PR11MB887662:EE_
x-ms-office365-filtering-correlation-id: 5be8554a-9f38-47a0-948f-08df4c7ff982
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|10070799003|1800799024|366016|376014|261102123227099003|261021123027099003|261021121427099003|261026121527099003|261022113327099003|38070700021|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|261009223027099003;
x-microsoft-antispam-message-info: iAAL4CCLR2IsATUw7Adz7f1B47JvVlpHdIxYc1M1Nhh0kLy972Q17u+tVa+JsfpixJ9itUB8xgOolCE4Iz3/0XyvfpTjEmslqAv+SDm82qKpfd1Ykmgk/ilNEc2qGgemfm01IZM7QZ5QAt0+CzSLBdWv5bOtjligSD6a8DgPqD3ymBV0cgdo5xPgQdQ3JDDXZXXsjeeOXztkdgiayit9MisMMJNOX1MhAkyQfwNW9ZTbyhwhsS4xpzfbVA7lMdjAVs1kCgxnytL+yAE3D3W1VcI21OPzx+M2dybRLDY2E1YG7uOnpWU0O8vDwigFrZ9bswmR8fm0TM7oWcUhn+74oiNuoMPlLDZ/El/SQW7kSqgJ7oQRqhoLcet/e1N0VsvV0QDTxX68Zg0MPJeCV4eFc7Tn6P+kn4dIozJXkbZCMvRXXjZSoXw0hZQUdxAm4DmloPYO3FnbAwEIFhCPl0q6XNIUr5vlYakc8U+7ilos3IRXEm34ZraWJ8M0yGru4u0WWS2Hq4lKNv4lvPeHgaecpBQaD5v4sMrnd2Rx82sMp5LU2KThZirglOWDo99B8SqX746U+9lfRXX6CjiXXT7P+uFwUAKrn84vVkJJIyAWnPVM5YMBXgZflJCR7rZUMLyUZI9xRnZepziQi2IXhJnwAxSId2V/rZHK1cuqc6N/kMxU2xo1XnpbNlym668+bSHZgu/ZhABwPe9QmM0S/b+lqgXRYXMk10N/iMNVKfXct3Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CHBPR11MB250747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(261102123227099003)(261021123027099003)(261021121427099003)(261026121527099003)(261022113327099003)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A/VEsOTYk/chgjgosga62D0wZ05qwqvt2K/WW5NJjzcz6Vi0jk51cI912H7K?=
 =?us-ascii?Q?7FMJ+jRYCvYnh/37GNR3kEip3DaHgyZg2E7i0wkPzkb7UOxSF8cdIBBU69cp?=
 =?us-ascii?Q?j0UV5GwjUtscXprEROO8Hd8aa/GZ7Q4RqSYsEA8QbIZnBWeYk29Z8YmGGJsm?=
 =?us-ascii?Q?0tUFc/IrzBjj4nJq7MAAbezCEhyJCGoerP/5iiu/qorW2Fqi2Y1S9hQuY1Hs?=
 =?us-ascii?Q?we8KJEvsSQv6HjctwROKaDk4mg1ZgJ1Y01WWGz1PFeyocrMJir3jMpnzMWKU?=
 =?us-ascii?Q?mYHCmjbXLVzV5BVJ4DyjATu9Nuti4B3FZ1Wb0WMxOkYeyXTCe3XKHc1lhpQZ?=
 =?us-ascii?Q?YI8SzSfa6nD6pbhULptuixycpanPzSYCBuR1oWDXtoA4H1pwL7mBQ3liwdU+?=
 =?us-ascii?Q?EqkWCF6AtTR3syW4VFlZRvvEkg1NzfWH3qeMSOMyJu/4kxp7cdJbCZiZJ44C?=
 =?us-ascii?Q?fkhIB6lTjOoLx18mWEEe8wzAGqgnrhumrk1JOFV3FI5EIWnya+2/yttaapG4?=
 =?us-ascii?Q?w/qJI8++i9m7kzzcgt5rEMgTFjugBg7cdC9NGItDgVL6zo4ZiIr3vLYNIZcl?=
 =?us-ascii?Q?RUt+pyMtcMIShGDpjb8aPB6y0wOwWndLEls7GASkTSTl2XMQTr1SdNfGZm5G?=
 =?us-ascii?Q?ShgTnwJwtgrjuMEyFcBocgAoakOiFr6PqcJYQSbY6B+d5VhSegNEHOq0X2Gi?=
 =?us-ascii?Q?afnOBz7v/fcvdtkCy41FzIR73YBl3YJCYsb4Z/39LvFmWgXN+Uer/Nx3sWN+?=
 =?us-ascii?Q?3fBKh806TumF8I1JisKJc4YwrMFyeZ70PZ6IpEBGHynq+/njENmORyTIOHLk?=
 =?us-ascii?Q?7OnRQX40igV2lnDKgTzaQ8Nq52pFenpIxcKxF99sqBRHYcQ38UfoJy/tNjP1?=
 =?us-ascii?Q?q+X++b+Z6S5Tx1Rrjvi43VdfqfnSVXp3jtizV6Gi6dLTlzlbXNDEeE0gNLgQ?=
 =?us-ascii?Q?xan3853xUZ4WkCMaRJHSb0Vh3AsP4MuZD6v7XLsSxgVc3hQd3fjD8yR8PGzu?=
 =?us-ascii?Q?NSRqXD8xcnpuu9PUBGsSww/32ws9pLLO4xfEFBHmaHi4X9+4707I/82sBruf?=
 =?us-ascii?Q?4J5HdwA9XqSAip7KqT71BTP89QDe7H3A5+OL8CdFoRHnE1b4KMOQIcTahGAV?=
 =?us-ascii?Q?zrq5DW+fE21zmMK9A4EMJV/rsbAWabqmQ80RkUfOZI40OggC6KFDxUWoBapi?=
 =?us-ascii?Q?tZ4EeAB3e+ucUqx7M3XR6rlUKa/U4GyWL9DVlgduoCDfq3vIY6+mub3aoHZC?=
 =?us-ascii?Q?xyHZ09Lg/BENjpz6rAchmx7ojKviH+Dz8SSm6oiVZw091MI/OEMtnVE5XMLv?=
 =?us-ascii?Q?G7eUpAASynBIMnG52dvSsY2eBFAApbMawFV2ilkEMj7MRbvrhmHVmooBUCPZ?=
 =?us-ascii?Q?DWfVlsrkL0hbU7eZWNm1Yahg62wmfCPHjGPbZGWUkCdoqe3CBQANO6yNLOs6?=
 =?us-ascii?Q?0TidQ4dnELh9KONCH/u3leqgAHRWDQOH3v7UY6DKopCfbn6qn5qvoLYcwWKZ?=
 =?us-ascii?Q?kgZVP3b2I+hAXsAzA0sj92Q4VaVh2Yzumo9IpRs/Mad1rMZDafIChaQcbjfm?=
 =?us-ascii?Q?tUsz+JdG8uAThEVw5PDBnGKfb81j1f2dcBAUcbBbxAL07SNhrgj2Q8/LXocf?=
 =?us-ascii?Q?l+eTRP9P5PQVAM2sSgcDnf+uU/1DWqZEkrEXjUnjMzkuKHzUDIdoOUcYklD0?=
 =?us-ascii?Q?l5z2a4HddMoItq94kF/kJK5sE6zdJqHUDscc5tEEU/6JMLp+xbvAhPjQD9Iv?=
 =?us-ascii?Q?xjryASfHygif0t3m/iK+xnb4cMmXJNTnnO8iYvwQ5Bh6VDDWzw+KrrbXqikc?=
x-ms-exchange-antispam-messagedata-1: 5ZvwPGC64+VrTQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OFiqZgZn8QSupPagt83Dg7CrcaDdxQEg+qTkYInSH2Bnnergmbnthj9PLzK2mpFCd/RBpXjXz6AA6f8PqWiqQVig+8AuQ8dC68QrarG5lbgm+yUQQzXso1rB0B/DJOcK25BR8ItDqOPdpcxwtm+LdEomJMWFlN2ogBiAmYCByyB1KA/8mAnWtrRbejcHUizYlFQoWM+XJzsycoex/FgA2G0WTpCgPXiq1GNWIfqq8nkICewmqphRvq/TfzPwfMh+bUYSVARNAyRXDAOfYcd4H2y57tzympxi/WhIy7j4S6dmx6BkWEo9v/rP3S4M6rVh7ya0H1gA6kjqvgFI0xl2PQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHBPR11MB250747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be8554a-9f38-47a0-948f-08df4c7ff982
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 12:14:24.0319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9+WWoyP2nytQ5ekLPDzswldE206giUpnGpytGqNZQ1TDil+n1XTIJ9nNt+8TLThVtajxLRCwn12Kjm74EKTiMeGZ9kMG6qEu/XpjgZdxYWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB887662
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Friday, November 27, 2026 11:44 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Tauro, Rian=
a
> <riana.tauro@intel.com>; Koujalagi, Mallesh <mallesh.koujalagi@intel.com>=
;
> Iddamsetty, Aravind <aravind.iddamsetty@intel.com>;
> heikki.krogerus@linux.intel.com; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH 1/5] drm/xe: Request cold-reset recovery on AMC thermal t=
rip
> alert
>=20
> AMC powers down the SoC after reporting a thermal trip. Notify userspace =
to
> attempt cold-reset recovery after the SoC cools down.
>=20
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_amc.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> index 37694e34271a..58edf52724e9 100644
> --- a/drivers/gpu/drm/xe/xe_amc.c
> +++ b/drivers/gpu/drm/xe/xe_amc.c
> @@ -115,6 +115,8 @@ static void xe_amc_work(struct work_struct *work)
>  	u8 alert_reason =3D AMC_ALERT_UNKNOWN;
>  	struct amc_response response;
>  	struct i2c_client *client;
> +	const char *alert_str;
> +	unsigned long recovery =3D 0;
>  	int ret;
>=20
>  	xe_pm_runtime_get(xe);
> @@ -161,19 +163,25 @@ static void xe_amc_work(struct work_struct *work)
>=20
>  	switch (alert_reason) {
>  	case AMC_ALERT_FW_DOWNLOAD:
> -	case AMC_ALERT_THERMAL_TRIP:
>  	case AMC_ALERT_OOB_REQUEST:
>  	case AMC_ALERT_OOB_RESET:
>  	case AMC_ALERT_CATERR:
> -		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n",
> amc_alert[alert_reason]);
> -		xe_wedge_declare(i2c_client_to_xe_device(client),
> -				 DRM_WEDGE_RECOVERY_REBIND |
> DRM_WEDGE_RECOVERY_BUS_RESET);
> +		alert_str =3D amc_alert[alert_reason];
> +		recovery =3D DRM_WEDGE_RECOVERY_REBIND |
> DRM_WEDGE_RECOVERY_BUS_RESET;
> +		break;
> +	case AMC_ALERT_THERMAL_TRIP:
> +		alert_str =3D amc_alert[alert_reason];
> +		recovery =3D DRM_WEDGE_RECOVERY_COLD_RESET;
>  		break;
>  	default:
> -		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n",
> alert_reason);
> +		alert_str =3D "unknown";
>  		break;
>  	}
>=20
> +	dev_warn(amc->i2c->drm_dev, "AMC Alert: %s (%u)\n", alert_str,
> alert_reason);
Please use drm_{} style logging as this is part of drm-driver.=20
Even in other patches as well!
Thanks,
Anshuman
> +	if (recovery)
> +		xe_wedge_declare(i2c_client_to_xe_device(client), recovery);
> +
>  	xe_pm_runtime_put(xe);
>  }
>=20
> --
> 2.56.0

