Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED04C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 14:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4148710E1BD;
	Tue,  2 Jan 2024 14:28:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACD910E1BD
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704205704; x=1735741704;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=HmtISVJzd0GImo0j/N59fiJc4UqzhNOk5c6Z+KV/rRk=;
 b=kqjC20VAEaIwN2D552TIJDSw3mW0MJt3DgH/P2fN6GyL0LWN9mUsEhva
 KOyN7UksY97Xbxl5JFzQomUjRiDU9v32e03DoWVKMvoRnojv0QfVyR6tn
 3mjPel8vPhi8YPFhPI6bp1BO/2N2e2K+41o69wWRMJX4SqHh1kwtudIHz
 z1cU5yWZlgIfyv0TN3P4Y9vTjlG1CgZdsIurd9ht3TDmfo/7w9TmBN8mu
 m1PkISwV+Jj6q23j7DZ/pIyKY5NrJAdGNYcHoIrwG9YyCoLGZm/qRmsPC
 d3MS19wAskJZFhzaxeBfb3izGmlaG/jM8sThswRtOZ17bR1QvT7NPW84m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3719850"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="3719850"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 06:28:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="21799643"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 06:28:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 06:28:22 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 06:28:22 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 06:28:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7q+vuC+9My+53wNxtIlT+KpKjiFiWeJI6Eg7yEvoX/rCBsMWE05frbtb4eIrzPH8WvvlqLcELAPoSOBD7zMBLNhzjcLdSkBLNzhPXSQsL3aq3ssw42spg+wJ2R5lNb7CRvXDt0v1fynmUWOeWFZ+/is0KndIhKJRZIaLks+xSmbuKW18AZqONIeEX39NxKkxLBe1INZ1IigAZhXh5IlMSsCr5lW9r+4RiMFLIYGvFQFX91YvHYKkrkaqHehCUHCfJPKDUfnWOsUuFH3SFNVSvcDewhqxVYhezaeoZoGcSd1Izq/A6iN7lm3npK0Wz3sr2rOpmK/GIbJ8qPPUWjEjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYf2fVLNmtgOb74vuIMovqKhkSMf+vd1Qfv4pSaSGvo=;
 b=BoPwPfJc02VQYPd7tEfb7oRDX7n2i6+9U5Dws3MNjHtq+tqU92jA5x9kCmRczvaKSnleoraezQCs1cBrdgYvGnoES3uQxzZvA4rOfEdX+IVX8JweVVew1TUpwAgJUttnMrMzy2lvWz4mbXhVtWJeQZkn7i/m+dFxrpf53xvbX5FeWnNutnpUYl6sseLClhKtwE2gqea+eFa6jNrDrhyKyw1SMizyIMJh6I5fBO8xPNLEfGhkHA52lAmzSSCjFufU2/65LkhO/4Tg3QAOGd5nu7e87BvVu8thAHWKsGK/kOHWQ1h5VzFp502sG/sgYhFTTA69l5/PoMqPoJaQOZd3aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SN7PR11MB6601.namprd11.prod.outlook.com (2603:10b6:806:273::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 14:28:20 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::ac50:a00f:447e:a3a5]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::ac50:a00f:447e:a3a5%6]) with mapi id 15.20.7159.013; Tue, 2 Jan 2024
 14:28:20 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231228110526.383245-1-luciano.coelho@intel.com>
References: <20231228110526.383245-1-luciano.coelho@intel.com>
Subject: Re: [PATCH] drm/xe/display: fix type of intel_uncore_read*() functions
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Tue, 2 Jan 2024 11:28:16 -0300
Message-ID: <170420569634.33674.7537814207321369421@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR21CA0029.namprd21.prod.outlook.com
 (2603:10b6:a03:114::39) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SN7PR11MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: fc1bdc55-a953-43a3-f829-08dc0b9f1184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H/tT49Zi62RYa1/nPoOT2dQnce2Yj1m/RuPwAuyO6Qm8nU0lu91TBLRfm31GbRpxnNmLr95c8k+lIANHakq89Gdhe09PrS/1TO5NyTiwBMmovHgkU5h89tdiGn5ZZBaKMw/Jwxkf8Fr9SCIJicPvLiuJJ6vYvbMvYCzEf8/F47OfuEzMSQOcDEqlBVuAo4qUsE62Eke8GebYt0N/pa/9DR8tu5s4CJo6zHoODehpRfnD/knZqNbPbhSE8hphflr+0prFYProJzE+N3jUBwG1svCKwA5d8J8BDvq/SG5iwDzcqe6H1dZjyoAnpN0/PTVEp6eCRpri6sk39c4lc+EdNmRz3jLJ19j5jdbV6c6tl6CsZNSEB05hb5km+qM+6XPnKqEGJYgSI8B17wl9QereYVlCAYLiWX1shfrG3n9gajQ80xfG7w9E+0iVvtSXTurGYQQYcUR0YlXEKdxb0dyP2coWlneWVCmrb8rxdz+Gb7P1zq3hXpSWJJbDuHkTB/JBgRF60lYd1lW62aKabbOR2LclK0k1X3hde3EuQnHzeS3hlggTp4Pyi4I+tRDQ9wQf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(346002)(136003)(396003)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6512007)(9686003)(83380400001)(26005)(8936002)(41300700001)(44832011)(5660300002)(33716001)(8676002)(4001150100001)(2906002)(478600001)(6486002)(6666004)(6506007)(66556008)(66476007)(66946007)(316002)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3RleWN6V0pQTzJxbWNwZVB6cGRUMllza2NGT2x5aWxrbCtkUVA1ZS90d2Zr?=
 =?utf-8?B?VFFVSUF1RTh6L3Nmc3V1MG1NS2hvNy9vTFcrVkFrUytSS1gwRWduMDVZSEJw?=
 =?utf-8?B?bWhvSmp1OU1qRFRqUUtCMitwQlhnL0ZTSVg4WksvRTNaVzNHVWIwUFFGVXRF?=
 =?utf-8?B?SzJmOWUxdFAzMktJQTFSdUkvRy9DWXQ1ekZxZjI4TDExUUNFZkc4dEtoUUFu?=
 =?utf-8?B?SXNqeDhqMjVwUWJ2TERrMG1tQkMydlZhdE5GRzR2K2hnb2ZxRjVOYUlBTXMw?=
 =?utf-8?B?dXpmbmNPdHF4blZhbHpKd045d0RJZ2FEdU9Ea25kUThoUnY0QmVRTVFGSjQv?=
 =?utf-8?B?K3JDVXRKU3lwWGNQT1NyUENacVBrSHhOUWIwOW1IRVJGMGxsUnRSdGVEYng4?=
 =?utf-8?B?VU1HUjQ1UThaaTZkWWVtRE1HbUlsSUFBMnUyNVhSeDBlTS95VmRsbGQ4Qld3?=
 =?utf-8?B?VlhyaG50WEtQZWpNR3N2M2RhYnBscklMZVBsSERsb3o0NG5VWjdFY2NIYzJ4?=
 =?utf-8?B?RjFPeVdVU0lKTm15U29OWjFTcHkxWmg3Y2w4RVlSSXlUZ1hHMEhsbVVsdTll?=
 =?utf-8?B?WmhkMnprZ1NHNHNRdVV0QUpnUHFrRXcwVE85QURWRmpXM2ZNUStIak9mbk40?=
 =?utf-8?B?cWgyNmFWUXNKcUs3YVFCcTcvV0lQTGZLemhleG9oanVFZTJDVVV1eS9vbG5M?=
 =?utf-8?B?dXFUbUF2L2daOVdrdlNhSHJZWVh0WkNzZG1hR2ZMc3kzanM3c3l2eGhGS2xv?=
 =?utf-8?B?R2Jtd1MzZGU2VmxDdmk0bzM1NWJYTzlPS0xEM0UxYVhNQ21RS2V3NW9xM0Na?=
 =?utf-8?B?cFRLSWlCSjBiaWhPbzJzZzlvdUhqTSt0ZkRmcGo4SXl5YWRGMS80cm5TN0p1?=
 =?utf-8?B?cjZQa2FqSC9nVWJSTHdWWm1Iai93eExMeVdqNGJrbitiN0xIQ1lOZ2pteVN0?=
 =?utf-8?B?QzZXK0ZubXBwUXpEeWswcXFWLzZTSG5lNVZmQXZtYXlOSDcwQWdPOUxsc1lD?=
 =?utf-8?B?bDk3QVdlQmU1SmVCVCszN2RzMTVYRkNrWjFVS1NrczNXeFJuMEw2WFdqSGZq?=
 =?utf-8?B?VzcybXFEMHFtQVRUWXZQTGdKaXZCNDJKYU1QWWh3N1E3ZDJWOVYycEVyck9H?=
 =?utf-8?B?cEFTQlFOdExYUUVIenIwRmlvc1dJa2V0VmY2T3FhYkNMRTlLbVJVOWQ0MTJ5?=
 =?utf-8?B?RmNEWXg4WVpFY0RhSUJqYktLYUFBWWJCbFM1WnVFbG5hNmEzTjV0TFRNNFU5?=
 =?utf-8?B?SFUvZ3I4OUZHNGllOS9rREVESGRlMWNtOWdLQnZjOXlqSXU4dklrcVFhMFY2?=
 =?utf-8?B?eGN2MWJpY3h4VnYzTDQyT3NZT2dKUmFrTFpCQVdkcGMycTdyVGNsREMvT2VJ?=
 =?utf-8?B?dUVNOVNPZ2s3MEcvN0Z2TUUxeDhuenlkR3ZNcFN5ZUUxaUJtanV0MjNaZUhM?=
 =?utf-8?B?N1Y1a2x3dGFyWmRjdEJPaVRnNEpGQVNPQlRoTkpyNnRJY1J3YVFXaUE2VDRB?=
 =?utf-8?B?RHJUYXQxTHE2eVBoZHdJalMrbzRUcEQwa2U1SkZsWWJ4TFd4WDB1ZFdCVlU0?=
 =?utf-8?B?ZGhnY0g2NGxNUk5wZFhFc1BjalV1V09XcTlmb1RRUEpIcEllZm5QbmQ5bmVG?=
 =?utf-8?B?YmJlRHZsdTlRSTFtQXdqUHFKVDMwOWY5Rk5sV0hCaFNBcVlXUUNJL1RkN1ZI?=
 =?utf-8?B?RzR4bXVWZlpJdjREaDZ5UG8zSXoxb3NKaTBzYzdST1RIeExvUXdvWklRVlBq?=
 =?utf-8?B?WHJjUFcwNlFuWDZjYXQ0NFZFU3lYU1pSZnZ5dzI2ZHNSQUNSMHNRcU4yUnAy?=
 =?utf-8?B?YjVWWDN0UEt3aitUd3k5ZzFMeFJQdE92bXV6UEtOZFB4M3lvMXZrcmtXNlRS?=
 =?utf-8?B?VzhqN0NnNm1xQmN0R01FUUFycTNVUEM4c0hqOWtyNEpTRnA5NjVzY2YzTDFj?=
 =?utf-8?B?bmJVS251em03a2E0RlhUZ2lrNUFpNzRwb0NGVWVsRmhtVHd6WFczMjc0bS9I?=
 =?utf-8?B?SkpXc2FzZkdXMlFiRUlBazhlaXZLQWNnVUdXd2ZOb1JobUoveUFoUFlwTHcw?=
 =?utf-8?B?TVlrUGMwV1liSENvNjJLRGpqQmdRQ2ViMTJlcDB4R2lRTTQzbDFuNUlkOUlQ?=
 =?utf-8?B?YVdiWW9vR2dEbDgrMDBqY0ZFb0U1M1NKcVVmcVcwaUlHZWpMYjJtcDlOWU5D?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1bdc55-a953-43a3-f829-08dc0b9f1184
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 14:28:20.3141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4X5c2cUcxFuw7TBy9ZPfJ7lDDaJk+Uy8/748x/5oJMcoI/ownKJv2sJMl4QV/r2Xls8oOPBtOn1mIKL8YcmxmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6601
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

Quoting Luca Coelho (2023-12-28 08:05:26-03:00)
>Some of the backported intel_uncore_read*() functions used the wrong
>types.  Change the function declarations accordingly.
>
>Signed-off-by: Luca Coelho <luciano.coelho@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drive=
rs/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>index cd26ddc0f69e..ef79793caa72 100644
>--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>@@ -25,15 +25,15 @@ static inline u32 intel_uncore_read(struct intel_uncor=
e *uncore,
>         return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
> }
>=20
>-static inline u32 intel_uncore_read8(struct intel_uncore *uncore,
>-                                     i915_reg_t i915_reg)
>+static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
>+                                    i915_reg_t i915_reg)
> {
>         struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
>=20
>         return xe_mmio_read8(__compat_uncore_to_gt(uncore), reg);
> }
>=20
>-static inline u32 intel_uncore_read16(struct intel_uncore *uncore,
>+static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
>                                       i915_reg_t i915_reg)
> {
>         struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
>--=20
>2.39.2
>
