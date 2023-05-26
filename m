Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138F3C7EE29
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 01:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD79B10E0DE;
	Fri, 26 May 2023 01:14:34 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93F910E0DE
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 01:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685063672; x=1716599672;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=k2hHdDKE1+14YQf1hR4vahwukVb1RcDzM5QjkER9Mqk=;
 b=nqDYOCNQvPtKL7Nrccyh37BSNbawRK8LpR5gi+4QNge9XUGy5pK0KP0F
 tjmwt0sQ+GIJqkHMoVTorwfeqNqgElOj1fmHtuvxQ45y4FMutesQeo5BV
 8LCMrxneEApwgQdNchSDVz7OYzoXvqJjRz7dYjR+PiohU91Jlg8Aud1rX
 aOQu0e7u3MRyzKED/dUiQ/jGK+2v2xdtjwuacqVKyxS4BuQiJJlHbvLtk
 oH2D7+akrhHhiXggUr3pkb84Ub+dmLQrQ+fa6578JN9rLmFNyWhLnA5gH
 qqAWKkqhl91aJgHPbYo/yIlHA2q5RPpEdBUXBbTektcPkVbKyIg63SqDY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334425337"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334425337"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 18:14:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="879349591"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="879349591"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 25 May 2023 18:14:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 18:14:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 18:14:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 18:14:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlSgCBwH44XQHFoDROUefzqXd04hvte4mKHhxfPOZSZIBfjt3VtBELZq63XWUyBLC8gh/CBvPPkR+b/hwQyU8rINFsPpTc52ahn5U9XNtYLRqZkhFFMvKR603b3H1iOXoZamosjO8kqXR80h3hayUuYQrLSxonwAn2qvKhoDK8UqB+fQW//VK73i9hwqEuVZt7urj2kOyKfcNN7R9hP5aayQNznu8lWerAUuGWX3tIjIF9hJL4BfT6szW+4kWR/XZzxIA7WHQenYz+zjiExR3x9KtkCmxBzvkCjGKt1/Rb6ULbrWZAVOvZsRPflACjcoPMlZ7swS2KaFemgviXeZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCiGK8Gwhitb5Ucyx9EiTP97BYnGwHxfO5aRB43rf2Y=;
 b=mcfi4dQcBhWXkZwghAQO2lCMQ/mkMcKrWLUIkZhzyx4Z/57fSd7Mdp6mAJP4WER5CENPu91ryPdusyfEHrhxXDei0nNcEvidLSRlIIWrVe0wj+MuJRKEjFdE1XF85xz70oHmSGe2PgdlwFfSbOBJwOvyTAJc9v8dtLMA4dflonEEwF6rwzMFILwzNf6YRXRqEL9+udmUiULdnADI1kv5eFUSFtxFqQBX2Y3qdA91nWHRVkLIi8kJoXLgNx7a4+FPXiwAMccVRoZQxCiSw3hNUEh0w8Ps04Cl203Sjc/KAMrcjGMLkGD0jNFOoWHVyp8aFMhQoEM4vPM/Xo4N/+7YEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SA1PR11MB8318.namprd11.prod.outlook.com (2603:10b6:806:373::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Fri, 26 May
 2023 01:14:29 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6433.015; Fri, 26 May 2023
 01:14:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230526001038.GJ10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525232406.688875-1-gustavo.sousa@intel.com>
 <20230526001038.GJ10045@mdroper-desk1.amr.corp.intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 25 May 2023 22:14:21 -0300
Message-ID: <168506366187.3319.4933213415417310598@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::16) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SA1PR11MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c0f77d9-fdca-4cfb-9984-08db5d868d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RTmrSG6aswiEIA+mkZed8lWvqzSNfC/xVQrGfaryaBFj5fvzg+V2/IO24WAOeLOmMy+6Q9MiCksmNRGcG6Vb9uvUAXyl0ImvIsrbArOHnp80tmJIxjHhvsuuJ/H/6Mheij7KY/tvMetrpcHerkAnTLFFvxhYRNnaGUUly+2sSDLmTYcu+j1jgEVe+Z4f5Q9ccecBiO7qk+cbQkiqFGr4UKFhHizJ+SzRjFfr/G83ZoYHHRweN8Vd+fLHsppxfAUOL2rA3bzuL5f+sGQNFoEdyPh7zGzewQnieBXF4xfAJqgnLF0FA/MK44nZUpGvLYp524b6M/Go3TzPFq4J3Y1m2RlsixTOsdf4ojJURugCi4nrZduYY3Za6g4WZDMOxQQw9Jbv471BiRXbkxfq6APn+QSUpnR5LS5FI16sM45OaPLz+VzFJ7OBRVfLPnm+zhbNBFfE5FgugBZDVuszXzxbmDPmzQU24MTeiGxFIlUELE+20NUY3xe1cuaJRUVU7PGgdCCE77YlD+nX+Sp5SHwtw/3OYZX37FbEE0Gw52hdN8u2UrC4MLuX0+Ny19wpKzz9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199021)(38100700002)(82960400001)(478600001)(66476007)(66556008)(66946007)(4326008)(6636002)(8936002)(6666004)(33716001)(6486002)(41300700001)(83380400001)(316002)(86362001)(8676002)(6862004)(44832011)(5660300002)(186003)(26005)(6512007)(6506007)(2906002)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blVGRUF6QnFhSmNlZVc4NXVoWXQ3VHFOVU9DQlBVcUI1QmhiSml3b004MnEv?=
 =?utf-8?B?bWN2K1ZRWTdneEJmSkhhL3hHQ0FwL1RNYzZDWTgzc0xQclBoZXRSak1JRzRN?=
 =?utf-8?B?T24yWDhGQkNTMWpjNTE4SDliOEQyQURmVktTZzFrRmJPa1k5aWxaMGRndHRR?=
 =?utf-8?B?dDYwNnBMUm5sUzE2aFZPbUZXVi8zUlNYOEQ1bHYrYW9UVEl3UDUyaU8zY3hi?=
 =?utf-8?B?bkY3dDA2TTNlTCtJekRDK2pvaFZkMlJHQmRwYnZUOHUrbUJldnlCL0tjcU1Z?=
 =?utf-8?B?UElBUjVOaXZPaktKOXkzM3ZmNXJTNlBUbkFKZ2VwRnpRVHhBWk8zamRFSHdW?=
 =?utf-8?B?OW1RajBkWmF0ejQvb0lEMk44VzVyalgyZkdZR2I4dEdka2h3QXJIZGRXMkVr?=
 =?utf-8?B?bzZUYnpVZUNBbmlBWHBkQ3B4SlZMYk5HZ29JOUFIVjk2WVdwc1NKM2VPZU96?=
 =?utf-8?B?dnVEUnN1SnJjZS84YmdMUGdSdVNMbmxKYkJLVWpGNlI3ZU9WaDdXQlJ2Ujl4?=
 =?utf-8?B?TUR6cU0xbVRwb3dpekF5QnVaTndjVCsxc01wRXk2bDc5b3U2NHpOaDFHY3V0?=
 =?utf-8?B?WkVaSU5yWEtzRXFxSC9MdkNNSXp0Vkd5cjZIQk54WnRCY2JmL0NaQjNWL0gy?=
 =?utf-8?B?UVFtanVuZGtZeHJ1a2JyUlpHbGorNERZRXJhTitiN1RXUzRUL1FLZDJsUkJN?=
 =?utf-8?B?VWNuc2Via0tmcUJCb0lKY1FPTUVITU1SYlhaTXM0NlpLOWREL2trTnIyRXU0?=
 =?utf-8?B?eC8xWkswZ0gra1d3Um1hQytkNFNzeGd6a3ppai94QW5nOEI0Ky9SUmNXRWdP?=
 =?utf-8?B?dk9xb2hNbnRCK2pic1cxcjNTWGt6RzAyTXlnUGkyeStEMnlEUTV0RVo5UXVk?=
 =?utf-8?B?emVLSTlHanVKMVp5RWxmMWZIbXAvbkxFOHFmYk1WeU1jQ3BHeEJhMkNNVTRz?=
 =?utf-8?B?SVBPbGtzaVdOaDJaQ3VGWnczcGgxMVR4R21GZVArSmY0SE9Fc3ZoUjRKUDF5?=
 =?utf-8?B?eEQwUkNUc2d4ZkdGeFdSOGRWSERvd3U0T3lFSnFTZUVESjUxN1oxbENEQmVR?=
 =?utf-8?B?VUduQlpFcnBKNHp1L3FTUHgxN2pxODBhd3c4K3FpbnNtQWt2Nzc0a0pzZ3RL?=
 =?utf-8?B?UGl2eENDNU5ybHVsOVhESm9GZ1JUektQODgxemVWMVpoZXRxbkp0YjNGRDJV?=
 =?utf-8?B?c01IaDl3Wnh1MVA5SUFtWW9Qek5mQ0hnbkJ2MDBmOE5FT1JnUXZKUktkYWx0?=
 =?utf-8?B?NVRCOHdmaktac25xNzZ4MlVRUi9XTGhIRC9GVmYzVFhDd01tdHJxd0RaRXlK?=
 =?utf-8?B?V1BOYTUxR0h5M0MvS2ltM0lDZmtnYnQrV2Y1Q2hVNERtVzB2cFBidWxBUVpC?=
 =?utf-8?B?ODA0VE9WWER4MFgxcjYvN09aOUNvUzNheU9QdjFPa1dZMmkwZXJDNGdVMHlw?=
 =?utf-8?B?NWQyWVZTcEhUSldJWWR0REgvb2dzdmo3ekpIMUgwdjFsMTI3TmxRQ21Nc05l?=
 =?utf-8?B?MWo1cHNmMjNlZ3VrV1dNZUhTMlFQa0FCQ3dRMFBORVg0NklCM0JuR1hyamhH?=
 =?utf-8?B?aDJ5Q21LRnlxekx5cmdUeEpZL1RDcnZkZnNqMVdWWnhTekU1cFpoRTJTelZW?=
 =?utf-8?B?Z2x4SkhjMVEzNm5idk1vSU5jK015RGVyNTNUem9ONjVJUk5lUWlBZDFFeTVV?=
 =?utf-8?B?WTBlU1ZNWE11SVhlUFpIQTlLWTY3d1I2eENlb0lsNGtTRWJHdzUzdHpYS2JM?=
 =?utf-8?B?MEkzYmVBWHZtOUxhR3k5b2IzK3ZUTVhxMXg2ZDA2eTMzUER5bEZPTnFGRkZp?=
 =?utf-8?B?VnJHN3c4OERDdDdZUzVFVGZ6M3hLSkxDTkxoUkZMUlcxZysxa0tzZEJNSWtq?=
 =?utf-8?B?SDZpZndpeWNMT0UzWnl1d24wK1hkS2IrcW5RLy9mcU9oTmEyckpVN3kvODFv?=
 =?utf-8?B?REU1K1J3TnNuUHFOTUxpYVBpUDVOaFRTdVRWdjZwSllCWVZZVUQ0L0pKYkJW?=
 =?utf-8?B?a0Rvczl3Z0xEVzZzY3VsaDlOcTJZcGRVTlRGZDcrbkFZY3YrNUVOb3Q1cUl5?=
 =?utf-8?B?eVM4UDhxWHA2a0d4NXphRUVUVm9OT2JpYVJxQkxaZWxTQXVteng2S2wxYktU?=
 =?utf-8?B?WHlyUUNCZXltTkt5SmhobWc0M0Y1eVNTMGc1YVQwK0ZtNnlaWjJ6ZjJJWVVl?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0f77d9-fdca-4cfb-9984-08db5d868d54
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 01:14:28.4152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y64Kw3otMU5nRCFAQBrkJvPBkJg7tqz/OOl1xYZSg5HylseKJZDcPpPdbxmEdXjp5acUSvjUx4FV7+3g41o4GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8318
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/reg_sr: Apply limit to register
 whitelisting
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

Quoting Matt Roper (2023-05-25 21:10:38-03:00)
>On Thu, May 25, 2023 at 08:24:06PM -0300, Gustavo Sousa wrote:
>> If RING_MAX_NONPRIV_SLOTS denotes the maximum number of whitelisting
>> slots, then it makes sense to refuse going above it.
>>=20
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_=
sr.c
>> index 0312823101ad..b82f704179a0 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -231,6 +231,13 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr=
, u32 mmio_base,
>> =20
>>          p =3D drm_debug_printer(KBUILD_MODNAME);
>>          xa_for_each(&sr->xa, reg, entry) {
>> +                if (slot =3D=3D RING_MAX_NONPRIV_SLOTS) {
>> +                        drm_err(&xe->drm,
>
>We probably want xe_gt_err() here so that we'll know which GT we hit
>this error on.  Also, it wouldn't hurt to pass hwe as a parameter to
>this function (instead of mmio_base) and include hwe->name in the error
>message here so that we also know which engine ran out of slots.

Yeah, makes sense. Arguably, we could simply pass hwe as a single
parameter and figure out the rest. Is there any reason not to do that?

If the above is something reasonable, I wonder if xe_reg_sr.c is really
the correct place to have this function. Maybe it should be something
like xe_hw_engine_apply_whilelist()?

--
Gustavo Sousa
