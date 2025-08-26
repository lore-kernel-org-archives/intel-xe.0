Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB46CA0FE7
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 16:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0479310E0DA;
	Tue, 26 Aug 2025 16:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lj3UsBw8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E114610E0DA
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756225553; x=1787761553;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fXGYLTghurNBOLTBBr+A5NxRSRVA27yvjSXzliXQ2uo=;
 b=Lj3UsBw831w8tdoqA1K0WfG/FUUezqUUtOaORdWDnFIpE3STJySN4hXC
 9f6g503xVkb3v+7paGgkdqhX3BDCTsNsphXmAZkiY4qOSAhfiooNhq/z7
 +A2HIPANKcu2+24bHRoh1pmGil9TzGSFQ/YGqFRGlPD3WTEJUB7j0a0Cf
 2khBKNPXPNweeelJW/26ewLnX2eIPu/rhyHXtn4xn/3s+5VWZxamK9oUy
 StcsZqrzWfOqtJBUc2DbLovG75kiKSawUWX/W5Oz/ciV6nvc83wrV1ZGv
 rhNplO9fhTCzfbJOei1eIANLD5wPGi5U9wS0szUiux2nM6/RX4PS69tCd g==;
X-CSE-ConnectionGUID: MCgGqt5rSIy8efRNeonUlw==
X-CSE-MsgGUID: y5yZK9ybQCGTSfEGHkLUUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58178652"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58178652"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 09:25:52 -0700
X-CSE-ConnectionGUID: eNn2JRRPRG+Z+tK1u9p9fw==
X-CSE-MsgGUID: NtqbOpfbTJ6XbMvxZCWP8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169127447"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 09:25:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 09:25:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 09:25:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 09:25:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpdCSBu2qxIgX5iPKZOQlh4JeN19Wye2mEeE2a7Sl1/+rwQvE5WRqjypTm4pcDnKQKJrdyJ3Zc2HDk0fDSzqVog12wCXkCAK3FUH5Le7gCOYtACGTooH0Hqt03eyRzuct43eezVjLE2+ysgNr01WULGw4SYqYDro6kyx8D5cJ3t97RtIXM0ntnEPBdAczWaSxE73Ih10jQkC2aJ5ZhmAamBkJL8sq04ZtXaWFJW2fYGW8zh5js+YXz/otk/6vLMfuu/aDYHZdr2NksDYBjQaL81R2t1g2y2GY8CR+3aj3UbVm68jWcNim9XcEBdOIj9CXKzyOrOrrHywU2YbZSwFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKd5rnLWHJbaJXttRn6f3m53Q330w2w/VWe7hKU67z4=;
 b=wJnNvH9t9yHr9yXUkoI/ufSRhZGCzg/C4D37H67VMZWa+bjlpBBWcxKBxdCIMbXv9U0RZ6myJU8WIQFvEdeWCvLeZaNxNPy9wxsVosj8jd3cpC/mQQP9dy/gCoT3is436c6D9ij33fWyFTX39d2BjMKKX3FQ/rZiRTnpXWi+NaJ+ZPoMGEiafOZPg2kqrr4g2DUC+v7NtRq/gFFgOamJF4vEub8V74SGnZTdOkrZFZ+vGSD9Y6YXJqaCMWuS/ypDQY1oF6jtA1qazUcgiHCvHk+QZWVko9GAv+7Pqa+hV0KLkE+NFyfQ4emz6jiPZsiJ5J2G19BSysT7dtY8M2bGaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by IA1PR11MB6513.namprd11.prod.outlook.com (2603:10b6:208:3a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 16:25:46 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%6]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 16:25:44 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Poosa, 
 Karthik" <karthik.poosa@intel.com>, "Xiong, James" <james.xiong@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: RE: [PATCH 1/3] drm/xe: early-return for SR-IOV VF in C6 funcs
Thread-Topic: [PATCH 1/3] drm/xe: early-return for SR-IOV VF in C6 funcs
Thread-Index: AQHcFhAor8yokalDvkmeuL2HMvd6m7R0/NyAgAAQLOA=
Date: Tue, 26 Aug 2025 16:25:44 +0000
Message-ID: <SA3PR11MB80461F0CD76DE78E6573F7F98639A@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20250825223219.1351786-1-x.wang@intel.com>
 <20250825223219.1351786-2-x.wang@intel.com> <aK3Ci5wSvj4-JrWg@intel.com>
In-Reply-To: <aK3Ci5wSvj4-JrWg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|IA1PR11MB6513:EE_
x-ms-office365-filtering-correlation-id: 8d599cf9-34c6-4078-197e-08dde4bd3518
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|42112799006|10070799003|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?yymBMGfru2g8u9OydA7mLnLPsPCyuaIfQs7zKd8ydiLel13EXh8yAXmN3ioC?=
 =?us-ascii?Q?cx+T4PGEFgnY5S1Vg02pkrLKDiMm2s744wuJs548AAVe1kjAAHPgG9xW4vRO?=
 =?us-ascii?Q?P8dwzGTA725Nruo32G1dud2J95C8SVr8/F8lJpIzipOlFv/qRwKk78U+HfM9?=
 =?us-ascii?Q?UZq+h6zun/vhbYOGAF6qKugW8RV4712mo7T18lveUOZG/lgolwHd/2pyq9fI?=
 =?us-ascii?Q?9iQx4ojyrpErNwAKem1z13UdqCK3UB3XH6uOIMs43XiJ70gQrnByZ2k0VQvB?=
 =?us-ascii?Q?9CIpsS29AHc4j3PNRwyZnNyKYZUhc+jDpZZCI9TeFBhg6hAz7AHrZCoaJGsw?=
 =?us-ascii?Q?+wtV2+b1zwLn4pU3Vl5d+Xj7xBYZUFRXK8t85YWPYVrm1DQkUqxea++xRyQE?=
 =?us-ascii?Q?BuHKlrJQg7RKLtmQKoh5LHq4XlbetWA8j3s1VbmgER6BzWwN3Hm5BoSi6bSt?=
 =?us-ascii?Q?/P7V99dvtZ1i1QkLJqY8J6M/5rY5pIGNtN+p0YkvaFY6WsXw+CxUYzWy2l4C?=
 =?us-ascii?Q?Vi8cvZrdIPvqzAON8iY7qihJkxIF//fGIJMgf3n/mf9fdH1ZJw17DasNCp4Q?=
 =?us-ascii?Q?qInSrEyCZhc+1T0nIA7W3LARfRlTIxw4MZeAxerQegeRE4NRwHLqesigBn1N?=
 =?us-ascii?Q?K0pfGRZ3Y6ZlgA6htlhfWj8VFsVt/SiNWGh/t3lCr4qNCICB2UEgjcipHR2u?=
 =?us-ascii?Q?aeB8Nq75KHMlLyrprCZPYaMv9u1h7G0R8gtfRfY/fw8VY/N1RyXldcpxI7lr?=
 =?us-ascii?Q?gauhzgFSN1LpUR8C9Gi4cG42viiGn6Oa+58IWgWhQ7ThTzzVq4Ss8v35dYXn?=
 =?us-ascii?Q?Ss5HRhbGlv5KLqDutGLbiAxarEP4nkqkgn1DS9OUKabGcOAA5eF9fs24A4oY?=
 =?us-ascii?Q?sFK3h8XR2XLV802eQV6AifdkXHCFvcydIN1c8XSc070gOv49wv5P2kdZpfqj?=
 =?us-ascii?Q?SCR/6CMc1HTaHmKmiFuJz0V1JK79O+DtUIrk8HwFTmaHL7Ff+EJ4lFumht7d?=
 =?us-ascii?Q?0CvhVa89MAIE2YmrOAZps3RatlCm+yYQu+yOXJpmZr/ZV/bwQv8x7+snJMlX?=
 =?us-ascii?Q?Y4IZAafPO08zbAggMWcp54cZrJTZrbmZmJ5WlbvJopOjwIIXYz/BXfVP/5Mq?=
 =?us-ascii?Q?3JDdHxKOmNg1kMkf5Ucz0KGaubw71aq3zk9kvayaBb312N2urH0wOQrR5qm2?=
 =?us-ascii?Q?XENo0nj2TMrceid2aCGAKGcMt1vERAo33t555bV6vj4cmYWz5UtFwgE8buGV?=
 =?us-ascii?Q?qxLyiXAyy2dFoxLwQvi6M/LJ1SU3YXLVRwbe+hpAJECtK7r/bjAtqgooiQEu?=
 =?us-ascii?Q?TbVDaw0R69E0fqwRBHGECz8NBntmHLeBBL9mhrbxksjnogHo7Eiio7xpHZ8f?=
 =?us-ascii?Q?Rd+6/33M0pVrEcpijomSxSL7nlx9KtkyvTcWQCnioSvnm6t32/BeD6VhQV9/?=
 =?us-ascii?Q?dPzbcdmzniuVa8qWmyjyUEpKeZJA9keNWV+14SdxCA5JccoYaZWSyj/oQb9K?=
 =?us-ascii?Q?HQLDH0v/3wA2004=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(10070799003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gHxdS3ErwxHAag/G0cH6zapxgSZhl5w3uqlbdm885T8hwfVbHDGSY8nvewvr?=
 =?us-ascii?Q?nTEKmi9UWSmGMmhWoUGewPWN/Ma0Y9jjuIOoDl5+La4X4cOCSb8OLPBaxOZh?=
 =?us-ascii?Q?gYYFWlFh/eLlWVmIZGubNExN0TfjyjyDaqSLCe8Z3HAi/rBLUb/Gustoivz8?=
 =?us-ascii?Q?6sYSHo72Y+TP/cRdT6hqDdlHbdxEUz9ub4TdWpTj6au9yAPKuzT49roEc44r?=
 =?us-ascii?Q?MFPPfTuf9UMfHpiPmsXzKg5s5bXSoDwnDXJwYwmxyJG5keYUUe3g0qAL74bD?=
 =?us-ascii?Q?wJ2D0URopmAB4v1Oh0EU/8QoHLHJjleZFqISOKfB6MoLq9QZUHGGDtwIR/3J?=
 =?us-ascii?Q?GGKrPKAReODJ7Ph/qn0Gy34HUA94NLdU0yOuxTDJupcVcCfZjT6MHtd5X6lb?=
 =?us-ascii?Q?o7/KU+G8JpA3yL/1uc0D47XKA8FYcD/E6xFeeslKyAMpKbfo8ghwvOEGrhXt?=
 =?us-ascii?Q?Wpizzn6boh8frCiJviekyFsEI4VoIKueoFLoJ6DgVqBtCjptazvWwiaGNjKa?=
 =?us-ascii?Q?z1Rcgnui6jZm+EazAZxLH/qxrUaOIcQJLi/dh1aDEoqamhbwKHAan+SvnZZ/?=
 =?us-ascii?Q?DDtMXIkuYruQf8R5DaYMhbQPE3t/EutD/+jocCJ63wssQ+L+cgNqMP3W2NRm?=
 =?us-ascii?Q?Aig7vJxZHZlk8N28nLQC1UgJjyMiEle/kOVIgvwED/PmTHgPnxvhM/r4O7bt?=
 =?us-ascii?Q?2pgGJhsWDxKjtT62Jp+clpabouVBxJ8yrjTBC2MXKhXsVxCSWVMFAZfEHhNk?=
 =?us-ascii?Q?ZrLq9/u8PMVhH+Qj9LgzgGbKSSnXeSAmckbgsaF9nDjndvKrqHUvQ5mMRjXE?=
 =?us-ascii?Q?HXeD5PGn1HUOEUDxRPrRTS1tsmTeSoPiYv4Bu6T/I1RpfKsyexWL3FAh212f?=
 =?us-ascii?Q?DmiRBlYc+ZlMqJe+7DqjRceZEUuWix3ioOtxKnsTOYYKxnZ+1MD9HzPhYNXB?=
 =?us-ascii?Q?+B0jsD5Y3lqDjWPQItFF5EYQ/+M7cH9DwyIRZGVwThqIX8MwHUHsdVbF1YJ8?=
 =?us-ascii?Q?bQXiDBkJ33ThtbOGk3AaHRlT/uAhfrL4MDe84Ys3VCHwaHT5LSid6TfVJiZ3?=
 =?us-ascii?Q?qd3dX5PUlNxm5UcIeZ+xPkOhEPP7wAg0Msr31l1rZOCj8xyfqqw4OYF1M/BW?=
 =?us-ascii?Q?PZj5ViPl0S51BD8G4zBgp/jBCH+xgkz/GESp7rXR896M9w63ILyrb0CKbrcB?=
 =?us-ascii?Q?Ln6H3oDKVi421hv2/A7li0h0OjwR/8zIlQnd8RWLBVQFGO5HPfWHCTONpqsI?=
 =?us-ascii?Q?IbbpaPGuuUKblLm4cc6mypoP6tI/9gIS7FSFEfNYViZYXRg/RaoLi+rd51S2?=
 =?us-ascii?Q?ZDEYEcaugj0KGjrwi1tfdsADQrc26Q/StMSZeBQpVrWaE1RAOw2kEKDOivPN?=
 =?us-ascii?Q?A/NBSA2+IpqykE5cGPEUPwgO1xg+9nBMyAEbTRKFF2gSbwfKFkTsmJb7SJpb?=
 =?us-ascii?Q?yIavLwysEFghtaxxTa6FK0S5/eRhq7pmX+5Gq9jHLZKzCQdlOxBkhIOcDRUo?=
 =?us-ascii?Q?gsfJlZh0aDdwJ5cNoEqiynjrAx7tGL3fqe6Az1ilU1IEffK0ksnUPmMNFWcY?=
 =?us-ascii?Q?dvUPAU5jC+2vH8Oql3F7Ocx1DLNtRmqidEi/+LtYvhNkprDCKHb+lnLHYybl?=
 =?us-ascii?Q?LqdUnmwq9jiR0V6QF4tKZMg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d599cf9-34c6-4078-197e-08dde4bd3518
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 16:25:44.6850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y5Q4HsDx6NLFHcyRVN7/+rRkj1NaPf7jmCMdY9k210V1DBlJwjQpP/YdZfu2JLq2JutIVWk1xtmDtSPFBqozHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6513
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

I will remove this patch and keep the xe_device_assert_mem_access() at the =
previous place.=20
In fact, these assertions are only used for DEBUG build.=20

> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Tuesday, August 26, 2025 07:20
> To: Wang, X <x.wang@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Poosa, Karthik <karthik.poosa@intel.c=
om>;
> Xiong, James <james.xiong@intel.com>; Summers, Stuart
> <stuart.summers@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
> Subject: Re: [PATCH 1/3] drm/xe: early-return for SR-IOV VF in C6 funcs
>=20
> On Mon, Aug 25, 2025 at 03:32:17PM -0700, Xin Wang wrote:
> > VF drivers can't access any of gtidle control registers. By returning
> > early when IS_SRIOV_VF() is true, we avoid executing the assertions.
> >
> > Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> I haven't suggested this patch. The only suggestion I gave was if you rea=
lly
> want to touch the xe_device_assert_mem_access that you should do in a
> separate patch with proper justification.
>=20
> The justification above still doesn't explain why you want so badly to re=
move
> of move the xe_device_assert_mem_access.
>=20
> Better to just give up on this and simply do not touch the
> xe_device_assert_mem_access
>=20
> Thanks,
> Rodrigo.
>=20
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_idle.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c
> > b/drivers/gpu/drm/xe/xe_gt_idle.c index ffb210216aa9..611c506bdad1
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> > @@ -377,12 +377,12 @@ int xe_gt_idle_init(struct xe_gt_idle *gtidle)
> >
> >  void xe_gt_idle_enable_c6(struct xe_gt *gt)  {
> > -	xe_device_assert_mem_access(gt_to_xe(gt));
> > -	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> > -
> >  	if (IS_SRIOV_VF(gt_to_xe(gt)))
> >  		return;
> >
> > +	xe_device_assert_mem_access(gt_to_xe(gt));
> > +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> > +
> >  	/* Units of 1280 ns for a total of 5s */
> >  	xe_mmio_write32(&gt->mmio, RC_IDLE_HYSTERSIS, 0x3B9ACA);
> >  	/* Enable RC6 */
> > @@ -392,12 +392,12 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
> >
> >  void xe_gt_idle_disable_c6(struct xe_gt *gt)  {
> > -	xe_device_assert_mem_access(gt_to_xe(gt));
> > -	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> > -
> >  	if (IS_SRIOV_VF(gt_to_xe(gt)))
> >  		return;
> >
> > +	xe_device_assert_mem_access(gt_to_xe(gt));
> > +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> > +
> >  	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
> >  	xe_mmio_write32(&gt->mmio, RC_STATE, 0);  }
> > --
> > 2.43.0
> >
