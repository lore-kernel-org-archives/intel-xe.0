Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A286D5C0ED
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 15:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3330210E9EE;
	Fri,  8 Nov 2024 15:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnlRTJfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72A410E9EE
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 15:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731079606; x=1762615606;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fRMP36oPj44wlOwzD5bacjU7rIRFsw7xp/q2IJCdplY=;
 b=WnlRTJflwlldFL3qM8sc/y0w0ZLttAiLhjiQL7HSimzQ5XdF9P6ex5RF
 aLHnpQ4lS2VTBqPFKnYPBZY5Ams0wvqLdRl8hQLiGTdj1XW7QUfBwo5JN
 nKNzFmRzQbq5EdACG9nTN5hn84w62jrbwU4oZDwA8B3ysSG6DlM8+zTNA
 7rQmMh1lJOlrY4GEkBP+1OiWISHeqaay0/ADM+OwPjkLhZqQLIJTLwgmY
 YO88uj+iGSnNID+MGEmWJbrD0cDZI1aeBummF/eCP7To+9F5p/2lufceT
 XYQNaCovHgXS3kYhW+IjpzuH7UuiZgw41h9sCrDH0c6wjb/ae4WPlVQ+/ w==;
X-CSE-ConnectionGUID: 5uRSSZc0QZuZ38ATU68l9A==
X-CSE-MsgGUID: Q7ARG5ePSBKYiN2Z9m3sSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="18589760"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="18589760"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 07:26:44 -0800
X-CSE-ConnectionGUID: 1PjZqmESSqClFY5NtKIeuA==
X-CSE-MsgGUID: ulI8U47MTK6rOiyC0DIe/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="90226847"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 07:26:44 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 07:26:44 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 07:26:44 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 07:26:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjbCXnCBxrnKU+RoQS+hr0ymWzFsPySAgsnk/0zF6y2WbGeTK6ZQ8QJ+K0nfq8wXrkesno8qZOZTh1FPjjf/KTMy0UY0NbMt47+BrYUYedMhSQYXZwNFCGlpZaaHg4I0aikTwqkiqSPtIpAYDwMgBPXc0Om/rEF3Xrpbzo6QLmhrB/qB13S40gvNSZqdvwH/D8RV9HWh3lU+jFsDtL92FYo+9VyFXddyQbWr5IxcQPKtQ4FOrrc73kvFkDC2D2Ca+Kh7RCa2KgaLXdE6SVXRPx2+ChJb/QTQKWDBbF5jbWD2DPaTDfwS1Qh3oosSLAAezLlYNWQwqw5yL0JUP9Lsow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfHjM5x0A6j1xRlRCp8n7QdnUEGqCDKQk5415l4PdG0=;
 b=uuJNgoemPlT6dhyhSiMEXKUhZchRC1ZhArKZNLBmc5vnQzxX/w/R2D137bsEIhA8BoHtmBjQLe0+Lxx6Pw5I/uadrKAUy1OHKxE/mmSnziWHjBBO+Oj5y0G0i52LT4UwNFUPgH5qxpv83hvl0vqZcwTOc8zhC6jhF/FXJtSPWENmbjnn6N9/H6nTg3tc4L9M8rsnZQ53ZDcf9JNWtW+LPteqS3wKJFwWN+iTy1Ox1ReQMGTdLBzI54FpJlZDherDY6sf0KOdiNr7nZcWFV2dg+Qk6RzEPOUPLiXpvHWCBH8V/cKrjVTqFXw1oydp/2MWcxVtPTI9nymAAlzM0IOiaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by BL1PR11MB5977.namprd11.prod.outlook.com (2603:10b6:208:384::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 15:26:35 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 15:26:35 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 3/3] drm/xe: Cache hwe used for timestamp
Thread-Topic: [PATCH v4 3/3] drm/xe: Cache hwe used for timestamp
Thread-Index: AQHbMZ/U5hDRJHiLlkqPnPvqkd0oVrKtfGFw
Date: Fri, 8 Nov 2024 15:26:35 +0000
Message-ID: <CH0PR11MB5444C31DF9750D8C0C9C5863E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108053318.3483678-1-lucas.demarchi@intel.com>
 <20241108053318.3483678-4-lucas.demarchi@intel.com>
In-Reply-To: <20241108053318.3483678-4-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|BL1PR11MB5977:EE_
x-ms-office365-filtering-correlation-id: 35e7bd1d-d4d8-4815-e42d-08dd0009bb65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?hcCNdKG/FKn4fcgYGf1G/koBHWW1sV6GkvFLf0lvNcBxltAt6vC44kb+HTQc?=
 =?us-ascii?Q?8VxG0CwCfHZcwIy4vW6vi2A10RAqVbK/jGSbOBKVlE7D5zaugUNvVrJU4iql?=
 =?us-ascii?Q?ZxaEELNByP0TAHMu3E/QyT3maBGwg6L2xJ4FdiETm++0fVQJm51x/AiSqrjs?=
 =?us-ascii?Q?OiB8SS9Lv4+Ymk5eg97SFW/Ij9ws8U50MkhEgEyH4dJqC3ABm5zPoKYABPer?=
 =?us-ascii?Q?Xx6VTr3AiSyzD6+ZHs8Z07Gw8SqAFbU+pg/VWbnkXvz+qkYKPpMUrTEEHZ50?=
 =?us-ascii?Q?O985U780KJJlTQlahMxvz9LryPYQ1GlVO/iXOKHxQrSf36qa017H70vTChOB?=
 =?us-ascii?Q?UaEpQitw+deU7ykFQ3OhS+RNlQlUv09GSERL9+Ed4tmSDyRiQ5xwwAb768Rd?=
 =?us-ascii?Q?LgWRqXvFSke/nU22OftXI1yKx90bdVo+68Bku2lfB9rq4Ykpnmn4x69XCPb5?=
 =?us-ascii?Q?pu8CNcwFEUnLMdwU6oqhbA0PyEQuEDb2u0h3kO8JeFjOzTEFv/hsW4r4adxt?=
 =?us-ascii?Q?oOEyNAuZGtNmhQbmMTbUMc1vJaKJ8//knVtMBin3XbWbm7WO1+AGlJ3xgp+n?=
 =?us-ascii?Q?1JXSwbfMGDgmGZ8SreGL7vow1tjLUDQd+0KetzT1Ijkkh1mIM5+wkzMfD55d?=
 =?us-ascii?Q?Tuqfoo6rUEANB5O2EQ5DFBQXIQCephWv9XdE098i/UsTcZ5NvKY7SlKjqgHc?=
 =?us-ascii?Q?gda8nDXtwhy0lPtCVUnFEhGM+tCMQMnCTx9IPS4SqxahnVLrhzsjrYAQYiMN?=
 =?us-ascii?Q?52xdgF7Wf2I0uCM95+oCuCv5/lzhEkfuxk8KdOaGzoFZXnRaulg8DH6oJBEn?=
 =?us-ascii?Q?FpAv8NvZAEC/RgOEdxZ8Q84L4Q9xsE4ZnGXf8oZoNP98Zj029nC9cETtDgEx?=
 =?us-ascii?Q?xyQjIkqEaOT0uE0W4QrqeNhu7KvIbVVwtim6ck7uM+fGfET1wiaYktNpCN+r?=
 =?us-ascii?Q?J6VhbUX81tyns1GF6FeyLaVFJ4cLEHpyKdTxbJdbd5tB5OT23z69BPgXULpl?=
 =?us-ascii?Q?wXI4Qmjq5ktzpZW09gB9qs+c7PijqVp1I/GRycuYI1C6/e+NkJ/qO8l6ypDk?=
 =?us-ascii?Q?/v6lQ19d97eGWzM6kovFN+rP1bhKx6pNDsZbTx/9MlaD3BQMWEgwE6/pRM79?=
 =?us-ascii?Q?5HdgTqtfQFHxKFKgJ4D+eCdq+aCzT/3mIj9maD4iPG7XYa3Mdse4l4KcrRaG?=
 =?us-ascii?Q?wtcWpPCVM5voPNry2OcOdrATb6lbxISebHwHvbmay3SV5zAUZFbAMjKaM9Ay?=
 =?us-ascii?Q?XhvgN2I32t4pKFTx4aF8AXJKomv+oUGmHU4oDA07pfk7DWxF8GiXlHdFO4cd?=
 =?us-ascii?Q?YZrNFD728pYL85yJGOm9b5+gpvHYVQvzoFjf5R2CV/AcSGsbDf1r72AmaX+g?=
 =?us-ascii?Q?aFnsLBY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OOCo58UOXw3D6PJDYRVxk/XKeceB0BDI1SEHnvEkdfj3R+xaRCjb/W5xDyxl?=
 =?us-ascii?Q?eGOKOHo6fhLt7hFFP9v6wCwwxzmovpNoL1ais+pKz7vjL5WXhjHfNGOhLTC4?=
 =?us-ascii?Q?wbcR/237xnp8pDf1qS9AqPGeNv5tMliIeaQM+mkpjYSm/Rw0fE5D3gzpPZ8j?=
 =?us-ascii?Q?B3SJMFjVnvebWjy4hN40fUuNpUR+AW3e8IfydqMq+bTm+s1UjZo2P8hpVrkg?=
 =?us-ascii?Q?1h2bkxqtoyD+v4/1kKb/07hxxDwbkgNr68z8oUigSWZ+xZQCdrAssVl4PiHR?=
 =?us-ascii?Q?kZZ6PSezmq6yCJID93wlBy5LttniT/144c2CmOLVNUHcQvVd2tN+Vl5YGabW?=
 =?us-ascii?Q?Bc3UBEbRdjEkoy0VaYjwR30CYFRmDvSM6yvJ/JZ1VrcmascOTIey+o/WQQ//?=
 =?us-ascii?Q?zqcNNJaFOGdbk3fS852yzlUp8HSalB35nxUfFztUl0/KUZle6ouPpInQVqlV?=
 =?us-ascii?Q?DOGh/PVCRxkbpjRbzMxWgn1UD6lnifxGyScsm3G9Eqhb8Nw4ZCbN6xx/d6ER?=
 =?us-ascii?Q?vmntCf4kxg9XyeGC4Rd8r3QTp84rZtN1IGJF9YeNzCLQV29eBjUgA2l83OaF?=
 =?us-ascii?Q?vkinlHGgGV2TML1jEI76F1hZU95InQBWFqBCQF+FiniBFaqpGRMMD72lWZ7C?=
 =?us-ascii?Q?Xr+mCq8/RKBfFjc7IH+xrFHUB4G4/jQFPSmJTeGSkATo+zuzP0fi7f70ZR+k?=
 =?us-ascii?Q?lVHpMT1C85kiVbIYrivUTAOPFiqKDpn8Zjlw8Q8qb9njT9rchZYcSUxcXAB0?=
 =?us-ascii?Q?/gm6ED/nUU57ubnbY8LBDUnO8G/5Pj4T9PFPlEXVdK5reLvc2x4Qopkyhjmx?=
 =?us-ascii?Q?hK/3nQIT8udnupBDYJt3KVWGWQ7NS0jFXqWxl5qwo/vT5UceWdaDZRI1c6x5?=
 =?us-ascii?Q?082i991lkCPxi2WkrDtE/0syNX2yNeAsWC/5LSPAQR/iPLc7QpL4puTibwaa?=
 =?us-ascii?Q?76qNnErW8GUMUQxPxu7LSmQvxAANjg74o/RKEYde9/CBtgxWTLFH2Krz1hLB?=
 =?us-ascii?Q?UVDw1SvV4eqv+tzrhr5PXa37MNPKXNW1mE+ZflGiIjK70nXqJQSr3ZEOvJcZ?=
 =?us-ascii?Q?XmAb2u6S0UxHxOFSIOECqtp5HlmqUIe1C1HUEgilSirUzOBjSVoJWqwZrI5T?=
 =?us-ascii?Q?1rQVG8+mysSoi9sBXTdSesoO5ICrEN6MJ+W3cx125QxZRldqpyJSf918Qm7n?=
 =?us-ascii?Q?1ItFbdpfzZCdhoonsJ2xWgxg++v2OefMkwVNQranxNdCK/B+gRS4RL0ZVr18?=
 =?us-ascii?Q?awaJuLVTv2hTBrEIW6RWjGDRZtPOHiQDIRZQuF82HJ0kXLoZ69YHf5w5Y+az?=
 =?us-ascii?Q?xKSPOrq9uCssHUH80uJC5E11wqhuAwdjYJ/Om56CyHHBfXq9TpF7DX6IQOMV?=
 =?us-ascii?Q?Ghk2ROYRlZuST48GzS6R97aU3fZdIbIMVvoL2RjjuPb8r+McD8Q/I9W0iXb/?=
 =?us-ascii?Q?QVylAGBmDxmdRK61vVkCSvbbrW3l/f03jrNyPGrYWr4gTgp9UxuJ1sHaQMhb?=
 =?us-ascii?Q?AROphfQpBfk1JT+ONtBcSc+Fd5ALnBI6oeUagQnxBWoBoNryEwbNAXXSjCZZ?=
 =?us-ascii?Q?AIrQ/Ndx65NrSjrHcu0s9OTpm4rxH5w7mZSxoOKc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e7bd1d-d4d8-4815-e42d-08dd0009bb65
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 15:26:35.4866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p54bz3jZmcv87lAWUkZyzyHL5yckDGstLuOPYKXm+neJGemmkYqCUkxpQMtVbxH8IbNwwJ95INhXQW+cOGmqKiauvcJU0JqT0o5xiM8R7fg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5977
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
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Thursday, November 7, 2024 9:33 PM
To: intel-xe@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Nerlige Ramappa, Umesh <u=
mesh.nerlige.ramappa@intel.com>; Brost, Matthew <matthew.brost@intel.com>; =
De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH v4 3/3] drm/xe: Cache hwe used for timestamp
>=20
> Cache the hwe used to read the timestamp so it doesn't need to be done
> every time it's read.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

I have some notes, but nothing worth blocking on.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c       |  2 ++
>  drivers/gpu/drm/xe/xe_device_types.h |  5 +++++
>  drivers/gpu/drm/xe/xe_drm_client.c   | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_drm_client.h   |  2 ++
>  4 files changed, 19 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 0e2dd691bdae9..9668a60e3aeae 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -759,6 +759,8 @@ int xe_device_probe(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_sanitize_freq(gt);
> =20
> +	xe_drm_client_init(xe);
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
> =20
>  err_fini_display:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index fffbb7d1c40b4..f13b738ce77a8 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -34,6 +34,7 @@
> =20
>  struct xe_ggtt;
>  struct xe_pat_ops;
> +struct xe_hw_engine;
> =20
>  #define XE_BO_INVALID_OFFSET	LONG_MAX
> =20
> @@ -509,6 +510,10 @@ struct xe_device {
>  		int mode;
>  	} wedged;
> =20
> +	struct {
> +		struct xe_hw_engine *hwe;
> +	} drm_client;
> +
>  #ifdef TEST_VM_OPS_ERROR
>  	/**
>  	 * @vm_inject_error_position: inject errors at different places in VM
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_d=
rm_client.c
> index 298a587da7f17..125ee18ab9f1f 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -274,6 +274,9 @@ static struct xe_hw_engine *any_engine(struct xe_devi=
ce *xe)
>  	struct xe_gt *gt;
>  	unsigned long gt_id;
> =20
> +	if (xe->drm_client.hwe)
> +		return xe->drm_client.hwe;
> +
>  	for_each_gt(gt, xe, gt_id) {
>  		struct xe_hw_engine *hwe =3D xe_gt_any_hw_engine(gt);
> =20
> @@ -394,4 +397,11 @@ void xe_drm_client_fdinfo(struct drm_printer *p, str=
uct drm_file *file)
>  	show_meminfo(p, file);
>  	show_run_ticks(p, file);
>  }
> +
> +void xe_drm_client_init(struct xe_device *xe)
> +{
> +	xe->drm_client.hwe =3D NULL;
> +	xe->drm_client.hwe =3D any_engine(xe);

Two thoughts:

1.
I wonder if it would make sense for us to set xe->drm_client.hwe in any_eng=
ine, instead
of as a separate assignment?  So, here we would call:

"""
void xe_drm_client_init(struct xe_device *xe)
{
	xe->drm_client.hwe =3D NULL;
	any_engine(xe);
}
"""

Then, in any_engine:

"""
static struct xe_hw_engine *any_engine(struct xe_device *xe)
{
	struct xe_gt *gt;
	unsigned long gt_id;

	if (xe->drm_client.hwe)
		return xe->drm_client.hwe;

	for_each_gt(gt, xe, gt_id) {
		struct xe_hw_engine *hwe =3D xe_gt_any_hw_engine(gt);

		if (hwe) {
			xe->drm_client.hwe =3D hwe;
			return hwe;
		}
	}

	return NULL;
}
"""

I can see why we might want to avoid doing something like this, but it's ju=
st a thought.

2.
I understand why drm_client.hwe needs to be assigned twice here (to avoid u=
nassigned
data comparison in any_engine call), but it still looks a bit strange at a =
glance.  It might
almost make sense to restructure the xe->drm_client structure to have a sep=
arate "found"
Boolean that can be set here:

"""
	struct {
		bool found;
		struct xe_hw_engine *hwe;
	} drm_client;
"""

Then, in any_engine:

"""
	unsigned long gt_id;

	if (xe->drm_client.found)
		return xe->drm_client.hwe;

...
"""

And finally, in xe_drm_client_init:

"""
void xe_drm_client_init(struct xe_device *xe)
{
	xe->drm_client.found =3D false;
...
"""

-Jonathan Cavitt

> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_d=
rm_client.h
> index a9649aa360110..5609fbd682650 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.h
> +++ b/drivers/gpu/drm/xe/xe_drm_client.h
> @@ -16,6 +16,7 @@
>  struct drm_file;
>  struct drm_printer;
>  struct xe_bo;
> +struct xe_device;
> =20
>  struct xe_drm_client {
>  	struct kref kref;
> @@ -48,6 +49,7 @@ static inline void xe_drm_client_put(struct xe_drm_clie=
nt *client)
>  	kref_put(&client->kref, __xe_drm_client_free);
>  }
> =20
> +void xe_drm_client_init(struct xe_device *xe);
>  struct xe_drm_client *xe_drm_client_alloc(void);
>  static inline struct xe_drm_client *
>  xe_drm_client_get(struct xe_drm_client *client);
> --=20
> 2.47.0
>=20
>=20
