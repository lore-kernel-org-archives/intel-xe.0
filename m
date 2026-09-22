Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23720C982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 08:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D529910EBFD;
	Tue, 22 Sep 2026 08:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0hW+H57";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207EB10EBFD;
 Tue, 22 Sep 2026 08:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790067055; x=1821603055;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=siG7dhkaYoTGef5ftfrSkjeQh5N1uNDhY5OFcq770K8=;
 b=J0hW+H57qa1WbmdiDvjjmrsZaXNZIgzn5GXLYg5RqfmBCIHuLyIK4KnD
 I1GCF5j1YFtSFZsw51jqXdPA5g9Dz5VJ9BV5OLMC/Zg/HYD+7eZHZNyG2
 lE0Oioensm9E8XryZZaMNpSKtiGQoemplIlP1VBUh5EHojFJ/xlOr7QOt
 XMgFYNr9BF5Ifr9LcmdtUqvI8MStgb5ve6YPRz+raVPzou2Btgku/KoFO
 U8K/X1x2nc7po51RgGv5xUim4fNfP03kYpvfpXzjtZOcQMYxy1dshYrXK
 Cla7ZuL1nLGlHzYykBs4grFInLB86h99UtpvvgS5ppS0sT8IFhK14YIGt Q==;
X-CSE-ConnectionGUID: 8rkFhT0zR++nmRHiiBfdmQ==
X-CSE-MsgGUID: 1KT0leGrQBmWTE2R5dyy6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90518901"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="90518901"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:50:54 -0700
X-CSE-ConnectionGUID: L8YZY45eRyWoVd0cUuHTRw==
X-CSE-MsgGUID: dY8lrEQPRHy+lc6WOGVAIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4026689"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:50:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:50:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 01:50:54 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:50:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuZ05Atj7HL8qbt5dXXW4kQF66otwg1a57tAJ8UvA5Wtk2xEYYoDHsSrg7/sXeKEXiZz8y/uiE+eJ/W75shfW8IFbDaaCFvLr1Dcy3xWWk5R0iao6rTkPyUpLPQaruZ2FF513IqvT8D7yB9jt5T9oVm3unkTmXnMVsUGHMfXDlVtGa1HL9vq6Extt1GQ+oX1nfido3/DnGY9MS0KET4BOKApIdd4zLe8NlPL7aUWX6V0VyvaBA2UNyvJiO4F6keNmdbRGFNXhHkX88pD0yLn/F9MeKGik6Vy7F2UEDpbQk49thzvPNGqqcIXYKX79oiYHOE+khEwScUFDf+FikJpcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXdsNoZFtIpSExmYXRGZbOH7OixqvCbeVC9bi8G4xnA=;
 b=o8Yd3V0sitw3E9cdnMFG2IKTwPR1M4HRKn7yOpfLqya5LjODDkKCSRVgO4fgJU8dK9yAtgbmDUpHmmtZXc/qhQ3YPzB6Lu9GETQ8ePvGD+UvVrH9VR1w47LfpdS0ldTvEtxVKRd2cnng/stY0P+fiq40hpRakcRda3nvh2ajbjemvZRuwz0QBrumBA/O7M/fCHfvmWJ0IdUMC8uRMsxvineOhyc5ewWevxkadYGA+Nnlnc7D7G+3FZnsyviF1k2o+IFVhGOhjMA+N1ddOGNPkLQr6e8X6LtJQvaNPZEhcMlmxA94FcwnFfk8atu29wAKydNa9wvkCCnCBrC8L57R4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by PH7PR11MB7549.namprd11.prod.outlook.com (2603:10b6:510:27b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Tue, 22 Sep
 2026 08:50:46 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%5]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 08:50:45 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH 1/8] drm/i915/lspcon: log DPCD access errors
Thread-Topic: [PATCH 1/8] drm/i915/lspcon: log DPCD access errors
Thread-Index: AQHdSYtSPWvrwR6JREmtm3895FBTyrbaSyLg
Date: Tue, 22 Sep 2026 08:50:45 +0000
Message-ID: <MW4PR11MB688749142C46E4F6396AA9FFE3832@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
 <20260921053710.1586776-2-suraj.kandpal@intel.com>
In-Reply-To: <20260921053710.1586776-2-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|PH7PR11MB7549:EE_
x-ms-office365-filtering-correlation-id: 46e71315-abdf-4c6c-4648-08df1886979e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|18002099003|22082099003|5023799004|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: Iq60fA9tjR3wRUs8eKy7AtwXdFColPhSuuDwA7XWUOg/v0BG+dK9tjqpeSKQpML3gU6q9n4TovOSeEIW4KNCI6yC0+OyJDuVudtvxvkYTtFeR0RtEAEuCq6JB9FQvMdRKybnFZmE5A2QS/DdINazD4fAuoIL1zOlOgQdv3zQplVjxgGGm2xIKD6ADJsTapBOKMsXHAgvt0NfYHgenYp79Nw59W52jJH8Dc16jWIkLDr5A52U9y540e5JlVpOF0Wzo3uauJ4YBZ7z6Wa2iF5RpxMZuZp8PqhuM3w+K459+1LW0D20A/42AbwLRV2ovFAKEDc7WAZNHhAI1ZAVBrozdX7nd1VjrGYNVo7gIOHIj8u38z3PxMEQrt+tH1eG5WPQO0rwei59WBNCMsfNqz7zjtTuyc4V1IqCpReCqT5mpkuLsu8lgzzcLh4FBwnSTPsPYXwSJUeIkVGdfPDXmVNiPIOH70hXv0JkkBSWI/cf4/zRprCIAOR1RCtwmvRiAf44PkjvGCEbTeA9Ehrb2KICQEYp8e6hbbEme9HFbIMU1Qzsq9kKW1or0WdGWT7Mo/uYKvXmPv1CY53JyJyN9H+pUc/tpqAf4zINXmrC3j0i+WUvnmy7XNSywD2xNFNrKj8pOd8stSY150KTcTPJPX7MtMOkB2akph1jCh8zlAdi001hFkfm3BRU9MTV7SRo08J7vvvXoeU2oVyFEqomnf1tysNB2fv9mQxW09IuyqHh8HQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(5023799004)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yYUNZ8SqYVNyYJWkOpogTV3UBilkTNAGijwR+8ucxbT4mzL+DyoZ8RqpPlJp?=
 =?us-ascii?Q?US92p6EZwYV0Ga4iK4PeJ853ToveWMmMoastWfHTMWQ9KOtKCInGUbyGT4JF?=
 =?us-ascii?Q?YqCLKbyak5JV2pkoUcJ77ZQlv+8A0Mbrs6Da4b0K7m0D89VObNUBKhcyxm//?=
 =?us-ascii?Q?w521sou0ddnEVfC81iyPsP7K0qpei7n1UayQXk7VLoGIxsR7osGAUlpMiAzk?=
 =?us-ascii?Q?sk4SUFmJLdZxlb4ViwdrBfAz1RHcu5dwv2kQkxUXeIIRzbD0eRHtqQ6/KOZ9?=
 =?us-ascii?Q?SfkS6lix3UZdB9SmJxG0KlA0rZ9WtTcax73vgNKVrvLA3plxGAI7I1XwYmtW?=
 =?us-ascii?Q?lhXGSIXn+6rKbfq4TEtQwDcUNb5E30VsTPZnzXuxyxC9NHCjuouwV0Q299fG?=
 =?us-ascii?Q?hwQAeFSFmKRFx1mH1yAP5885+KhqkIUi1BHv50EYH7ymG/qumRMqaDLbMk5E?=
 =?us-ascii?Q?mBSfym3PEuWzPTNhnPDOJhPPCvVJvDM31Rr4VBzcao9sLBt6teNRrLIpypmS?=
 =?us-ascii?Q?yc74Q5HNCXxM0AefxzMEiQ4vxUjwzCNikh+zfZDSxIDJiE6S/ZJbwTYv497s?=
 =?us-ascii?Q?mozZ0kbetf5DBrcP6ejQetQz1t8xCfokq6kz8Ax18Wu2rremBrtat8MAPkXH?=
 =?us-ascii?Q?0FvrdIR1YmENeZAtbphweSxaOg2KFhXTJ06OhmhIFKcXD4fMPuNGzFsy0f1c?=
 =?us-ascii?Q?Yn4U9MPWr4GQV6Qf+ExqXg44SKUD/mse/wVSpDilpVvGxMnjtRejCMClzfc8?=
 =?us-ascii?Q?TX2F5TfNQSN+ZV0cqQ20icauOJNCy4rALY06qvvfS8xmpev79XGXiK61UFBD?=
 =?us-ascii?Q?Kfv4+X5SjI3VQJC4x/fuMnlYUV/bVns3984p24KWh7ltXsYaHUyLEQLdfbzE?=
 =?us-ascii?Q?7aRn78mmpJj9u04ckdYl+LREFFtt6GUONqMDyk/D10beveiH1vTyrZNsCtx/?=
 =?us-ascii?Q?Le/0NoUMZywP2RhRKyGH+CQovHVn8ltn8rTC48bYpML7qNzhJdjxdo7UuPht?=
 =?us-ascii?Q?npXp0sSYzgafShalKxvmcYOZ2SLQfpJ4mHfdcODav7D1q7/OeiH2jHcJGft5?=
 =?us-ascii?Q?nHJa5PnPZVy/B6kAd3AZQNI64qVtyFj5MvwjWRwwna864GamzLa/S+UPQ+56?=
 =?us-ascii?Q?fxWfBzDaKjGxQkTLFOdq7WNQRY4rnlIZkYJ7iNuogXRCnk1jYH6ebrMKEWDs?=
 =?us-ascii?Q?vFDqlgFD4dAOB6xV7ffkXbhkU8MT0lYpQ/XA+Hk907Gps5+ezCFTalsIorSd?=
 =?us-ascii?Q?s304VKhCuBw7Wyd94baSTVf9wyQmlaKvSApcQrjyHqH6STIHn/EwGgOIFjCV?=
 =?us-ascii?Q?qN0ErfvTQX/MMKgrGjGnHXY3+sCYAQ4ragJg3doje0C/GPvy5eaB2lH+zLZY?=
 =?us-ascii?Q?8LejBO5eOblej+p3fm4p06SfWYyTwvWTuJ1LWybA5u8HVHNtyKbcGtJjQLJ4?=
 =?us-ascii?Q?2wHe2zPcC9//RBzLSR9XquS4xJ4qo1ZdczNiK27ZHg0PHPFGmH33ZvllsM3c?=
 =?us-ascii?Q?7Llm05sB/nS5h4/vM+LUDKag7RHBjHj/wdIemTIoQnDzcyFTYCOYz5HuBBTY?=
 =?us-ascii?Q?vQ1KGbYCy5zhpMx9VhBxYRoViZb4xekk1b7Rykh9OyJG9FSmVqLusWgJVHGD?=
 =?us-ascii?Q?EV1/ZoQ84zqCaM7Go0Iqz2dohfs9EI5bji42BT85bna7ttAH/e1cbmIFTj0g?=
 =?us-ascii?Q?5n15AKuaQQQwHWcnc/qJrSnTsNPRN5NFN2mv19EY9ryjY4enqSk9QlREu6vS?=
 =?us-ascii?Q?KcckZQKFWQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TGcdJrBwDv+JeXCttCAT1ZBBUGJKnmdiwmvmcgWanJa2GzBFW1wJrvmWhfcBh7WVFY/pLLxK+vFqm6kDrsGmWqpjVHX5KvR8BlEKfWcUTzJEKcfMSBcnlSTXqyo+MeXAYbwGG1KcH4UmGX7Fh29q3RBEk3BXcR3OWeye6r9x9MF7OgVycxvvJwV5SpgmLlluDhO9Xx1KFbCGMj8CXZhAVNwXLQAMIBZi72Q1Liwtg2LUqJOrXzP429x2MoIHh0krHw09TEQOaVQISBcUyY21w27k+wgahqIuy+ULJ/+ljCjYBv/2RMS+af0b8y6qf4iimh7aCOukz92keTUt+ekA+Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e71315-abdf-4c6c-4648-08df1886979e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 08:50:45.7959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YeWXw/8J6oo5q0NpYFNvIqOb7ws8SSuTTDPd1NvWTPkAn0cPVyLv/8RHwBa1dsz2KMv3JFGK7a49beSyL3aXDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7549
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Su=
raj
> Kandpal
> Sent: Monday, September 21, 2026 11:07 AM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH 1/8] drm/i915/lspcon: log DPCD access errors
>=20
> Now that the DPCD accessors return a proper error code, include it in the
> error messages using %pe and ERR_PTR(), instead of just stating that the
> access failed.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_lspcon.c | 34 +++++++++++++--------
>  1 file changed, 21 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c
> b/drivers/gpu/drm/i915/display/intel_lspcon.c
> index 07b5a9d010ff..82b40033728f 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> @@ -139,7 +139,8 @@ bool intel_lspcon_detect_hdr_capability(struct
> intel_digital_port *dig_port)
>=20
>  	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> get_hdr_status_reg(lspcon), &hdr_caps);
>  	if (ret < 0) {
> -		drm_dbg_kms(display->drm, "HDR capability detection
> failed\n");
> +		drm_dbg_kms(display->drm, "HDR capability detection failed
> (%pe)\n",
> +			    ERR_PTR(ret));
>  		lspcon->hdr_supported =3D false;
>  	} else if (hdr_caps & 0x1) {
>  		drm_dbg_kms(display->drm, "LSPCON capable of HDR\n");
> @@ -247,7 +248,7 @@ static bool lspcon_wake_native_aux_ch(struct
> intel_lspcon *lspcon)
>=20
>  	ret =3D drm_dp_dpcd_read_byte(&lspcon_to_intel_dp(lspcon)->aux,
> DP_DPCD_REV, &rev);
>  	if (ret < 0) {
> -		drm_dbg_kms(display->drm, "Native AUX CH down\n");
> +		drm_dbg_kms(display->drm, "Native AUX CH down (%pe)\n",
> +ERR_PTR(ret));
>  		return false;
>  	}
>=20
> @@ -339,7 +340,8 @@ static bool lspcon_parade_fw_ready(struct
> drm_dp_aux *aux)
>=20
>  		ret =3D drm_dp_dpcd_read_byte(aux,
> LSPCON_PARADE_AVI_IF_CTRL, &avi_if_ctrl);
>  		if (ret < 0) {
> -			drm_err(aux->drm_dev, "Failed to read AVI IF
> control\n");
> +			drm_err(aux->drm_dev, "Failed to read AVI IF control
> (%pe)\n",
> +				ERR_PTR(ret));
>  			return false;
>  		}
>=20
> @@ -371,8 +373,8 @@ static bool
> _lspcon_parade_write_infoframe_blocks(struct drm_dp_aux *aux,
>  		data =3D avi_buf + block_count * 8;
>  		ret =3D drm_dp_dpcd_write_data(aux, reg, data, 8);
>  		if (ret < 0) {
> -			drm_err(aux->drm_dev, "Failed to write AVI IF block
> %d\n",
> -				block_count);
> +			drm_err(aux->drm_dev, "Failed to write AVI IF block
> %d (%pe)\n",
> +				block_count, ERR_PTR(ret));
>  			return false;
>  		}
>=20
> @@ -386,8 +388,8 @@ static bool
> _lspcon_parade_write_infoframe_blocks(struct drm_dp_aux *aux,
>  		avi_if_ctrl =3D LSPCON_PARADE_AVI_IF_KICKOFF | block_count;
>  		ret =3D drm_dp_dpcd_write_byte(aux, reg, avi_if_ctrl);
>  		if (ret < 0) {
> -			drm_err(aux->drm_dev, "Failed to update (0x%x),
> block %d\n",
> -				reg, block_count);
> +			drm_err(aux->drm_dev, "Failed to update (0x%x),
> block %d (%pe)\n",
> +				reg, block_count, ERR_PTR(ret));
>  			return false;
>  		}
>=20
> @@ -450,7 +452,8 @@ static bool _lspcon_write_avi_infoframe_mca(struct
> drm_dp_aux *aux,
>  				mdelay(50);
>  				continue;
>  			} else {
> -				drm_err(aux->drm_dev, "DPCD write failed
> at:0x%x\n", reg);
> +				drm_err(aux->drm_dev, "DPCD write failed
> at:0x%x (%pe)\n",
> +					reg, ERR_PTR(ret));
>  				return false;
>  			}
>  		}
> @@ -462,7 +465,8 @@ static bool _lspcon_write_avi_infoframe_mca(struct
> drm_dp_aux *aux,
>  	reg =3D LSPCON_MCA_AVI_IF_CTRL;
>  	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
>  	if (ret < 0) {
> -		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
> +		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x
> (%pe)\n",
> +			reg, ERR_PTR(ret));
>  		return false;
>  	}
>=20
> @@ -472,13 +476,15 @@ static bool _lspcon_write_avi_infoframe_mca(struct
> drm_dp_aux *aux,
>=20
>  	ret =3D drm_dp_dpcd_write_byte(aux, reg, val);
>  	if (ret < 0) {
> -		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
> +		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x
> (%pe)\n",
> +			reg, ERR_PTR(ret));

Instead of , "DPCD read failed " it can be "DPCD write failed at".

Thanks,
Nemesa
>  		return false;
>  	}
>=20
>  	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
>  	if (ret < 0) {
> -		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
> +		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x
> (%pe)\n",
> +			reg, ERR_PTR(ret));
>  		return false;
>  	}
>=20
> @@ -615,7 +621,8 @@ static bool
> _lspcon_read_avi_infoframe_enabled_mca(struct drm_dp_aux *aux)
>=20
>  	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
>  	if (ret < 0) {
> -		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
> +		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x
> (%pe)\n",
> +			reg, ERR_PTR(ret));
>  		return false;
>  	}
>=20
> @@ -630,7 +637,8 @@ static bool
> _lspcon_read_avi_infoframe_enabled_parade(struct drm_dp_aux *aux)
>=20
>  	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
>  	if (ret < 0) {
> -		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
> +		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x
> (%pe)\n",
> +			reg, ERR_PTR(ret));
>  		return false;
>  	}
>=20
> --
> 2.34.1

