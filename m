Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F54C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 23:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9475010E0D6;
	Tue,  1 Apr 2025 23:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHyjfyn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE61A10E0D6
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 23:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743551652; x=1775087652;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3jsIkL3+SyixVK+8qWCP3+NmfRtqfyg0VCeYfa1EeEg=;
 b=WHyjfyn/sGpQo5VGEhTYUMTr+lKh99NAKtcCSPs0efopbe25hEdcQqD+
 KJCxqEN3BUagJZxuyYb9lj4J2ts7Hn37dMeadqC8v2/vokKwlamUWtfgX
 Emp/cLbtDEVvv/1/S54Arfc5VyPNLY/+dD+jcR8GENGxSVEDti416W9Am
 X8AaYRexaHusHu0nJvpdPuyOGSlgl1lgogmpwqtLYn7hthT/WoKuSwYTA
 m5/zmLJW2sjrfGDF/gjX0lRbzYV0JmOzxT+C2coi3UW9+17S2R2pAiWdL
 wrhNj8TBQMO2F9+9Nri1Sl13PhqwTtvKBRAmA0Yoq4MeOwUGtGcAxJx31 g==;
X-CSE-ConnectionGUID: mZ5+riyrTWu65DDodR20uw==
X-CSE-MsgGUID: 0+MRJ3sTS/yAjvV8+aShsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44806628"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="44806628"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 16:54:11 -0700
X-CSE-ConnectionGUID: DAf3edprRzuYIkSOxHioPA==
X-CSE-MsgGUID: P5gh89vSTNmu41dzVxRNWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="130640756"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2025 16:54:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 16:54:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 16:54:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 16:54:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0lIv59x69R9hIAb6IKR8oFc9G7oOcqQHStpX5NOf6+XWDYPlNUKKKAMRCdMeNwWyCS8Y1/Xu2VWykVFWSV8GJAqGuKJ0bGO8p21Om8S25Mp3TCovTfrRG02QfLmxTFRBa1ihwjP4SNqDq79NurJZ1lGapE/Xn4Ovrjklvv66UsIhbjYLsWvUMJZ9Lry5oneFRrvaw035SHLPQoA//WaaRk6dNB37u7KfzqlN4sVpIaRQEg+HxYgQS4oPCnOYngUvPXoGN/tb3ufNkM4s+kdjaf0r80VMCXQKlEXLua9z/ErTmRxnLwLE7iiEcyBc1fwOI2hulaIjXNR/TXLZoulYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/Qt1xQcY1O/2laURtj/r2SWIFS3zSVN0cXIh34FKhE=;
 b=kQ1sfzZkZSBIEC84Vwjjm/TzJeLCw0WSSpXyO6OsRsLMR8W3gkXbdm0N/5TMljZamfZfTaENlZo9jkXoloTCdWZFuN0jfOJ0QfYvqy0+vB9QlQqqkWQjRsDDfXjgyqcY90z6BT5VBKf3SEx0F2rIJ4dWnZHxWmU385gizc9VCBaS92bSf5RILfDy/wYDuxfXP6jKVOZB1SHA7eFUH0QtEwpFQbchrDMewrca9E08jEZfLScdpSthxxkVXpTjYTlzAacmXQfF2Y2WPEjAUb5YrfXE+WcPVIClBun+HXQCvL+da0tpIysBOR8njpaNSM9Qr74k13qJAsFKZvf8e2bexQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH3PPFA061B3868.namprd11.prod.outlook.com (2603:10b6:518:1::d3d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 23:54:07 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%7]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 23:54:07 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH v2] drm/xe: Add the missed value paramter of LE_COS
Thread-Topic: [PATCH v2] drm/xe: Add the missed value paramter of LE_COS
Thread-Index: AQHbo0i1KVrCmX+rP0KiXbGrh9PfJbOPU3kAgAAmIsA=
Date: Tue, 1 Apr 2025 23:54:07 +0000
Message-ID: <DM4PR11MB5456F3240CC1A028A3628241EAAC2@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250401205703.4179906-1-shuicheng.lin@intel.com>
 <20250401212834.GQ3175483@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20250401212834.GQ3175483@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH3PPFA061B3868:EE_
x-ms-office365-filtering-correlation-id: 5105cd0e-1f97-4170-80f9-08dd71787d96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?CB1ZcpsAxolcV0/BEqWzT8Qv97wP3EtLAoaw0w0SZnWSOZzkKTWX80tPf9qs?=
 =?us-ascii?Q?dAl9ZixpXVFm2ljzs4T7+ZH0dN4vLPG1eD2WQYdc9tloV+YQpzvFNYYBsOZO?=
 =?us-ascii?Q?2rJ1m++C0c6Bkh5bpB4RN5JnmVn+XsGSnhHu5xO2+5wTm2yzVL59tfwGlIYq?=
 =?us-ascii?Q?4J99kJwxHVl/auU/2NC2SnG7/7ti9d+rlQB/vBo95+cksTgR328v5Hwt0YzU?=
 =?us-ascii?Q?zGBO+o4Yzcp8z/+/2taABq6gYSW7avxHrbuO6Et4DEOhQqVjXIrm8os+CzuH?=
 =?us-ascii?Q?l18cWQqUJkDX2XuQJNMz5X/G/GVqLwA77LodueMoe59OpzIdtS04JNuKLGi7?=
 =?us-ascii?Q?Urdnrl+6ljzDO3LjK8+N73RsaHCDGWhP3mOj4gYWJAaIfRHkFG8sdI/pN52Y?=
 =?us-ascii?Q?KvsiwY2njurnvnP3QnpLgfs+wFhrl4M6vliDH6gHFRUPNH8jJY+OSBZ0oMfP?=
 =?us-ascii?Q?vzfyKXALFYdYia536bfrZ6T/ApFSF6jrtBIw2HQs1bp8Q9zrQVEdE4JHYlvO?=
 =?us-ascii?Q?fa0KgsuXkH4TGHu3HZIydXItBsPenK5SKmkUXGO1Xg1GuY6o9THUR2+PhqjR?=
 =?us-ascii?Q?VQfOQDU05/7ZLgnCrBWuPlNIFlDXfI70bE4r3M7cfdy33x/LOqahTLqy3Age?=
 =?us-ascii?Q?R5rFGuWihDKng7FqhUA1ykellP+1VrX+nlfDhzchLx8qiyupuZHdnlou6QHL?=
 =?us-ascii?Q?pcw0yQAHvvmZ8cDJwLSGLZ1l22bw4G05y4KUOZtzBrxmThK+4et6RxRoJidr?=
 =?us-ascii?Q?k0eUlCMDcfvjAMuKD4A2Ob43vWva50tHeyip1itprkYCVGFu3nFS4pyqo9yy?=
 =?us-ascii?Q?6hxjnZXWHKT0lQ77KFVE0j6QRQn2DSAO3zAlnlnNUGNjuZ3kbZdOAoLyLd/n?=
 =?us-ascii?Q?MmV26NTVV7d0azR2WRDm3S+KWovkWGUfs2wqNhDNf3VdkQljx1RsdKSl4hvL?=
 =?us-ascii?Q?CGXIZ71ZWenJzoo7+zB2rsK1Dxg/QInm9fZr3eSrDDVurLLQV6ZA5+ErjkTA?=
 =?us-ascii?Q?hs46UG1BAdU8oQKSE1+mnldQeyetfHb6fsunmRVt3wEYz99MTIy29Yym5jcy?=
 =?us-ascii?Q?ZSyWzril1taPakzw47asAwuMyykS1QoEE/bixaOVdwfOyKMo+gWilumktMdV?=
 =?us-ascii?Q?a5ut4WCR2yJKcAW+nVgJEkZ/i3rS6Afy/+acrEWiFyG2nSsmt909B7ydRTnL?=
 =?us-ascii?Q?Nl1+rclLSY8K1rBDXLzgbhZQX/72f2ywjOuaJccvCTMF3VdXagMBPlaHxgpb?=
 =?us-ascii?Q?yZfNvlrmbpnFHpnLznLQDPXow8K9R+Y+fhVR6p2yecJV9c6fCBkD7/TcbZE2?=
 =?us-ascii?Q?JtVBlMEvG7WE4R4TLheQTLYU0KHrO/UOGAiMMpXKJNy/xNMRR4JXGjrKOBNa?=
 =?us-ascii?Q?Bg8o679ToePyxdFO30T7PAwsOF+nemTzb3PPB29Cd0U8IZVdkKeQ7+HbvH7w?=
 =?us-ascii?Q?dC+eBscQIR+m2/zqzFQOxRSWgvNSK7qa?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3HakPjPQepkSIz0rYwC/hruvDd8vcp36RUxp1cPuLFVEZocWmj3DHTn3PiHC?=
 =?us-ascii?Q?sK7PjnJOcbQOft0B1CkdBcp74/GaY832vJm7iU45Dtwqkjl6iqta657+4rXq?=
 =?us-ascii?Q?nFes43aFdrlWzfUvjkJaqqZnifRj01KrVUF2IhqB+gQg4+/Np0ujsFyAHMSx?=
 =?us-ascii?Q?aRiPgFbNu3vw5hnZnbnPRo38MjBtAcoSeBIQckmXRBsBf4KJriRFF7W+649Q?=
 =?us-ascii?Q?SBmapUhUKe0UAs4XFmKxmiZOscpt1jbgv1OZhi5ka2neqhvMtHiZ/67KYyb5?=
 =?us-ascii?Q?v90QzSq7EszBYN+tT5vFFXKXGwXOoA4i6MMZ4l8MphMDNsAnXA+t0WjaurZQ?=
 =?us-ascii?Q?bqpwIxQAyDb9frLcRrVW4pRJCW+Um+gneZTozNcnsD8OvFl4n0OqGNyAPhPV?=
 =?us-ascii?Q?FwRmmNxr8u6vKuousRFCPOhHGiySggzCb9T5s28EMt+krSTAhSqiQfADLrke?=
 =?us-ascii?Q?gMyIkGrrpTwLvayyw4bq0jaedZHzbz+9YpbWG8tc7VkcuvTo/utbnSQsD/Wq?=
 =?us-ascii?Q?qUGlGhpEjH2GvIs4OsL3sO8/KwHcTug4MhuY0dbhW66Iga9G24fFSitKCbS6?=
 =?us-ascii?Q?ipa8E9HX1fRsiEJZF3kRB6r/9nkB64M2sVcd3XhLvPGTH2UNRMpo4EtJ/+ia?=
 =?us-ascii?Q?+GTtWBp0ofz3iSGhp7uw+i1w64OCCSLy1/iOChjc3rPH/BNar/zx6I96yITn?=
 =?us-ascii?Q?bhjOEz+n5Rhy6q0Vrd4/z7jIjv1/6+OSoTnWyOyXfMyT6EwoUPeNFw7Gr7Is?=
 =?us-ascii?Q?tEXlY99MVxZ9NNW9kjYfg0owFGrpdffmIRS4NiSvgyiPOV8HAhr0CLtJ4ONa?=
 =?us-ascii?Q?OzbIJ0A2uygQKPfk/MKOBmfldzmRHcWjhaGMBV55SezeQHUMRHgYOfGoYaxH?=
 =?us-ascii?Q?HTykCPlYo0bcBFr8g6QltNS/hpwGHvDfX2+bDrqfggsJh/2ABjqRtdyFQDou?=
 =?us-ascii?Q?0mZgu/D3qXhm7wjNK+I/+Sj0y3qQTxaMsXV1Z7MwndZSzthhBnQ8TPtM+K9D?=
 =?us-ascii?Q?43DaL18OR4SWMiLxBQssA9r4zANvZ4yruds5/grrMQ/EluocgK7FiXCDOWHN?=
 =?us-ascii?Q?HJ+5408HQPbxUYZ9rCG7QeAxclAnsslQQaq3xGo8JV6u5NTZO5LSVxVFSDea?=
 =?us-ascii?Q?uer7DuAncOnAW8jHVPNRJD0HVsP2TXO4hBQB7g7XGAEr8bdHp4NTghiLUbLV?=
 =?us-ascii?Q?RAQgniiCkLcwUnPOjBOTkUalC1pjmhrji3yDtKT2lVxq3V07V3Ykv/Srf5l0?=
 =?us-ascii?Q?dzz5tLaEoF2PAw9Q6Ds32xHnzhEs3dJpBdYR0s0jqemnYZbQbxGjQkliZSy+?=
 =?us-ascii?Q?rvOWN5SMuDuBTTPGm+EDXn26jNnjBu0kCHNzNcIw0jz6IaCYjKaJkuHjZP3s?=
 =?us-ascii?Q?0rO3r/8otPPZXo7PK3AbS65oElXhu9RJerN+/fsegq2YdH1xsajei+BlS97Y?=
 =?us-ascii?Q?7QzlvxP0SaslYAFhpOttRGAc+yizhUzUlJl3gQ7s1bUe3uQ5nKBQ6/+hntrq?=
 =?us-ascii?Q?mPA8QRHAvaQkz0aqzjWz/9cOW+6hzXjD31Qn3MLAK0jNe6o5d26PVbaEVuas?=
 =?us-ascii?Q?22/pkBdP26syvyBR9fl+2XWWcDqUE6bY+Gpaq95a5GiT45LFACz7Z6Lc7CHl?=
 =?us-ascii?Q?rXvrUMfWUUmw4ssiDsqQKwthdfMbCIYJ8pWOG973eoZ1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5105cd0e-1f97-4170-80f9-08dd71787d96
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 23:54:07.3236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qFXLyAtVDrrRD/W4WILX+usuriRf1WyfhkLkrVJJHZSK81YHZ3eWRpAb4Nk/6fdp9b2i4aw0LD05eSkgZAYXSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA061B3868
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

On Tue, Apr 01, 2025 at 2:29 PM, Roper, Matthew D wrote:
> On Tue, Apr 01, 2025 at 08:57:03PM +0000, Shuicheng Lin wrote:
> > value is missed for LE_COS
> >
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index da1f198ac107..042c8401aee9 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -62,7 +62,7 @@
> >  #define   LE_SSE_MASK				REG_GENMASK(18,
> 17)
> >  #define   LE_SSE(value)
> 	REG_FIELD_PREP(LE_SSE_MASK, value)
> >  #define   LE_COS_MASK				REG_GENMASK(16,
> 15)
> > -#define   LE_COS(value)
> 	REG_FIELD_PREP(LE_COS_MASK)
> > +#define   LE_COS(value)
> 	REG_FIELD_PREP(LE_COS_MASK, value)
>=20
> It looks like this definition was added in commit 9fbd0adbcbe8
> ("drm/xe/mocs: Add debugfs node to dump mocs") but has never been used
> anywhere in the driver (which is why we didn't have a build error).  The =
value
> for this field is universally "0" for every MOCS entry on the old Xe_LP
> platforms, and the whole field has been removed from Xe_HP onward.
> So it might make more sense to just delete the line so that we don't have=
 an
> unused definition.
>=20
>=20
> Matt
I am OK to remove it. I just have a check with other definitions nearby, an=
d some
of them are not used also (LE_SCF, LE_PFM etc). It makes me prefer to keep =
the
definition. Otherwise, it likes a hole, only this BIT is not defined.
What is your idea about it? Thanks.

Shuicheng
>=20
> >  #define   LE_SCF_MASK				REG_BIT(14)
> >  #define   LE_SCF(value)
> 	REG_FIELD_PREP(LE_SCF_MASK, value)
> >  #define   LE_PFM_MASK				REG_GENMASK(13,
> 11)
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
