Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D14EB64D0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 16:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F65110E0DF;
	Tue, 13 Jun 2023 16:36:22 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9189F10E0DF
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 16:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686674179; x=1718210179;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=IqwBQLDeLYUpBTX/hCXN4MhMIHMylgODY+PJqqyV0mc=;
 b=f/k2yAZhwnPYxyrgyx/0m/kHQc1GNf68p+kdkN9try3RUlA6rqeJuSwU
 Dc256ziAvy5rs0iQQLTm7RMDm16qgD7z2/hWgcsAiGq3/e29Wi3hVEWH6
 11EGQE911yqSB2Th6jWuduUxOjV2YonGYGKlnbjPPTCZ3vM51atJp6L1t
 c1EbaieW+EjLnvXTiKR/vAtk/fo6APTjsikRaDC9f8DhS6ruBUMGNmpPd
 KjSCNBNy43u+eUycyhzkBcDt5Hb5x+mrnys+d4uZsen6LlhYvtaZfxCRK
 3BR8IRN0WZLvIqgjf+gtVz412cOExr2LDf64OezAdw/c1aaa/GJ0LJO+u g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="343078376"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="343078376"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 09:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="885909581"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="885909581"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 13 Jun 2023 09:36:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 09:36:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 09:36:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 13 Jun 2023 09:36:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 13 Jun 2023 09:36:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQ0paoYQPf++onWdM5n3qntu0LA0QFayBE2zw4rYWvhNZzshx01pdeOFCJse60jTw1GoLR5j5+ET68dPPj+CI2M+oUiqsyLuabtW1Kd3rO/6rlAnQeyAq2uveC6DAKmSOWS5eSVr7eqZUuNj0w5JR6Zuka7bjtqzsjO+krOqpy/d5loQyKIO2EqBQIHkBQ6EGbxqc57a73wmK8fDUEq7Q+uHRzd5oVeY9VRgXt95CZqEdmutgkcBmE/Zor1a8eBXMtWzNTWurZQlO5KYpTy6adtfDDMcXU+QuuPTsjHElnbIHLVyLj746rdoz15RcTT9tjCsvMcq2nwHSu2E8JR36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nnkseL1sYzKTs9eZXH/hYz2KHm7AxgRUfZRW0Wsb98=;
 b=h7Gwag2CvOhWq+vGGbdvUT/VaUWa6uEA2s/CitH4DJmx3v8tOik3l+5eJxiFEo0RNkJnCYxbWamotzdGMUcxd9sbZaP6R/JtChZSUmLiXaWVUgCWgSruAi5Fw/WDxc+YHx6nRaOaLmOMLAO0IX+cRMlvlHsNNCRzcYa5BYl7MaqdCCFL9hwMeyRhhhbOPVzWCaTN2omLq9+orjCLgjGJoLCoGuREo2xuCACQiXJAyq4oiUE/9FGoEwfZOuAkbfCmLXU1O5fSN3eRrJXwY6gwPlXq38Bmi1qdANgbCu9+XmtYpUWucyb2ys+DbOwOIMR+yyfYcdE3so+vi6ZNJpoLMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4727.namprd11.prod.outlook.com (2603:10b6:208:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 16:36:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%6]) with mapi id 15.20.6455.037; Tue, 13 Jun 2023
 16:36:13 +0000
Date: Tue, 13 Jun 2023 09:36:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <va5lp2jvttr4idpk4o272akut7fgjndnnkj4qssfziwriho6dm@lzigm2qjovqt>
X-Patchwork-Hint: comment
References: <20230611222447.2837573-1-lucas.demarchi@intel.com>
 <168652494066.6759.14664729823149663000@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <168652494066.6759.14664729823149663000@emeril.freedesktop.org>
X-ClientProxiedBy: BY3PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:a03:255::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4727:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e843f5-751f-42f7-059c-08db6c2c4d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rmpFV2hzAa2a9tEbJ44ndO3CLZvmKvL9cCIGMMQ9RUpeRadCGnyzaoogbDa1fJxRVXPRH/V7pDhYwms0ltqkqrO8mUzCKGqS4zOxBt6BhdptQHoeVhkEPxqD+CEc9dXByGEZk/14euMWRHRvdTzc3AkigHlMmduHvBSP/94UhjCey5qHkh5wattJRjbpfZerZoqjRv42il2Oto7RZgISocmwTsnSa/A5UACOhYxBkIOW09GLl+ldS9475jnNPiGVdVJOefT6mg++E0gVFx0pOQMxxgCG/35uNGRd1tO/dnKeRPoqRKUBzg4JOxop6chaP7+fby26vNWfBh81VfOzQPR+5kpNqQ0i2OwFP/eSsNRj5sxX/ZvpJW2W8eg9ZtWGlxErUHjHYZ/l330c+yolcKmtOj4CHHETPAB0eUlmQLkfbBtGeNjHo3A17cltFDll+tZb7kE0CNoNQg4CIs+V9zwPssX+RWD2aOePJkTHRMdfAu0JygPw3QFC6JgxqcLsjwBzu6DND9sgRiRUgqvqXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199021)(6486002)(966005)(9686003)(38100700002)(82960400001)(86362001)(33716001)(6506007)(6512007)(26005)(186003)(4744005)(2906002)(5660300002)(316002)(8936002)(41300700001)(66946007)(6916009)(66556008)(66476007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cTIQh2gZiARIJiAYgQmYITPDpTPGu2qJIZh1BahxYZbD0UWmGfgV1ZNg870R?=
 =?us-ascii?Q?je9XkoRaOL8OlAUW1PsqrMiXrV5Qheh3Nslh+/qrfQfLScr89IjLgbBwhy5R?=
 =?us-ascii?Q?SZc9LNqAXebyB9sKgLbCKPTYznUJWKp4SR4kbo8xAkouhpXFQHMJ28NAG7rX?=
 =?us-ascii?Q?MwB4DiYGk/Kl7zRoueBwiLz+JWu5Q6czoJvuP1O0S7/xA/J9NUHPJalwPwLV?=
 =?us-ascii?Q?hJmzcTaCXNxXoRMZ8IRs8ojPXfBPrp05brx9iahI/MlxavtSXWZOXMMhq3DP?=
 =?us-ascii?Q?i0GMf842LwMTZuWJDA5N6PG9Z3/8CQMlgHjFGZX8qsAjOWPLn/27DJ9CG9om?=
 =?us-ascii?Q?B0ElyKkwRfQd4MgqbEqEV9L6AAV9AQc+kcS5wM1hmqN5Q5G2kRjbFVL4flCN?=
 =?us-ascii?Q?a/qg1kalCPqf9iChN7ksW8dkNONJCw/kBRbOz0pswnBPuqll5Dh9f6Czamhg?=
 =?us-ascii?Q?wb9yyXFrvNdW5p8toY/wAxqeE8dJdZmG1RvZ35YFFzkwbD8S31dNoeZyvGPD?=
 =?us-ascii?Q?7L+SuxpqhyWJbm8Ar5V9w61M4Wbok3/+ddsxe9W6d3KAasDyK98VYQz0VqKV?=
 =?us-ascii?Q?D9zryHwFbIqdSp2Xgjpf3P9q+SOSHuUSiwF8mqSyhnz2RWP5s+VPFVCzbzJQ?=
 =?us-ascii?Q?2jsA6gHHllFXaVsWZAsJ6nAbPTOfBUxfLzbf2mFL26Aye5S76VydNNY49t0e?=
 =?us-ascii?Q?5zC+ZNfEcdHaRLr9jh2L18c5XgVlBFwLORgITzJ/i9WEdmtxPYULQeTQie0b?=
 =?us-ascii?Q?N15N0zEHa8lj1KulGAgwbnBCB7NdzQDJbM1tI4RInmHayR+xhfBjjqGYB14Z?=
 =?us-ascii?Q?p2LNXlvpfHb4XU9HLFPgLi0jEVSeqxdPxC9yaC72OLu1YlLCl5ISP8pW34u2?=
 =?us-ascii?Q?U56eO69e6ikaArqA69FwlKSFbrlGxkV+7OBr9axvh9HNHgDjjBTLQdaz+IXp?=
 =?us-ascii?Q?cWJ7zNtm7kcaibuW97b6ApnD3vGYqdyrQSPoclSy9zpE+HxQbx3rGWYQ32vJ?=
 =?us-ascii?Q?tXYqWmv3NkS76LU4YOHT5NgGDZk+29/q9qRoV/oOQtJqDjbVgP9uswwM30XI?=
 =?us-ascii?Q?6kJri/+uuDbBCuh/2uMv1T4vOUGpkBE+T385/z1kJRh1LQHYeYl5YfT63tCb?=
 =?us-ascii?Q?WhcXQw0DT6xYRWsRFu0XpX95FNtj7sGO83DYP1wFtmCpm4n7ech9gdaacRE3?=
 =?us-ascii?Q?Q3qc/aFHn4qd/ykQ8XkIHcHa0ARVvnVWRiGsAZMBuIqlrzzlmYAILhAoZ5d7?=
 =?us-ascii?Q?6dFTVzD2gwsRRvp419H7qQuk3ipT2eZzyhYSaOF1xUCU5+ZmB9quXmETAEfP?=
 =?us-ascii?Q?b5occ0GwdkK5PNfTKYkkgj1tdA05ODC3p9ppirj1V78frWm5RyTnhmu8Xk23?=
 =?us-ascii?Q?UxmiBksiGo/H+Wg4ccLRMZNneI7CeAD37MEIErB211RQzPg3GyqM5vp6x65m?=
 =?us-ascii?Q?A96CMxAcfV1CrK9Bp7iJ2Vnth0jt6KKtiQHvftmV2RvisVTQQCgQ1unhgkMC?=
 =?us-ascii?Q?CcRs5QRYGzLK6+7eZdMbBe0OtLz/1zQnX5ZR5AkgEyk8FE47ImTf4kSP5bGr?=
 =?us-ascii?Q?TLfuTzYNFUATj6+cGrsI1TpbIp/6f0PaSim1U5iTH1otqe9muZZoc6YcgyKU?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e843f5-751f-42f7-059c-08db6c2c4d1a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 16:36:13.3722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNbWWFBZ6rVyTwDJ732r2fYzHnI/ei6tRys0IzIwBZFyEN28lSTtFrrCLKLjPUJeGoetNmDulth4z0cE8vZ4TjSk4aFZmwtk3267XbE9Rc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4727
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=97=8B_CI=2EBAT=3A_info_for_series_start?=
 =?utf-8?q?ing_with_=5B1/5=5D_drm/xe=3A_Rename_pte/pde_encoding_functions?=
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

On Sun, Jun 11, 2023 at 11:09:00PM -0000, Patchwork wrote:
>== Series Details ==
>
>Series: series starting with [1/5] drm/xe: Rename pte/pde encoding functions
>URL   : https://patchwork.freedesktop.org/series/119174/
>State : info
>
>== Summary ==
>
>Participating hosts:
>bat-atsm-2
>bat-dg2-oem2
>bat-adlp-7
>Missing hosts results[0]:
>Results: [xe-pw-119174v1](https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119174v1/index.html)

also crashing here:
https://intel-gfx-ci.01.org/tree/intel-xe/xe-212-c075cadc4c6d0238556545baab98a63368908404/bat-dg2-oem2/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
which is the commit before the baseline used for this series. Doesn't
seem related.

Lucas De Marchi
