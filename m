Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE60C5B543
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 14:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD3A10E86A;
	Fri, 30 May 2025 14:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTdfD6ni";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B98810E87E
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 14:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748614031; x=1780150031;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SJLlJdhlESyamvBl+/AZ7wUh98e7uq7oraUCfj1woEc=;
 b=nTdfD6nibE5aBJLtuc0tRYQHGQr+xe2U8bshXghlt5Ajimq4OwYTnYvy
 NpTHQI2CnMcCnMY8htxOjHU2a1OAfWXleplYrtm7z/tlYk3YEzBiFbNtB
 gqJ44lGt/H5E/bnPzyWGoUhNiYAdwhezaYu9HY9MPUFlt7fylLdBpHNOx
 4lM3irQjRBUg/Rv29L13WTL2XryRbP0YFXaWpcq2QNe0hFtHldv0URlOw
 9usN7liT1SMDcUsXTq/3nA9OI+RwIi6nnQwz/dU66oiuf38qDl4YmD87g
 NLsXJN0JxdfDc9sVGc8zIUyggc2f+cjxvCFAnpzwCiNEJe81/0zTE8K9r g==;
X-CSE-ConnectionGUID: 8vHLB7XSQBma59jWtaBR5Q==
X-CSE-MsgGUID: pftqpcnaTaO9Cz1RPZOmzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61334741"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="61334741"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 07:07:09 -0700
X-CSE-ConnectionGUID: 8aoYfCCbRJuMT0q6kmWbow==
X-CSE-MsgGUID: IOzyY5L6SkKj9eJB32vkrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="149152588"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 07:07:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 07:07:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 07:07:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.57)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 07:07:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ld8XXG36CWkYR3botw123KECb9HrUFtYAjHt/NVsIGzP2NU0bSkxL8LSUX7VQe3kbHQmJYYMFVR0ml00Z2FS0/CgZzZUZ+dMvpRLS9G1d6zrBCCfmxHF8WHoNGZ5LICcYJ7rfAP3/1ahdpOcy56hSg/Sx9LrTsQqFJKhyOSDZhYlm7mTsHm9Xc3mnPfdxXjhdFBi/pGWF/WcMLAoB56OGwItMgLMIsHMotP25iSR+BWh31Fnvp+xtMaEYV4Cab6VrdfKUGezIE97HbW00jeHfmVju4/QMNDo5BxP2T138cl0qMWiEKuHdvKGBgsAfYa7PpJRN1NdW4+tH7dNIb2WhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJMz00YNVSnn2QsPl7degzRzsFictNuBUYBdAWA6KRM=;
 b=mZGotZEO0N8GOWeLPZ1PaRxkydnl7shsoIT8lmBPyIxpX5vnwONKeWINhAh4PniO1TzIg3mVUSCdx+StRAyLevKY6sUy0mg5Q+G+ubtSYLsxGwutM5FcDquXah+DOi9APylmYv/TiiKcjLaRhxRXExtJ6qAPvGU/QTCb5vwMqj4RZUxJ1apqTDMV4ncAUvgLqIOu4gOlvSG70cNZ3fHI1yR0xHaCkPAQnHhr6A466c4nZ/omejks28zremoablhKptrISpRg2KIDwO2mcsJc1qTbzpo2ry1I5j7Brh4VUOBOmaJL8olqai2Y7VlpI4v7XIWzv1/ZGqaQPP13rMOpdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 14:07:04 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 14:07:03 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Patelczyk, Maciej" <maciej.patelczyk@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: remove unmatched xe_vm_unlock() from
 __xe_exec_queue_init()
Thread-Topic: [PATCH] drm/xe: remove unmatched xe_vm_unlock() from
 __xe_exec_queue_init()
Thread-Index: AQHb0UQhtUj1ry7Ee0OqcRLeRnf06rPrM7pQ
Date: Fri, 30 May 2025 14:07:03 +0000
Message-ID: <CH0PR11MB5444F39447DA84B2B22D4DD9E561A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250530084856.2612849-1-maciej.patelczyk@intel.com>
In-Reply-To: <20250530084856.2612849-1-maciej.patelczyk@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB5279:EE_
x-ms-office365-filtering-correlation-id: 03d344f6-1fde-42fb-f88f-08dd9f83412a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ag6IRJ6++lUtxINHQXjcZSNVW3LXYq58Dt1Nm/89lOw9OQ/Ahupv88v7jyyX?=
 =?us-ascii?Q?RaeWs04kgJ7ozGupW1nbPj+I0lPb6u7FCuqPUlmurrp69DDzGHtMsoLP8ghv?=
 =?us-ascii?Q?yPjMDewucuAQTABgn1cuYhp7VjWDw6ieT1sdQbjgi85refK5BXPHw+oEOocb?=
 =?us-ascii?Q?0mWIgiE8cwYEz0PoIhgjcruP+wlTXbcF8buXyEbJNiuR5kQbnIWrv7u4UKjr?=
 =?us-ascii?Q?2hPIWPuCAb4gSkkZvD5r8Y4SXDMCEFrKbeKIBM5S/4Y/gegBv+qPVXuoLUkR?=
 =?us-ascii?Q?9PjS9df5jSI2s1neywqJ43nbwpSpqoJcb2wHtynvKLFKiHnYPzUpWwp3zoSa?=
 =?us-ascii?Q?E8HGb0xZqirh08k1eM/KrKOVvkO0zttNzHpMh8vrpOKQ6w8Drf+QpQHSVfLq?=
 =?us-ascii?Q?hHxIdOiOAXk4K8Wen2HCvDt4SnBrXqo2gsgkg8W+Hbs08WqqMVXWcTdkGOYa?=
 =?us-ascii?Q?Eh3X17LCkmrex/ET+uFjfhifRz4tJozWCPc1wgJVGbXPkAn5jZ0lbc3Hg9Me?=
 =?us-ascii?Q?u9kZbOhY0sciKknFayNDHnFHaJ1+9Gp32nxKSKsDnQUS19xJ4WkoVsCYjiyr?=
 =?us-ascii?Q?bISontvhrCZmiWYtfSxtMtCOjd1na5pCzHLQtEUuW7lT7i3apK4B6+Vg+RWC?=
 =?us-ascii?Q?IxG3C8/2CgfpElD4O+4MHVGa0fIJsXix1BNHvsTdhhSuuhQ4tJHJOLl3Ybel?=
 =?us-ascii?Q?iQAfcgqG+Ic5eYDlwidKkcJlzH9c2qdisQHNbmlak+kqA0yIYhb0MOrLXCR8?=
 =?us-ascii?Q?JaZkhROFFAP6gfe6egiwDHnNCYPmUiWDhjaW0L3ywEoJ+KKYe4Mj//VpngwZ?=
 =?us-ascii?Q?lsfF1fSj2I+npb7Gpo5J+LfEv45ZD6d3437qCr9fIw+y+M9x52rMH5ZdWxwL?=
 =?us-ascii?Q?OtI7l5P/flUI0xnhrJy3Cc7Kve/JpOdkiiNC1m/2NZ1NRYbYRS6Q4Sk235GZ?=
 =?us-ascii?Q?2MIinNipJ0v1JtXrwPDCtJ0UNbrSw3eLV0gx1OeCTZiHE2OkOfckzp0cjAF6?=
 =?us-ascii?Q?Lr7F4PyiF0ZyoCQH4JGkJNA4LHTZJrak6OrFSAdV+rhRBVOYWUEYbmFfW1Lu?=
 =?us-ascii?Q?KhqhJuHxi9NAOGJUPRF9tT5Kg4e1Wv4N0d7Kar9Hy/9nfjvaFQfGkgAOabkl?=
 =?us-ascii?Q?u9yCbGsFv+SgFs7mXOqcAutNf6+you5i9dpkEnNR1XZ/F3m9Tiot+Z+Vprg9?=
 =?us-ascii?Q?AMmnY2GgoQO2C0VVRfIgpb8u3wtDDY+t69mdksmQWOeQaqWQeh/nLgi3QjEH?=
 =?us-ascii?Q?DG01QZ8CPWQ50HAZw0tNReuy7OlAQi8H+fqnOGmTs/lfdl18lDDBdUgqcErV?=
 =?us-ascii?Q?MS3Mf7IGYAFnr+S+1svJmN/hrKd+uw50Q/3gXg5dnrmB4SkZ6A6CUe5jIKOk?=
 =?us-ascii?Q?H+qkzyzjyB5ew01u3LFU8KW4sJE0LEru1YETz2MycN4rEW4XXry+WQiZnV6i?=
 =?us-ascii?Q?F6IpXSVdnokJoYx8mdUu59k6GKlOHtvjCzFjMmJTUzyO1y5c86lD2D2dm6Yb?=
 =?us-ascii?Q?1Ld6gEK/7pv0ENQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3xmu06NcNEJtOg25Ayt4HIUHfeP8qH9m2Y60H+gSVx+ng+P2QD//tZIzr40m?=
 =?us-ascii?Q?4esek4rM1b3Ftow8aKcSiJngHQdb93hzxPg2J9boV3x+cb45oyABEgV27JHX?=
 =?us-ascii?Q?qeSG76ZTk9NLY6O/PqG4xUjZPkjV4RwJhecokExW5ac4+eKCvtZtQzxHBEEF?=
 =?us-ascii?Q?S/X1+iYjJtwfi5WCyqyD9zfJqiuP9TZwOzCWKo5nzcqR5mFP7rmbQt14ISTv?=
 =?us-ascii?Q?X6V6oMlJse8m2UZCUhZ/NmB+5Pwpx7Po1eBbSooTWB9zxObIUGn3z4lVHN76?=
 =?us-ascii?Q?tL8xOjoT+bQZ2Yk2JRzThaM29Wj6Von9Wx36zLowscu5+wg0xMqWl48KfvK3?=
 =?us-ascii?Q?mt6osR4bTRrjYxyS2dKJcofXqw4rtFcXDhf8SRp+mkYtu/dpI2183JNcd1j4?=
 =?us-ascii?Q?tL0WjlXsfV3aegfjwJTfS/rRUx4aeXB4Bauxiy2VH1xKfgIfTVxJ/eIT1h1J?=
 =?us-ascii?Q?haNKJI9OCCbxPTqr5uvDz9FQ8/pJlw6kcvIDgnC8nS58HT7kgfMJVxw1lfWW?=
 =?us-ascii?Q?kLA7XeGHbFVapPIlKuAyLHCA0GRzijeDkViPZ9LsDTVg7jBrMS6TOPtWRz5S?=
 =?us-ascii?Q?e3Wi+/4r02HTMsxO7/bQilV41ugg1uXBcdKnTrGb/Cb0VqRY0Tf1RKXGifzq?=
 =?us-ascii?Q?GzM2f3mndJxf3Y3MiZoQr6LB7fW+DUhkbGFrNjA/vcwJ1ChZm5T4awF5m9sE?=
 =?us-ascii?Q?BvBTrYN0+DvZlW2ElF7u2qToeCk1Xq7IkF8VMGMf6xsP+Hk5x7kgsbqssi+v?=
 =?us-ascii?Q?n2DCSZomRUdDuVHQIS2QMh5PCaScrfiyaDTGY9u+Orpqg0RwjoG7aTljbKcW?=
 =?us-ascii?Q?MGidgJaEBmu7HKsmlRLK7WBIwj6l16lrhzkIWZONJuuhH7TrwbyHf87rPSm2?=
 =?us-ascii?Q?+HLEqv9/iYLV3xOwTtChv6t/pyZyIX7rmFScUnzw4UUyuQ8juVPns7axAsiE?=
 =?us-ascii?Q?kUqY29/DDkSLQKgXJWi7Iq52Nl8rBsV8nFsF+/Q9+EDgk2wCI1NUaAsz3Cp0?=
 =?us-ascii?Q?EpDAPpWgvgye1m96VsgC0BzTpZsicaP3I2hp0lsmj5bHlTISO23l+ZJKZzGt?=
 =?us-ascii?Q?YOIgNyLvyy8neBN0s1Z0DS3Do0ymilVA9oeRJ1pUQ5ABOL6MVvBjI4PoMr3K?=
 =?us-ascii?Q?tkwZb8AhUIIEkUhcZriMHp/sMVDjAdHRO6bvZIuqX2iZeQemUbmBq1TUNSuw?=
 =?us-ascii?Q?keQJkSa8Fwwo72vXTznAp0G9aUJE6iJoc/BaD4acPAboIYk9LBUbdIk2w3eH?=
 =?us-ascii?Q?+j50uO6QSxvTe84Dkb5vbRAVHIEbCjQes9bhYirVm8NYs8tOPZV9+4y0JD1s?=
 =?us-ascii?Q?GL3v4bN+Gf/mj5uSfHcSPsWRQJcpCCsPSJ+sZH6fgzeFWvJOHFDnxLgOQSLw?=
 =?us-ascii?Q?dWEY893zrqgK5FenkOg+A+c+P9JPS+PRd8ALGUsNYiBmXBkJNe7tnfNkIqgn?=
 =?us-ascii?Q?g2wJzF/YTAZHeLj/lZcSZtNS0x5WTp5g+IwUPF7zlJCXvy55l9Lb9LYBw2bn?=
 =?us-ascii?Q?jtfpRMS0z0wb9DpBKyHwklWyiTGiMb4EvwmrNNOJsIBtfbxE23ymUMAiCEvI?=
 =?us-ascii?Q?Gzp75r57QRwgfSlX+NIvYhwTFnQlaYBikTaEvZNv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d344f6-1fde-42fb-f88f-08dd9f83412a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2025 14:07:03.9293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5BdxObcpri4nCqLCMcbvgYAFnPW26ecBYmqJjIcggFIf5tXLBgNmX9PvSwZf6mb04qglwQxvXOP72kXCpZTRa8xoItGEYzmyyeCkPY9YfuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Maciej=
 Patelczyk
Sent: Friday, May 30, 2025 1:49 AM
To: intel-xe@lists.freedesktop.org
Cc: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; Brost=
, Matthew <matthew.brost@intel.com>; maarten.lankhorst@linux.intel.com; Pat=
elczyk, Maciej <maciej.patelczyk@intel.com>
Subject: [PATCH] drm/xe: remove unmatched xe_vm_unlock() from __xe_exec_que=
ue_init()
>=20
> There is unmatched xe_vm_unlock() in the __xe_exec_queue_init().
> Leftover from fbeaad071a98 ("drm/xe: Create LRC BO without VM")

Good catch!
There's a checkpatch warning asking for this commit message to be
updated to something like:
"""
There is an unmatched xe_vm_unlock() in the __xe_exec_queue_init()
function, leftover from
commit fbeaad071a98 ("drm/xe: Create LRC BO without VM").
Remove it.
"""
But besides the checkpatch issue:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Fixes: fbeaad071a98 ("drm/xe: Create LRC BO without VM")
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index 32c6923df7c3..fee22358cc09 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -114,7 +114,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(st=
ruct xe_device *xe,
> =20
>  static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  {
> -	struct xe_vm *vm =3D q->vm;
>  	int i, err;
>  	u32 flags =3D 0;
> =20
> @@ -136,7 +135,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue =
*q)
>  		q->lrc[i] =3D xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags)=
;
>  		if (IS_ERR(q->lrc[i])) {
>  			err =3D PTR_ERR(q->lrc[i]);
> -			goto err_unlock;
> +			goto err_lrc;
>  		}
>  	}
> =20
> @@ -146,9 +145,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue =
*q)
> =20
>  	return 0;
> =20
> -err_unlock:
> -	if (vm)
> -		xe_vm_unlock(vm);
>  err_lrc:
>  	for (i =3D i - 1; i >=3D 0; --i)
>  		xe_lrc_put(q->lrc[i]);
> --=20
> 2.35.0
>=20
>=20
