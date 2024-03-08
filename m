Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2634C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE2B10EFC4;
	Fri,  8 Mar 2024 05:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmpAWi7z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493C410EFC4
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709875628; x=1741411628;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7eEakolKVSxXr9eASQh+EqmFzlbR1rt6JzTeSl4IpSw=;
 b=LmpAWi7zq9zt0mQOtWebt4bUkiiij4y3d7hpcb/Q3ZuOIAJJPNk6xABV
 19mslWIO/294UPBOQlcil609/y9JiF97WSMYH3NM3CZDPRfICiai6arqs
 eEyMi+YYfCNiDbq1Gg/ItXsrks2R7zv8vPRhhHO+5YudTlnoUOAEnqULv
 fNlpgtRpgQjGbjy5XLu5Mowfw+Q6J3jn9FfX2ib/FB0yLolD/t3BDo2cb
 IS63Ucxo1dU5y2xPsPBw0tW+BfbAcOcmycuLoa/8ArCCnmy6oXpWWyGwV
 3pv9w1R3T2zp4GG0Ma137NZ4glf4vFLztSfZjyVXbV7GakHEvQ2225wXV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4451955"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4451955"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:27:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10797000"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 21:27:07 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 21:27:06 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 21:27:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 21:27:06 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 21:27:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxtDLKazxDq5kcV9MO379W97D7JI4KN+1czYrnqTH72vHMc0KUg1YVZ/oUu2VyV2oNzsIHeGN1w9HQXR3phnzovx1Bw7xekVs5F3ujJy7FkBTcayQSdhwTXTqX2qjta4BW6J80sTB6J7COqJ4g+6A8KmCTmo4uqdiBfd3ey+PNqXVSuoJDSpqh0Fs317C6pZRjo74Zf/4ciEGLGje4oMAt+ptXBpDbULZkaCiNYGeVnZXLX2Vmo5WRkl5aMn5NmOlsiGObeHuE0iByUaVocbpJrzXOhMj4yyL72Xn6Si/3OeOHJT+zahVaiPKhBXv8odIeNyYiPPUtOSV8eN/0/nfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rK/K5yL343u6Vao76V8xV6cyvRqAyXlLxHpLM8SqPHc=;
 b=M962MSjgxNCuB4i1oOhzVg9IHroQfBtDW0UgOf/q+nj1mtaYt8ETRWm4qQxi8lvVrjWTU0Iw/IERE8CjHL9EusO7vZrkYSC5s303XOEbvmhVSk5YJRaAXSAUyo9OHAFpATFpXKr/fre81Aa6j0uTPaGVnEctWppGUVpt3ixGUZ/Dr9WWQKssMv2h5iwFsqVzHRTbTDZVbnbEb1OG8NGO/oxK40hEVhyb1IS8Q1aE5UcSZUoaleYJtwr0WQgEIcRONYIwRlUDIq9Rxuo8EIYjMANEoB1nVFbTRXOoji4uOpqg2SiHSyPLBgj38hXfAiImtGOn2UMR3sqBy6+DVCZL8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MW4PR11MB7032.namprd11.prod.outlook.com (2603:10b6:303:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Fri, 8 Mar
 2024 05:27:03 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::c4b3:6bce:ab37:7d5b]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::c4b3:6bce:ab37:7d5b%5]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 05:27:03 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>
Subject: RE: [PATCH 3/3] drm/xe/xe_exec : In xe_exec_ioctl remove deadcode
Thread-Topic: [PATCH 3/3] drm/xe/xe_exec : In xe_exec_ioctl remove deadcode
Thread-Index: AQHacRBvRq9QLNCTNU6E69uToooLPrEtT/8Q
Date: Fri, 8 Mar 2024 05:27:02 +0000
Message-ID: <SJ1PR11MB620462E64C25FABA2DCB4B3681272@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240308043651.2010165-1-himal.prasad.ghimiray@intel.com>
 <20240308043651.2010165-4-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240308043651.2010165-4-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MW4PR11MB7032:EE_
x-ms-office365-filtering-correlation-id: 6f97640a-074a-4b91-8834-08dc3f3062e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l8O1Hy3XHa5I/0WwrETy6iohTqLYHtDjkMjwH1+RvavJJt2N0NTy+iZyw+CwhoD1Fi2BxhWC0G37udktRxunQh/y0/w97o9BBvRWOzwUeBf2uJkDCIZkCR56JqqY4QmqHrfV/SYkltuTD3kJjzr4sXc9GB6X++6y58FoVSOkQGScn2bVA6dbKQds/RcNlcqbeJzy8VQd589oPFDSs29txFMpyIOWc28Z1VTRSCmBX94y8iQD2HXMYOjpu/9juhCa2hssTD4EKMCSaGxL8RteJOaQYezddvYiynSuKp+1WSd9rZB7tWqkHTYQybT7XefxLD2HCdVRHp7DkpwdMpgTDTN1i0b3Q2K5p5ekLA8uSjpz7RSqvi29RzActCT5SVabDmkdDVZ/hgsfSdg+AFlO9nOLUyKti7cUTsdUbxjD/dsmn62joyYQmCx/QP91+hv0I1dhz91CeBxCuwA17eMg6b6iwtawbxlOKCSTOtIhzNayOonJyocn2uYZm/Fi+QHygSr9gFV5/KN9oSCypd5/ZZBXnstHLDY39f0SD+HBR5SSmxy04mG4ajpXZ0yzjsbSJ9IOE+9neiX7/me/TdEECFS49ZmcpRu5zJ3aDgIPvmsCXAHBa5/x3FSUNKNKbOoeVg7bIqVWNUWGGWRaSJc9cMusULEOe21IUMV8JPAMj75M1Wny/MNAsczCSczzzyGGq7hWeZgRFRFFTjkET6mf11h3SJhU4zvX4AZRsu5HCaY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t4eZSkfcYeBtrCh6Izsji6I+0V5I+sEF68AfNrewlquhecV/rz6/qo//i7+/?=
 =?us-ascii?Q?F3q//qd6Kmulz9niqh3vWdLjrt/Hn69u6PsFigmuG8EAvT6icb4Gj8doBVOC?=
 =?us-ascii?Q?UN+iP9HnmStNOHAob4IHTAfcSyxQwe5Ixu3DWhPUxZpvpiNQ2TNEuD95MaZP?=
 =?us-ascii?Q?N4hto6aXDhhxA3vE/JqO836iqrOZ+uBnBwG2odT6xo9AEkToDzTZjKQgRVOY?=
 =?us-ascii?Q?4oB7FcesYDS2YLEq8u/2hgIJRMuguL4coOedGb9dQJyiP8qUdVhjJEVlRCnM?=
 =?us-ascii?Q?SDwINVlFgb2Ae2jgEXvXbx/Y5C6YDUzK6ceomMjYEdyunuaMB8kwoWAfMsJl?=
 =?us-ascii?Q?m/zjL+/NzAzovbhAK6t0eQ8hO+q8ej4j8mNJuRN3MjmwyJHUx9SkPdzEXtv0?=
 =?us-ascii?Q?d/HQI1pF0Hrti0zG3XCq1a6BcZqE4xf1seActhsgi4D3ZWjj5vH52M8lHtl3?=
 =?us-ascii?Q?e7cBq5VIvh1KIibVhdKn7aR6An1RGYZU1qw5/1U02MpA3Tmg3TSKRWljn27n?=
 =?us-ascii?Q?aVmebXybZ4tOhQ4+TI9T6kXjZLjqGi6ajrSAweGAkaRRCfc1R61zWGTgaoAW?=
 =?us-ascii?Q?ry92HiK8C80bA5lMf8QRUVmhXrTBa3+FsEn2BcRTHZ29pZpVGlBnuAa/qHZw?=
 =?us-ascii?Q?dNHgLXiHKe8eofTRulpjxwL+/Vq0sTAbaNYCBsIfbRzFtJ6rvWfAj7F6z2Qq?=
 =?us-ascii?Q?CPAaOfJGNaqs+cwNnn55Ku2ks2si/6ELviGrVHt4ysoAhax0X9j/U66ns1Fi?=
 =?us-ascii?Q?wlUnE6muv1usz79Ly8xTSYOm2wGbJfFlIkFnUHGbhkPTHEJqXfyRid0PZ9hS?=
 =?us-ascii?Q?6nICjsiAEWWaUBAArL/WuySEwnItSfTW+rszsrK6d7XwGyxtzZUek1Yt6bkn?=
 =?us-ascii?Q?DCGotQJUuoQJgLyxuKps/cV2JF3+9nsj8zHMaPOQDlVir1TfiMPhJEJV7MAS?=
 =?us-ascii?Q?ASWmy2IdZGd2kBHb/HQLpwXQI+bwkMy9oNK5ndB/lf/ZXkUt88hZwGNcFy4a?=
 =?us-ascii?Q?f6QztkqgShOXW6X644h3xfVHqljXmFZtDlTDM7+hNFjX9CIMvfOAzt26BgAv?=
 =?us-ascii?Q?TeM+BWNRGbprOouOKB20YmZhcmENAlq1e3si8GlMxpgFpJ8Lzqaoq2iHNW2N?=
 =?us-ascii?Q?D8FflaQR58nP6FkTwyAmWH0zee6FaRwdhZUzZk1KQiDoiBv+itsB9Rr5HoX7?=
 =?us-ascii?Q?GvNdbqQ83qRZHtJHjThxSDDoE8T7rMdmBX1HixrCj7KBipPwOqY99yyUdHoa?=
 =?us-ascii?Q?/jEk3HLY+OV2s3AwGfTL7Zp3QYSol1kqueMgn6XBe7aTkrdIr0s+IZH/DOAK?=
 =?us-ascii?Q?SMd9Bw7cnR3LV5VhG8CMMMMy9KwQyrCfm0hXLgh2p557pCtRkVnBdVoKaOdV?=
 =?us-ascii?Q?wIaU1PQV8I03Il88r2vfU64NDBSUzWhzQCZmsPF41Kki12x6jQZsE0SOC2IG?=
 =?us-ascii?Q?2LuaC9/IdqjOPH8so7Iw5Wc6qKfRB6CvSG/3dRCstP2diQAERJv8f/Kc8Z6v?=
 =?us-ascii?Q?3vzkuwy7wsEysfkSRfROe5nciDair3Vl+WkzAi40RX56LFJ5uZVgLheANpeS?=
 =?us-ascii?Q?In/z+yWe/itlnynvl2ChTSpetsubcfNIRauLYATAp09AX21zCkPv35ENUoEF?=
 =?us-ascii?Q?ELmpMFKrE1jTkBgGyv5+Xgc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f97640a-074a-4b91-8834-08dc3f3062e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 05:27:02.9714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yKlW2YzYlh9MdmWastzXqogxRClBSidQ9esQU4djmYq5dMjBW9KlOkFYjzoCk3aAKGKPRPD8ZLZa+SgXwvIfBiJZq536rgkeQKbzYan1ORE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7032
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
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Friday, March 8, 2024 10:07 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
> Matthew <matthew.brost@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>
> Subject: [PATCH 3/3] drm/xe/xe_exec : In xe_exec_ioctl remove deadcode
>=20
> At label err_unlock_list the condition write_label will never be true.
> Remove the deadcode line for write_label true.
>=20
> Reported by static analyzer.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 952496c6260d..acc066e405d0 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -380,10 +380,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data=
,
> struct drm_file *file)
>  err_exec:
>  	drm_exec_fini(exec);
>  err_unlock_list:
> -	if (write_locked)
> -		up_write(&vm->lock);
> -	else
> -		up_read(&vm->lock);
> +	up_read(&vm->lock);

LGTM,
As write_locked never going to be true here, this is possibly going to be d=
ead code.
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  	if (err =3D=3D -EAGAIN && !skip_retry)
>  		goto retry;
>  err_syncs:
> --
> 2.25.1

