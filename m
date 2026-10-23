Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E26606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VU9oCQGb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08D0112963;
	Fri, 23 Oct 2026 05:12:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4952210E57D;
 Fri, 23 Oct 2026 05:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792732345; x=1824268345;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LXXv00B3uoL5yTonoRDp6ziX4PfP5lUfyxdq0lcdKVU=;
 b=VU9oCQGbAPJmAPnnnpv703g0fMTZjyUjnekd/hADSca+NeXLUEsia8rs
 kF0nMj6grYkRJ5aZU1wEqk0n4YNv6m9gS7No69R3Hg/4HZDKvTzwVc9Km
 FyXQzg7X9fwja0zhYfwneNd9un0ZIHcWOZnAuDOihL1ktpHZOMiehOkOf
 cOvbdMRpsFHVmZ0OB82k5G+n74NJYGhN0hSZlj7usZkRAiBkaeBERFvS3
 rBOhV9euQBs2lrFMRiBSSn7XzkZoXYn6Ek/UvP6+6I0Cxtqfzq0l0tQjQ
 fvNKpGyWObaFpbb5EZ0gKG8B8wb/cEXyDdanhwvwgYZdgIS/oERDOQOi6 w==;
X-CSE-ConnectionGUID: OSUnh4iiRxGAJ5CsWNHO8w==
X-CSE-MsgGUID: aW/NaRpTT9ClQCdXrdkvrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1595138"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1595138"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:12:24 -0700
X-CSE-ConnectionGUID: C4OFVfKCRK2UBBtwdcnbpw==
X-CSE-MsgGUID: lnZRctcfRGqgR7u2dLSTIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3547186"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:12:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:12:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 22:12:23 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:12:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ejt4YaPfUnQgveE9cjA8rT4Ttp1UZyrVEGqb/sHtpr3dW64iUP3FOh6dWjs0gjN0ZKZJX2brm6Hon/C4BDCJjG3HNQ7PLCEoLJtkFtaWKy/ho3zVzjtDp+2LJd2OGU6CFGTgR72xekiCyf0rio5xZ2V4tdKjiY+ScT7c0vMl2h8NRUSj9K0oojzBIVfLNhyjRLFtWFb5qKeYPqcexqfrhOxuWSD+x6DI/3TOt69i3jzbQ8WcUUr0G0xqm7/NodmPWK6Vu7/9dCy2XigRqVILWin8VqpAe0U1h6deKpyab14CR00gH8f+/LSBYZzYMSPYApoN84ENTKcQGfEj64v3Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJwGMB0m+27TLN0/OL5n3xNoDVKlNaTnnCEAXdZthbE=;
 b=m149/wyyy4Jxt8VjAI7vDDNsEioY2KUL00CgCWERLvKg6S/CGanBQhtJ5rLD1YFuDZgLs8QVsKEL4ljbaVq79CGa18K7X1dihiSGEtPy8m0R5IvYSdhW0sAUA8c/2MuPRlU8OaY0Wx0ueITGf7J6mAbnsHcLw3qGa0S/Fcus0Q5P4t5bWoPS4aOe7qNqzx0c/FbqV/mY7eEzXvU9slqje5VD5vFtxL77Yw1uIfN0V+UHO7MohNkQN2Wslmlu2I1f08w3NdsZbxDoCY9yTCk4fqb8EWrTdw7t+kdSHPFjn3PdCvhUKWILPUeG5BlRufBisLqzh+ya8utBK567sHPqeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by SA1PR11MB5825.namprd11.prod.outlook.com (2603:10b6:806:234::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Fri, 23 Oct
 2026 05:12:20 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Fri, 23 Oct 2026
 05:12:19 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v8 10/14] drm/i915/display: Read back and compare
 Wa_14021768792 state
Thread-Topic: [PATCH v8 10/14] drm/i915/display: Read back and compare
 Wa_14021768792 state
Thread-Index: AQHdYqvIqqMKGNuEm0y+jw3b8utd07cKlK0g
Date: Fri, 23 Oct 2026 05:12:19 +0000
Message-ID: <BYAPR11MB37834249956F238B6DB01C13B2642@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261023050227.2068466-1-suraj.kandpal@intel.com>
 <20261023050227.2068466-11-suraj.kandpal@intel.com>
In-Reply-To: <20261023050227.2068466-11-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|SA1PR11MB5825:EE_
x-ms-office365-filtering-correlation-id: a22a1338-02c2-43a4-ea93-08df30c4366a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|11063799006|38070700021|56012099006|260925022911599003|260925021911599003|260925021311599003|4143699003|261021123027099003|261021121427099003|261009223027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: pk187uh0kmS00FK32g1a2kwWvo1e29LfGhTUJJ5La3GH/T8/OCojMJj4KDLYNwYkuzk/jZqDxvDyGf6UYeRTiXO4sc/VfFRuVgFIeR4wFcJNkFSsyf9nxcu9qJ3q4ateRLhAO+0/X9YIrZK7LZmgyJvPdUVhBNdUyUyzkjf4Y4NNgs6/1KSEU+mtxtvRxiXHge1+duZHfkCg6RnafnHGJs4iWiN+tKCgSNtGbJqay0H5tYLavW2Vt7UKUoFXzJ/sRDC461AZ4qsCgpQJ8YNI2FCeHX5bhDWz3CrNUvhfhf/mM9lS2adpZaz+6G5oFBVbSwJAN/6PhUWW5n5/I0QZBShEdlyqWOU6nu/5BCtIysSN8aVgV2cOCadk4L/oDa8Bs7Yez0sdPaggAfBjEu+nVKA6OFKgezEPaG2OxwUn2FybLniFZlHC6OdaJ+akX3du1NAYsnJ8LcQrv6omjH4YeJcLtKR1Fm18w41Om5e1+lb+X6yL033BjJ/emDKKrbjdCwn8w6OZ4Ihy3TXEguhOa4YQ/+k6+npwWPR4u4ynv6pQs0s+NakkgxECMSSR6euC2Z3bcdSGjG9PVQHs7yK0zltF2P0UY2FJ55UPUiZ8hUIwkK3LD6ZFY7m11PeubfvtWE6XXBfuj8Jy8XvQc499f7XoqqTB/lhNe1J6stqUbf0mE3M4ZyiToKmYQQ4i/1L7sCRvNOF9E9ZiaO0wS312WiUVPsK5MseSMlj7Q+NGOys=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(38070700021)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(4143699003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jkc/1sO8/FdInx3jEed5qYGyl7VxVO9glkesOhNbTFhy9Dy3ajV0vcprJOEj?=
 =?us-ascii?Q?nuDxU8Ie7cVQeow6rcEK81kILnlZ8XXRxBu94qZQ82T/46PzP6n8lFLGlNj4?=
 =?us-ascii?Q?7WcqUEpIxRaMRSvYD2er5o2Xg4mVSrSm0tMkp3xyMsSPOstTkSDsJ1neYL46?=
 =?us-ascii?Q?4szx8xUZVqLJ7qcLNN8sJggcoX9fvqEiWdwVC7Fxwqmn99HHK13TLZg1n+qE?=
 =?us-ascii?Q?lL7KfJTTqd2u8oE2MQyQPc+GiJC9l+T0gYSG6NCKmkAxBzQtoZDWso100yLC?=
 =?us-ascii?Q?FFaf+UoG6hnqwkKeRrNI7ZZn0EeeCouNLJHfnytvf+CXp08ee8mC5RvLhR4V?=
 =?us-ascii?Q?OSIjH6csTvUgeBzUMMBzGQUI0nUc1vRMLFJTErkGS4r89A9ShaZ6iCViQfp3?=
 =?us-ascii?Q?rK4l3Gtrdh3MAZyLSzVmR5Qjko7gw73h3Cs1q1smuIRyP2RwBOONOg47TIkY?=
 =?us-ascii?Q?SUZtjsJxxJC91LTzJD1Z6nabzzcq5WdjWn+WN6jxknRekF5iYIDrGS8TtkOq?=
 =?us-ascii?Q?w87sK8WrSC+MosWGGuWj/7pg7MaG7qbbPSdkp/JWx4UT4fDfQilVikz72MnO?=
 =?us-ascii?Q?jsVtX+5pc62ghCIH14CfXNWhiuZeIJUCfzAHqZ+tWNIQSE10M4KdYTOGiAx0?=
 =?us-ascii?Q?Gl3CTF3RJzyedgr1cUJYE73Jk1yi8Z5+uO6b70+gZ4bH97J2uZlAVq0bKZs5?=
 =?us-ascii?Q?tFIrzCCmI19OgFXwiXGkAx1HiKEKzsLahBwjwCN42pYhZ94Y5FoEb+q1odhW?=
 =?us-ascii?Q?eB7ON9BobXqSmuG6pOcHaIKB9B5vtmR0EXdlrJ50fjqSoJ0QoQ8iD9CdLcU5?=
 =?us-ascii?Q?crqHCurCOScD9PJAYb4E9KhNTZxsOeGpZSsCnOYz6UTvu5p7coS7R9uCQnqI?=
 =?us-ascii?Q?C5iii8HWIZT5kYXRY27GVHqBvOla41PdsiwG8Eoc7M0/6jwHfgrzv3nag6eI?=
 =?us-ascii?Q?jvd5q6IPmI7iLXQU38xQ/mZFNED72asBlA/ye6pBNGSUPP4tfI9pCf8ehy5f?=
 =?us-ascii?Q?Eq6JACZVJfT47bsRcx/NfmAcBpOO62AIefZj924Fdip8UZEghYF9nNcmwcX9?=
 =?us-ascii?Q?XofIrtg2uqiuQGsC2+ksBMO0xhVg3AmKF825Y2JIqGujeqoXyUSVJswJW2zW?=
 =?us-ascii?Q?SvOyfRv0FluwdjvFFA3k33Fefd/tmEqKqaC7Qe6VWX119oR/EeT6oaDM68Ju?=
 =?us-ascii?Q?LMWoHYMmdPoqZcP5ZP4PfoLaWsYKga3yhO8Bjm4wFtyFQmQcoAJ5hWxWUDP/?=
 =?us-ascii?Q?GZiG9DDSS9owoyX4CttBSlGbQcxUg+tO/n+pX6v93+55wbMqTOiSYBPHh7nZ?=
 =?us-ascii?Q?2fAsMa3dEhXpbehWR3BCWMagmzTY0NtGaONNr4Ne6SkPt7IhYw4I/4vRb+1b?=
 =?us-ascii?Q?075tq+YHM2lwJFqppqa9J8PZjWWm7nHqXp5yPAuuSNlXnLjp20fIjYfDtUYu?=
 =?us-ascii?Q?CplV2SgreZuH6f06uhEBes5ZXju2UvWiZw8LMhx5BrznRsm9zGE78qPphszI?=
 =?us-ascii?Q?a4bR+IRbqSm5IUsG0nFREuxRNq+/7eR2rR5o5uBLY18Uao5C+KdzVCzKPaq9?=
 =?us-ascii?Q?s2M7o1U0/rc7wqzX3m83eOyyrQUoo+w+z2hSSIBULCyxsoEebMVJoOqFN5VV?=
 =?us-ascii?Q?o10xakaUQTjPl7mMYwSRvooZWscPIqTcTK4wx3XyU+ZyHNTu26+ifqbZj0+B?=
 =?us-ascii?Q?rwn9UleVsZylScAFITPQxn1QgNSfnW5JJ/pzER2GvgFgSQOWN2LsRzXeVSQA?=
 =?us-ascii?Q?i6Glzfrq1V5I6pzMPOc5xsc0JK1UWMvVis6jQmnMlPM1oxggBvAT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dMrqRjgK26OdG3dwnnxBpodS0mOHSnJZIirVSEyzGSwhstKUFL+TaHUskfJouZbge21U4WkC9EFfOByXgfUiIkkZRY8UOjURWjSCFal5BMaEXRgsuKBsRprz0O8ljq+6PWeOcRC9A/lzr9QiGv8NPzvIHsM9DIoV5VXFQNtU5/z3AHU+KSD6OEJlOdtAc+V2v9AEaczKCC93K4RYKN8U5rB5c76xv5NlrFfJnlwM2fRtKh3CBCdmRujCg+g70r1DO02PI9LGayDJg9SJs04Qw3cI2dFDj4px8RbEQed1SnOrPpS+GowCFjgqTTBRGu/qb5i+vgZyOBQW/KmEhBa80Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22a1338-02c2-43a4-ea93-08df30c4366a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 05:12:19.3896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t+/lkbdZ54D8JojRyDRiJfCbzJI/okEU4nRH+kcQXTs4xpe3DfiLgNcAMCBoCRMIfxCtLZ1Nrn+6JRNGlWKChIb5lxb2qHK1Iyt6cpcLdwRQfutqVCcLEC1QaTeRL2A7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5825
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 23 October 2026 10:32
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Kandpal, Suraj <suraj.kandpal@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>
> Subject: [PATCH v8 10/14] drm/i915/display: Read back and compare
> Wa_14021768792 state
>=20
> Add intel_display_can_bypass_m_n_limit() to tell whether Wa_14021768792
> can be used for a given Link M/N ratio, and use it to read
> bypass_m_n_ratio_limit back from the hardware. Compare the flag in
> intel_pipe_config_compare(), so that a mismatch between the computed and
> the read back state of the workaround is caught.
> Unlike the rest of the M/N registers, CHICKEN_TRANS and HDMI_EMP_DATA
> are not double buffered, so the flag has to be compared outside the fasts=
et
> exemption that PIPE_CONF_CHECK_M_N() has for update_m_n.
> Otherwise a seamless M/N update could switch the DDA out of the
> workaround on a live transcoder, with the Link M/N values only following =
at
> the next MSA.
>=20
> Bspec: 49266
> Co-developed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 47 ++++++++++++++++++++
> drivers/gpu/drm/i915/display/intel_display.h |  2 +
>  2 files changed, 49 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index b48f12cc615f..ecc0e5ec181a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -3537,6 +3537,49 @@ void intel_get_m_n(struct intel_display *display,
>  	m_n->tu =3D REG_FIELD_GET(TU_SIZE_MASK, intel_de_read(display,
> data_m_reg)) + 1;  }
>=20
> +bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
> +					int m_n_ratio,
> +					enum transcoder transcoder)
> +{
> +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> +		return false;
> +
> +	if (m_n_ratio > 15)
> +		return false;
> +
> +	if (transcoder !=3D TRANSCODER_A)
> +		return false;
> +
> +	return true;
> +}
> +
> +static void bmg_enhanced_tgdda_read(struct intel_crtc *crtc,
> +				    enum transcoder transcoder,
> +				    struct intel_link_m_n *m_n)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc);
> +	u32 link_m_frac;
> +	int m_n_ratio;
> +
> +	if (!m_n->link_n)
> +		return;
> +
> +	m_n_ratio =3D DIV_ROUND_UP(m_n->link_m, m_n->link_n);
> +
> +	if (!intel_display_can_bypass_m_n_limit(display, m_n_ratio,
> transcoder))
> +		return;
> +
> +	if (!(intel_de_read(display, CHICKEN_TRANS(display, transcoder)) &
> +	      DP_ENHANCED_TGDDA_ENABLE))
> +		return;
> +
> +	link_m_frac =3D
> REG_FIELD_GET(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> +				    intel_de_read(display,
> HDMI_EMP_DATA(display, transcoder)));
> +
> +	if (link_m_frac =3D=3D m_n->link_m % m_n->link_n)
> +		m_n->bypass_m_n_ratio_limit =3D true;
> +}
> +
>  void intel_cpu_transcoder_get_m1_n1(struct intel_crtc *crtc,
>  				    enum transcoder transcoder,
>  				    struct intel_link_m_n *m_n)
> @@ -3554,6 +3597,8 @@ void intel_cpu_transcoder_get_m1_n1(struct
> intel_crtc *crtc,
>  		intel_get_m_n(display, m_n,
>  			      PIPE_DATA_M_G4X(pipe),
> PIPE_DATA_N_G4X(pipe),
>  			      PIPE_LINK_M_G4X(pipe),
> PIPE_LINK_N_G4X(pipe));
> +
> +	bmg_enhanced_tgdda_read(crtc, transcoder, m_n);
>  }
>=20
>  void intel_cpu_transcoder_get_m2_n2(struct intel_crtc *crtc, @@ -5478,6
> +5523,8 @@ intel_pipe_config_compare(const struct intel_crtc_state
> *current_config,
>  		PIPE_CONF_CHECK_M_N(dp_m2_n2);
>  	}
>=20
> +	PIPE_CONF_CHECK_BOOL(dp_m_n.bypass_m_n_ratio_limit);
> +
>  	PIPE_CONF_CHECK_X(output_types);
>=20
>  	PIPE_CONF_CHECK_I(framestart_delay);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h
> b/drivers/gpu/drm/i915/display/intel_display.h
> index 404168f4213b..d53b7b4a80e7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -525,5 +525,7 @@ bool intel_scanout_needs_vtd_wa(struct intel_display
> *display);  int intel_crtc_num_joined_pipes(const struct intel_crtc_state
> *crtc_state);  void intel_display_compute_link_m_n(u32 *link_m, u32 *link=
_n,
>  				    int pixel_clock, int link_symbol_clock);
> +bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
> +					int m_n_ratio, enum transcoder

LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>

> transcoder);
>=20
>  #endif
> --
> 2.34.1

