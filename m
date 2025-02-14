Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35565C021A4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 22:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023F610E097;
	Fri, 14 Feb 2025 22:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/JxZdKt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88E710E032
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 22:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739571643; x=1771107643;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=32FDl6nw2wqnzuiydcDyhCx0x+kqPJmXgSYgMTr6kpA=;
 b=U/JxZdKtnn2sCd/xiUTg/KDIzPgg2V8iJtot0vv6rBi4yEPXY8mG9F3Q
 cRGZBbG/8PmYYXIc6YSK2zvBS8eEHRlxn1mP1nf/sSw5btWYxXP4w0Qk8
 kes6ju5gBkLgEjKyigceOJyTtM0ADntmqzqxM7o9YCq6/WNvpbRZ+mNlr
 bVQeYauwt5FNUuDRbR5nJcGqQz3RH582J6XyLXxevIW7pvM7jmWRgWY2t
 nYqztD8oleGg+3Mc2npdqRHzsVQyFwKv2g5t59kARmRBAFalQWSdJbPdw
 VViYq4k7Oj4JlF/apZZv36HBkEU+i0Sly+mMGU0FzcVfY0bikXWi4Zu7u g==;
X-CSE-ConnectionGUID: QtpaVXieRPayNfZfOj4tVg==
X-CSE-MsgGUID: BQWYB2WZRn+WXj5lRPT2VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51763960"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51763960"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 14:20:43 -0800
X-CSE-ConnectionGUID: n2Y0Jl+ET12/MscyrRtN/Q==
X-CSE-MsgGUID: XnOSEh0qQw6y0P4M9f7KvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144495001"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 14:20:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 14:20:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 14:20:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 14:20:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUFxNV4Z3TO/74MwZwZHOzysj8Yzm1aKUzUyBKwT++oRGxGDlYJ/EJoGaYEK8dSMZXG9pTecKwS7R4iFlyMNDG2rVEQz9y0hdRDDEmWYpE1aqr5oxhdoCtKrnvkXWdr9+X2tJK58MVuZayjeyM8Ppck/WnZjdg0DeiZRZcn6mHtsy5L7JvAUje2XWelfEDboawA2ErdBigQeN+AQiASKGVsMRifz66ZLSUGIE4l5AopdwUeosB6rFF6/GSeoXNHxKMrgamu/x81p+XBg+7xu0EPp6qZlCoObU3pAe3mjkoOsUKMJkrh+KTbUGPW7DbtGQ5AbZD7ifbKJHaElWmm6PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQOL6vzGlx0UGlykcXC77N1wFXHcpnWqOi2yQSufNhA=;
 b=EBo2ARIl7iC2/9zBiZWvQSoc9eFQ5kFcl3oXyVhp96lC2gjvQ1U5op8OvvzbZsxgxOuWi3NiADzE0HYi5pWsfoA5BGNGJSNY31IefyemyR82F0N08VMD5H9AdcF8XVNNeP3nz9tgbH5SWlps1kKt2xkT1PKv3c4xPD+38dPSZxIdGorEbTvojyYvkXwSEF/3LQSSBhnfMZS9xjDWPYuBC7pUKQl1B6rEtdIIkqPRjPZERMddHVjQXMCKujOI2GEGCHi+Sw4J+S9m9PPxhKfPj3cUHnjrkhYGApbjWlQioeOobtqFBNza2Y1ObeENCAD74AIUOldefFgV6oAc3mfJVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 22:20:09 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 22:20:09 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 8/9] drm/xe: Rename update_device_info() after sriov
Thread-Topic: [PATCH 8/9] drm/xe: Rename update_device_info() after sriov
Thread-Index: AQHbfybVJBjz09axC0a46GyVoPRiyLNHXbCQ
Date: Fri, 14 Feb 2025 22:20:09 +0000
Message-ID: <CH0PR11MB5444420A8C78F67526401E77E5FE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-9-lucas.demarchi@intel.com>
In-Reply-To: <20250214212313.1767562-9-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB5206:EE_
x-ms-office365-filtering-correlation-id: b5e944fd-6d3b-4461-6e90-08dd4d45bdeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mpUv40Q2hL8EYr2cwi97LREPe7OcQVmMjV0AZ38vHn6zD6mtPvdT0Z4IvWuq?=
 =?us-ascii?Q?gUWOeEh1n1oAdvoFWVdw/Ye5PLAkGMAVkNu5G72xbUMKQ7jkB4ie4is4pJKb?=
 =?us-ascii?Q?7l0f7fRb3YgzLMCO4w1K0uULktnJNRGbXz7FOc5KUr1HavveImTxy2NOMtJo?=
 =?us-ascii?Q?/wuVkvUdX5bZrkL921sID9tiZqW7XOVYS+WEBRLX7XQ+69IS9XP4zYNzAsgm?=
 =?us-ascii?Q?rbkCpAqsaaWZnQV1Lkr+VIhO8VFmZhk5V18JZutxI2e5WWwM0cHBnbqNeuBa?=
 =?us-ascii?Q?axZY7lS+dOu0veDj7J5inEl3YJ4l+j2vNr8AMejC067I3uAzPPjhBGOClYVw?=
 =?us-ascii?Q?ngDtq+hqCJLjtlYimEMI35VAFG1AIG6gLrzHLLsgKcpjun8LJgRXQxWjzMrv?=
 =?us-ascii?Q?1n9t11Uz6RzsFvg+y7tPWa2jOrtY4TLeQKQQa49KWI74Qh4WpzvIiZZhYc/k?=
 =?us-ascii?Q?gT0qU8iC4sZJmsqPCP+h61PfAySkrAMIlWaWtNbriubOCCfdMQDZBDnVJKBT?=
 =?us-ascii?Q?pL4SqdH7uj7iGC3y03bu7bI6z7Bfy65/7sNoWyf6lHxRRLIQ3ekKpe1n+US0?=
 =?us-ascii?Q?610Sg+cSfJrU8EqmGv4X8iTLsuk+h6w0pKvfqfcgFG7F1dTCPJ+IJs7qi/AD?=
 =?us-ascii?Q?czC0FGJS3UJD8LHKjf+4AlKXyER3sL3FtxdLzLhQuQWQPNOY0FEQ20Kn73Xq?=
 =?us-ascii?Q?cNGIH2wSx7p1nF4xI5c5j+jdSVmk9vxCTPtAVlAYoohxWW2qYejKi9GIml//?=
 =?us-ascii?Q?4xGM7woV9RpcmM8cWv5EnrHlVFTk2jv0E4aX95RrYxnBOAlzQk3aWIom72Ww?=
 =?us-ascii?Q?EBjRf3zIZeqTtvLzMN3UXowcgo0X2FQKZay5mxUP2MlTAn0aCHaEjj8uHvYj?=
 =?us-ascii?Q?Z4mxAq5xkfu3ROCj70SZ7K3XhlKmbKdaD8dVciYH33WwkVye3+e7vM0C8Ok0?=
 =?us-ascii?Q?H6d0T6cSKRcdy9iR9cNDZRcgGykT543YDJQ5wn7KYHkMhs1MqczzweApB4rY?=
 =?us-ascii?Q?lHd+S2zf/aH7whnwW5VJtHu/F9au6F8rYU6CyHl3LMfmEsqFsME58LmxwMix?=
 =?us-ascii?Q?bZuy5O6YnlGm1g3Cb3Do3YDp9T3mXrOeq1oZm+Gyk2GvOY0Y5GBE+iP5MKI0?=
 =?us-ascii?Q?MerTG0cKIOUu7fFcvCUd4qdUDVpuTlixSitvFwIwDAaPx1pXeModZB1PHB90?=
 =?us-ascii?Q?Bx8UmWP/2gOCFzBvlCb1HrsbKBA6xsO3gP7coCTilW8dxsvj4jWmyhrw4WRF?=
 =?us-ascii?Q?VFSg1eOv/9CGgX1ispU6QfW5jSFoBHpSa2UYmn9CIDgkFb/g16wiR0DUGk/n?=
 =?us-ascii?Q?BqmUrUp+/i1pK0hiDW75xTONLPyBRGBr7MFZusX6S/HdrSy4CdlE85XSogom?=
 =?us-ascii?Q?TxF7loZmxOGscVzSB3ERv6gEGJ4A+neHAe3hKzS8SDtqk9sgt8jPE1bhaWwH?=
 =?us-ascii?Q?L1+ofDg5Zkvpu5hUJ8sEAajcD739Ss4Y?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zNbWHXW1OM2BmkKyXJOseqMLM/TIDjfw4gM6LEEgGtzkfkolVImUhcuDtsKq?=
 =?us-ascii?Q?JOjUShAJ/BfC3RYTO5ohcYvHsOS2H9n1oavvwecUFRkbCwXheKF833awwPNi?=
 =?us-ascii?Q?L3e66gNOXWi+t9aBLxtawwpNgDIyZCFPtYEiWdh9i5/bLlo6qcVpLEEJ8G1q?=
 =?us-ascii?Q?7VrQt3H2BFwK8eS1GyV9v5IMdx2h032jS8gLesLI3pZftMn6BO7sYux4jNS2?=
 =?us-ascii?Q?UpFy0ZN6xSFafyOgwpr5Oydd+t9vETV3qQ5C0FAwYbXu8Jn1emGYkwReV4kH?=
 =?us-ascii?Q?PKnrJDnYA6UMTv9iY2nbfKXE7G9TFjZTznN9qu6WOVtibtmof8mf4XnulQrT?=
 =?us-ascii?Q?eiNZDM5Noo9TfUGoqRvR9khkPja3BrkKUj2+nNT04MJAqSPpkzQRJiZP15Db?=
 =?us-ascii?Q?SSHuHnBCyDJf524TyNVq5rc/AGTgpSRT4SmViYjErZzm2+ianQEWRMpNuMfw?=
 =?us-ascii?Q?NhEx6idyYgOPHxYOPc5BX0+uaJQlaQ0EQsZ8paTWTniHveNToEsdXl8pQCuY?=
 =?us-ascii?Q?xaFXrU+t0uqyW3Yg1vu3COaN484+jod34zhoIxfQ8Owdj/HgxYzK3bJmkdRs?=
 =?us-ascii?Q?R/ci+xiszHhk4F43FTFbwkXOxk1djVgU4H/5kbxlnFjOPbZBD78j02El1QB/?=
 =?us-ascii?Q?J2SgZv1F4nql56L9GBRdKpt+zu/7skTrnkc7HcOx625HEBtVehvMUqolb8o1?=
 =?us-ascii?Q?QVxwvp58v2mwF+MU6l60Cjhr9A1rYWTf8hYItKHrIKGoEDic+WAYAibL02r4?=
 =?us-ascii?Q?byB0M+gpOdzd0ApbyaOx0ZN8el8+VntC6C/VPTGFGFkJO7k4mswiUj3SvnXW?=
 =?us-ascii?Q?i3gK+lp+Tt6ueoHGuAkSlN9Jxucd7UKY6z9KAo9lFHk23Y33m8ohP49s1yIQ?=
 =?us-ascii?Q?MEzP18mWyu6AMZXhFwM2ndKt1u7iGfSc0iiLkriRLZXF7ZNrNm2C4zv6rUL5?=
 =?us-ascii?Q?+pPS0Xcn0skdnWrAL3P+WOUqyHedqKaKx94WeFOrutrmqa3mZ5GRSVAWray4?=
 =?us-ascii?Q?baP1CkfyoVamliTZ/fw8gK8t3Yewzana3YwhBea7R9R6gHp1ga5vZXtlHqVi?=
 =?us-ascii?Q?2rQONsyH8123iJIESM4RgqkeavHhlZ5/p8n5P1MMpL4ZgBy1I5Q/Xh13e5oZ?=
 =?us-ascii?Q?Y4vDyejacpHA9GgPEpfR0ohhGAhv4fTfTfotekrivijiPRQamy0GX7e7RlVV?=
 =?us-ascii?Q?lQH0iJqefWdPrrdgv9RNhP7XDFVpuA4qZdPn1Ptu7MmPd1KQ36yqDPvkhpJ5?=
 =?us-ascii?Q?1qwKcTZClX+w1uUS9XmUJiZVxsYGXgDX/kHMV5uH7FIJMenRQ2ymiJjcBAOP?=
 =?us-ascii?Q?jru1Aqumj6yGmYUhSMLZTZ3jTC/Ye5nXZQIedLgKu3hoTsYbLdrWE5GgJJKL?=
 =?us-ascii?Q?chfOsJhHPPfjrQX20OHMZNbmTgbSP4+jIBYtCFvnKzmyuG5IlvWFhKb7GW85?=
 =?us-ascii?Q?KMAR5ocJw0uF4YEnBWygk0F1eAhSkZFltMzKp47Vy31Y90BW5k0diwlJ7bdw?=
 =?us-ascii?Q?pR0B34X0NFD8okSE8QEWdchod5OsUCBx4pdudar79DFKJ792a+yEUOiAYWM0?=
 =?us-ascii?Q?plKDOOrvzDXssBWF1SztRccIk8k4GsLihk4OqyHZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e944fd-6d3b-4461-6e90-08dd4d45bdeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 22:20:09.0512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: COHtKJTWla41ar8ubM7ZXljW7qWNthEMylCo7bZ4X2pmgZQGv9AF7vr/7Beg+Jq5jVws5h2BReqrCnX++CSyL4PNlSjYGg/qxdBPL52DEyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De Marchi
Sent: Friday, February 14, 2025 1:23 PM
To: intel-xe@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Wajdeczko, Michal <Michal.=
Wajdeczko@intel.com>
Subject: [PATCH 8/9] drm/xe: Rename update_device_info() after sriov
>=20
> This is only changing info flags for SR-IOV reasons. Rename it
> accordingly, because there are several other places in probe where the
> flags are updated, which is not inside this function.
>=20
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 4af4b526a2801..3255c36700f60 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -660,7 +660,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>  }
>  ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe()=
 */
> =20
> -static void update_device_info(struct xe_device *xe)
> +static void sriov_update_device_info(struct xe_device *xe)
>  {
>  	/* disable features that are not available/applicable to VFs */
>  	if (IS_SRIOV_VF(xe)) {
> @@ -691,7 +691,7 @@ int xe_device_probe_early(struct xe_device *xe)
> =20
>  	xe_sriov_probe_early(xe);
> =20
> -	update_device_info(xe);
> +	sriov_update_device_info(xe);
> =20
>  	err =3D xe_pcode_probe_early(xe);
>  	if (err)
> --=20
> 2.48.1
>=20
>=20
