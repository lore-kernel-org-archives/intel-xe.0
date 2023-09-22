Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99999E6FE2A
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 13:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1447B10E66C;
	Fri, 22 Sep 2023 13:23:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BC010E667
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 13:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695388990; x=1726924990;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Q5FvKPUbMBI59t4HzwxR9jUqYJbemRX7SOBZGlD/iME=;
 b=fYQZ+M3jva5RcDOnV8EWYGmTnU2c2gpccLbNwDjAMDkjzPmDnmyTwC9H
 Up1hf3fovIqpNHzh9PeSjDN1vTSTuafnsXWWyB9aG+IuJAHX67THteWne
 JATGGJBCWH7EMmXQFn2Yo/bOczVpDmRV/d4wH+NKLA+njnsBgbPjJXwhu
 T75WZlifsnLx+29CotLtHfF8RJ9jYMa3pXkZD1vWn6QBXt315b0AOD7j4
 VrdW2KpCSlEUTERgZn935agwHFbSUyBLt/ufw8Y+gA77uriPAGrraUSuE
 rW62HSqh+U1aQFd8Z7XQXYDpndpAiw0Z9qkDxZeU5M8noIQPvDz23aUtv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360206112"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="360206112"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 06:23:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="697180475"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="697180475"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2023 06:23:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 06:23:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 06:23:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 06:23:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 22 Sep 2023 06:23:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Un9jo30Cutxf7iEpMTmlgf9oAbrFKMnjYqvn+nyac4enwmdee+1QqCiy2V6MPWr1pSsoGll5yawXtBGRJ0O1/rsyPgpoipWDRX6tGgrf02HXBVMXtgNmbwSFlwLda1Ci6/xYvZhN1UcQsLIDpwN4pveBOmRArzxjl/aBxtAz/ViaHCD9Sj7HwkAghw9782brmkCSjwlcFfPMgRLhR+nrADkB4XjIKZUaPBSq71RkCV1Xldcy5LgT2m3tAyd1IwaqhKCPLFKMPO1E70maz37FwnnHiJb6tnI1ZNPhJOPT5+jNb/o3yY2ERKqoCkRqYjd31c/dqlcjJ7hXwv72bA98zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ms9SMMH4bgO3HlSdU5KjgxSmubTNrMqtBE+7MFZMbk=;
 b=RqTzay5gL+9to/KWqDa6WQ+8UH/mGTWkwEzoE6HcHjryBzZWZdHiJRzqaIIqP2aRLba0mO9yUymjf297E8VGV4Pixj3hQ5S3lWSXmGXxgujOyzIHVCB/ga4YR0QT/O+on7gVBcrCqQqsjSozYOONLk06x+ZXRZntscwBxnQf6/QuxRvr00dgNKOeh2cVbl0fQSQn0MM/Eev4wzYmZ7MltkK8Vct64RIP/0srjNpmRkZEki04hxyGJ4ybOtacPLcChBJ/aY8otcHuB034XgEvaS8Hc/YwFOG0by+ScJuC4ZAXSOSchioj4+9Nps1Y9XwARzXQdSS35Y2+bgXwnXvczA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SJ2PR11MB7619.namprd11.prod.outlook.com (2603:10b6:a03:4d1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 13:22:57 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 13:22:57 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <169524488052.6464.16955180030701567317@emeril.freedesktop.org>
References: <20230920194534.57856-2-gustavo.sousa@intel.com>
 <169524488052.6464.16955180030701567317@emeril.freedesktop.org>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Patchwork <patchwork@emeril.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 22 Sep 2023 10:22:52 -0300
Message-ID: <169538897268.1821.1432772930623630816@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR17CA0034.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::47) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SJ2PR11MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dffe15b-e5cc-481d-f76c-08dbbb6f08aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YEs+/ME6Q4ilD0HJE6bikSksgZfOCYRUcfSknAGrliquXHPXRiGD6oHQ3Og4CaKwtUu/bjVfN6letsG4MdYFQnIhlQ74L6u09pxpz6kS4sbk7D7Qs3fEkwForHLQZPBJtNTvTfNUolbHrKFDUOkwxsH2IYv57dDwHF5UJhGQQIbGeRYCTE5hkHezL5l/lPopg348lvLa8Q1tsoMHpm2D6som/kvUTmkl1TxIYp4kT7CH07j0SHGc6PkgIQmr9Uv1qOo23OnU/mHelFbFslKZqgI4zl6Bd3vz4sun4YEJ83fBySDzCMp4WSqL7v7kaBnqYyOcPbImh3BDK9VEmbu3bWXu0KLRIrAbyR+iQp57LT15zEaN4X4s+2lxcm+WsNpg93QUBVNwFnwh023kneQK1IeXYsgR1nrGyazpV37XJvYc7VNkZjGFG/MeyDt3mJjTLmlGeMcyj7HyP4uyLBPKmJvI9VCRgQuvzjSz8fAW1ERk+Lu/uF3rFNoSNBOnj7hfUFvGKPlw89FFej9opukOjqlsW80gsp+zdydDJ0VCpinbxqvv7MvEr37x2PftpIxl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(39860400002)(376002)(346002)(136003)(1800799009)(186009)(451199024)(4326008)(26005)(6486002)(6506007)(9686003)(6512007)(82960400001)(38100700002)(83380400001)(86362001)(41300700001)(316002)(8936002)(66946007)(66556008)(66476007)(5660300002)(44832011)(2906002)(30864003)(478600001)(6666004)(33716001)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2FoR00vV3BEVmk1NDlCZG5DVTByS2R1N3EzWG5TMDAvN3R4RzF4M1R3UVVR?=
 =?utf-8?B?UDJwMUZIOExpQjQ1UnE2Kzk5SWZ6Vlo5RmdhdEQ0WDNHTEpkcW9iYXY2WURK?=
 =?utf-8?B?bWtXZXo4eWtiSGJKRnVNcW5neThmaUdSb3BEZ050MWkrU1ROMWRYZktoUERO?=
 =?utf-8?B?OTE0dkVNdjZobkg5M2hNUXFhODVEL2Rnc0d1U3U2dWViN05PbUluYmNKODVa?=
 =?utf-8?B?ZlAvTjQwS1ZjL2ZnaFFRMFgzUXZGbjRFS2V5dlFnU04vcFZVWUZoZmJpLzc0?=
 =?utf-8?B?d0ZqWjNuOFRvMmR5Y3BGa05OYjBPaE8rU3hTUmRiUUZMZ3dKRGVQZ3M4dm0y?=
 =?utf-8?B?YWYzYXRidEc5RHlndTQ0dnBoaDhvZHZIWDU4dFB5NzBxMC8vVDdFVzdUQzF0?=
 =?utf-8?B?eXZ6QWdKVWVOWk5NRlZtQzBPTStNT1hoWVpPWVdIQ2N6QmNTZjVzU2ZWbXNk?=
 =?utf-8?B?R0hqdHNCZ0xTUmVSeS93R1puN05RQy9ocTVBVnZ2STM5NTNpYllqRnpXWS90?=
 =?utf-8?B?Njk3cXh3SHkxQ295TTd4ckJzWEJFUVFub1pnWkVNZzlMZ09yWG45QVNzVExI?=
 =?utf-8?B?WWlYNDhoMWJCOEc0MDROZzF4UXpGTmo1d2lSNmhzSm44b3dYc3VVZGdsY2lS?=
 =?utf-8?B?OVF0R20vNHdCbGZseDBTajIwRmNrOFdUTjJzSTdMeFJ4OG5YUzNUcTFxWWhv?=
 =?utf-8?B?UHROU0pNazVrK1VWWUhxRCsyNDlWR2ZiVjgyWHJBbHdpcVR4V2dwTzJoSFVq?=
 =?utf-8?B?ekhxV2JwbkxjYTMzN0RNakx6WmJQV3MxMW1rTVF3Q0ZSaGZnNVBwU1lPZlBN?=
 =?utf-8?B?OUtLd2JFVFN5RVZXMWM3M1hXbzY4ZVpKenVkN3QzV3k2bEhkUTd2aHE5NlRy?=
 =?utf-8?B?MEp6TjhTTUJNMVFZSGkzbXRJNUFoeUFDYTNYdmNJeEtKN3hrT29EZkVjaHhy?=
 =?utf-8?B?bWFvUE1WbFNCUGNxWnJmU2VXaDNoblRzYklNYXBNR3labkJxT0dqWEtXUllp?=
 =?utf-8?B?OGRuOEtNNDIyK1hFMVlnOHNMQk44ZDNFYWR5VTNFbTZTQUw3U3Z3TWFkaGpV?=
 =?utf-8?B?MGM5RnNHdjFQRVE0cUFKWUNWeXdRWXdUTC9XRHJxRGJrcDhLY01DWDVvcEZk?=
 =?utf-8?B?MFM5VEZYYk0zSGc2UE1xcHZ6dk1tck55N09zZEx1U21UcWRBSzRyQXNNOS94?=
 =?utf-8?B?S3YxMWJ1NlBpRXU3Zi9Oek5SMkhZV2k1QUxHbVpFYk1IZHZOQ2Nva1lMd2ZK?=
 =?utf-8?B?aUc1K0ZKd2RjVzNjMmlyTk1nTEp3TExrbjVvd3ZwOU9EQ1VJOWdrVUd6OWdK?=
 =?utf-8?B?SjF3Q1I2aWlMTXB4bzNoQ0IzZzZDSU9LN3RqYkVuUE9QUGJRN0M0cFByK0VF?=
 =?utf-8?B?MkloOFRxYWdEZzVpemU4SmdaM3lCWmJwNW05dkJlU0lGOVd4d0hKVCtKUlM4?=
 =?utf-8?B?VkJ3bWhlRVJEdjd3TEVSSVpWWnJKVmhGZDZIdllFNWEvQXBycklERjRKZkIx?=
 =?utf-8?B?MHdweUlHM1VkMzU3ZVg2N1VtTWlzcjd4Q1dFS3NBTlV2WE5SQXhxelUwWE83?=
 =?utf-8?B?SmphUlVMUHV5SGxqOHp5b1dPNkd0Q1R2cGhEZmdNckV2ckk5dU5vMFVZV3Mr?=
 =?utf-8?B?cFhpZjhqN09PeGFHeDdJTWV2YnNEdElWTklQTU44bXJMbHFGTmxVUjRIWEd6?=
 =?utf-8?B?QzBPS0JLa2wyQkVkME14SXZFdHpNV2NRVVFPUTJuM3JkcEdrbDVPazRaMVRG?=
 =?utf-8?B?RE9NN08wdGZCU3djV2VrZlRaUThtU2RXQ0VuVjF1OW1YM3pLYU41eTRuWnhv?=
 =?utf-8?B?WkJkNTAwY1FQaEhaMWR3eXNsSG55ZFowRHNxMWZNZ1E3Z014OWoxdm9NQ1N0?=
 =?utf-8?B?MkNKdmtZNERxcXF3T2FVT3F2TXBOMTY3RG1idmhSdkFhOE9qQjRSdk9iTUpq?=
 =?utf-8?B?WlR3a01VdDE3SUN2dFJIZUF3L1Q3Y0FkUTljbGFGRlV1bzlBbzF0SSs0VXQ0?=
 =?utf-8?B?NlhlL0xwY2RHM1RGVmJzOWs0R3dKc3kzMG1LYlBXdjJDYkhoNVNCZER5d24v?=
 =?utf-8?B?L1dpVUdmV0ZWcitpL3p2TE1idHpxWkVkTm5mVGZmc0FRLzBuWFNVdFNNeldQ?=
 =?utf-8?B?aWd6RzJEYXZSeFp3dzQydFZZbktXVzdPd0NnaC9WK3JEdWRVM0hsM3RhQSs3?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dffe15b-e5cc-481d-f76c-08dbbb6f08aa
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 13:22:57.1062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmiUz3fFqiKGrTKcwkON+HwEF+CvWWvVWIGhhsjhks3uLTA+9TAX4r7sMs0a/vEaf3T9fOZtljuRhNlmNdWyTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7619
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/ir?=
 =?utf-8?q?q=3A_Clear_GFX=5FMSTR=5FIRQ_as_part_of_IRQ_reset_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Patchwork (2023-09-20 18:21:20-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/xe/irq: Clear GFX_MSTR_IRQ as part of IRQ reset (rev2)
>URL   : https://patchwork.freedesktop.org/series/123920/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-386-805557401e7aaeeec5aeb1de6688853390738bee_=
BAT -> xe-pw-123920v2_BAT
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-123920v2_BAT absolutely need t=
o be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-123920v2_BAT, please notify your bug team (lgci.bug.=
filing@intel.com) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1239=
20v2_BAT:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@xe_live_ktest@dmabuf:
>    - bat-pvc-2:          NOTRUN -> [FAIL][1]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-2=
/igt@xe_live_ktest@dmabuf.html
>
> =20
>#### Suppressed ####
>
>  The following results come from untrusted machines, tests, or statuses.
>  They do not affect the overall result.
>
>  * {igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit}:
>    - bat-pvc-2:          NOTRUN -> [FAIL][2]
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-2=
/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html

Existing issue: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/722

--
Gustavo Sousa

>
> =20
>Known issues
>------------
>
>  Here are the changes found in xe-pw-123920v2_BAT that come from known is=
sues:
>
>### IGT changes ###
>
>#### Issues hit ####
>
>  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>    - bat-pvc-2:          NOTRUN -> [SKIP][3] ([Intel XE#538]) +33 other t=
ests skip
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-2=
/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
>
>  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
>    - bat-pvc-2:          NOTRUN -> [SKIP][4] ([Intel XE#539]) +7 other te=
sts skip
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-2=
/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
>
>  * igt@kms_flip@basic-flip-vs-dpms:
>    - bat-pvc-2:          NOTRUN -> [SKIP][5] ([Intel XE#275] / [Intel XE#=
541]) +3 other tests skip
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-2=
/igt@kms_flip@basic-flip-vs-dpms.html
>
>  * igt@kms_force_connector_basic@force-connector-state:
>    - bat-pvc-2:          NOTRUN -> [SKIP][6] ([Intel XE#540]) +3 other te=
sts skip
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-2=
/igt@kms_force_connector_basic@force-connector-state.html
>
>  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:
>    - bat-dg2-oem2:       NOTRUN -> [FAIL][7] ([Intel XE#400]) +1 other te=
st fail
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-o=
em2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html
>
>  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>    - bat-pvc-2:          NOTRUN -> [SKIP][8] ([Intel XE#537]) +6 other te=
sts skip
>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-2=
/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
>
>  * igt@kms_prop_blob@basic:
>    - bat-pvc-2:          NOTRUN -> [SKIP][9] ([Intel XE#536])
>   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-2=
/igt@kms_prop_blob@basic.html
>
>  * igt@kms_psr@primary_page_flip:
>    - bat-pvc-2:          NOTRUN -> [SKIP][10] ([Intel XE#535]) +2 other t=
ests skip
>   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-=
2/igt@kms_psr@primary_page_flip.html
>
>  * igt@xe_evict@evict-beng-small-external:
>    - bat-pvc-2:          NOTRUN -> [FAIL][11] ([Intel XE#389]) +3 other t=
ests fail
>   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-=
2/igt@xe_evict@evict-beng-small-external.html
>
>  * igt@xe_evict@evict-small-cm:
>    - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][12] ([Intel XE#482]) +3 o=
ther tests dmesg-fail
>   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-=
2/igt@xe_evict@evict-small-cm.html
>
>  * igt@xe_guc_pc@freq_range_idle:
>    - bat-pvc-2:          NOTRUN -> [SKIP][13] ([Intel XE#533]) +1 other t=
est skip
>   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-=
2/igt@xe_guc_pc@freq_range_idle.html
>
>  * igt@xe_huc_copy@huc_copy:
>    - bat-pvc-2:          NOTRUN -> [SKIP][14] ([Intel XE#255])
>   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-=
2/igt@xe_huc_copy@huc_copy.html
>
>  * igt@xe_intel_bb@render:
>    - bat-pvc-2:          NOTRUN -> [SKIP][15] ([Intel XE#532])
>   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-=
2/igt@xe_intel_bb@render.html
>
>  * igt@xe_pm_residency@gt-c6-on-idle:
>    - bat-pvc-2:          NOTRUN -> [SKIP][16] ([Intel XE#531])
>   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-=
2/igt@xe_pm_residency@gt-c6-on-idle.html
>
> =20
>#### Possible fixes ####
>
>  * igt@core_hotunplug@unbind-rebind:
>    - bat-dg2-oem2:       [SKIP][17] ([Intel XE#679]) -> [PASS][18]
>   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@core_hotunplug@unbind-rebind.html
>
>  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
>    - bat-dg2-oem2:       [SKIP][19] ([i915#2575]) -> [PASS][20] +49 other=
 tests pass
>   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-=
no-flag.html
>   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
>
>  * igt@xe_intel_bb@create-in-region:
>    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#678]) -> [PASS][22] +142 o=
ther tests pass
>   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
>   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@xe_intel_bb@create-in-region.html
>
>  * igt@xe_live_ktest@bo:
>    - bat-dg2-oem2:       [FAIL][23] -> [PASS][24] +4 other tests pass
>   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_live_ktest@bo.html
>   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@xe_live_ktest@bo.html
>
>  * igt@xe_module_load@load:
>    - bat-dg2-oem2:       [FAIL][25] ([Intel XE#681]) -> [PASS][26]
>   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_module_load@load.html
>   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@xe_module_load@load.html
>    - bat-pvc-2:          [INCOMPLETE][27] ([Intel XE#597]) -> [PASS][28]
>   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-pvc-2/igt@xe_module_load@load.html
>   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-pvc-=
2/igt@xe_module_load@load.html
>
> =20
>#### Warnings ####
>
>  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>    - bat-dg2-oem2:       [SKIP][29] ([i915#2575]) -> [SKIP][30] ([Intel X=
E#623])
>   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-s=
mall-legacy.html
>   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>
>  * igt@kms_addfb_basic@basic-y-tiled-legacy:
>    - bat-dg2-oem2:       [SKIP][31] ([i915#2575]) -> [SKIP][32] ([Intel X=
E#624])
>   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-leg=
acy.html
>   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
>
>  * igt@kms_addfb_basic@tile-pitch-mismatch:
>    - bat-dg2-oem2:       [SKIP][33] ([i915#2575]) -> [FAIL][34] ([Intel X=
E#609]) +1 other test fail
>   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismat=
ch.html
>   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
>
>  * igt@kms_dsc@dsc-basic:
>    - bat-dg2-oem2:       [SKIP][35] ([Intel XE#678]) -> [SKIP][36] ([Inte=
l XE#423])
>   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
>   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@kms_dsc@dsc-basic.html
>
>  * igt@kms_force_connector_basic@prune-stale-modes:
>    - bat-dg2-oem2:       [SKIP][37] ([i915#2575]) -> [SKIP][38] ([i915#52=
74])
>   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_force_connector_basic@prune-s=
tale-modes.html
>   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@kms_force_connector_basic@prune-stale-modes.html
>
>  * igt@kms_frontbuffer_tracking@basic:
>    - bat-dg2-oem2:       [SKIP][39] ([Intel XE#678]) -> [FAIL][40] ([Inte=
l XE#608])
>   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.ht=
ml
>   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@kms_frontbuffer_tracking@basic.html
>
>  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
>    - bat-dg2-oem2:       [SKIP][41] ([i915#2575]) -> [FAIL][42] ([Intel X=
E#400])
>   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sa=
nitycheck-nv12.html
>   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
>
>  * igt@kms_psr@primary_page_flip:
>    - bat-dg2-oem2:       [SKIP][43] ([Intel XE#678]) -> [SKIP][44] ([i915=
#1072]) +2 other tests skip
>   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html
>   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@kms_psr@primary_page_flip.html
>
>  * igt@xe_compute@compute-square:
>    - bat-dg2-oem2:       [SKIP][45] ([Intel XE#678]) -> [SKIP][46] ([Inte=
l XE#672])
>   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_compute@compute-square.html
>   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@xe_compute@compute-square.html
>
>  * igt@xe_exec_fault_mode@many-basic:
>    - bat-dg2-oem2:       [SKIP][47] ([Intel XE#678]) -> [SKIP][48] ([Inte=
l XE#288]) +17 other tests skip
>   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.htm=
l
>   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@xe_exec_fault_mode@many-basic.html
>
>  * igt@xe_huc_copy@huc_copy:
>    - bat-dg2-oem2:       [SKIP][49] ([Intel XE#678]) -> [SKIP][50] ([Inte=
l XE#255])
>   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeee=
c5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
>   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123920v2/bat-dg2-=
oem2/igt@xe_huc_copy@huc_copy.html
>
> =20
>  {name}: This element is suppressed. This means it is ignored when comput=
ing
>          the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>  [Intel XE#275]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/275
>  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
>  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
>  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
>  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
>  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
>  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
>  [Intel XE#533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/533
>  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
>  [Intel XE#536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/536
>  [Intel XE#537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/537
>  [Intel XE#538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/538
>  [Intel XE#539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/539
>  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
>  [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
>  [Intel XE#597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/597
>  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
>  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
>  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
>  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
>  [Intel XE#678]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/678
>  [Intel XE#679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/679
>  [Intel XE#681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/681
>  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
>
>
>Build changes
>-------------
>
>  * Linux: xe-386-805557401e7aaeeec5aeb1de6688853390738bee -> xe-pw-123920=
v2
>
>  IGT_7494: 8b5be5770319f47d71782bc89e4738aa63d6906d @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git
>  xe-386-805557401e7aaeeec5aeb1de6688853390738bee: 805557401e7aaeeec5aeb1d=
e6688853390738bee
>  xe-pw-123920v2: 123920v2
>
>=3D=3D Logs =3D=3D
>
>For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1239=
20v2/index.html
