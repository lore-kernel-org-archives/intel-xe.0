Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AB7C04A6A
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 16:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F6C10E337;
	Mon, 24 Jul 2023 16:25:28 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744DB10E337;
 Mon, 24 Jul 2023 16:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690215927; x=1721751927;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mHjCduyKOx+jqh9KFDN8s3p879lQzYZQH7CuepIrHbo=;
 b=afJoW6QmeuARp6E6MaEZeVjLym60RtV5hLO6XZ35r4PEoTP2Og+ez+fK
 t3H4ppmw77N/rkVupHvTTQ5tE8VW7UzI540sAskCMjPSU//b6ta+H1NS5
 +szOwWeXl6hglwt6xshowSRdItH22gQK50H590FIIUN1tnWutYPw5zKHt
 wwDpihmLE/2bftNq4iL5vyI838vTS21P99DtF2JA5Z+BQ9HhGiCDi8uDE
 iLydeILDb1I16DHQ0hynWQ6bUACFpq74NSo7yL7dA/LDnwMDqe3EfyYKq
 O9x1Vvrf8M1aJ8KsAmSHRk1tl3vS6PpWtu57DQkX7dXmGtj+ZOdYH958+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347094460"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="347094460"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 09:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="755363209"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="755363209"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 24 Jul 2023 09:25:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 09:25:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 09:25:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 09:25:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XodMwWA8i2nrT9x8AJZ7fBgpacg0YJ+WTgfrOdtGjNNTLbj9N7/dhM/dHAvO/Ii/kB1Oq3huFAM/UOumNogwqSTfdN/11Lp2RXjROOJeZuv+aRWIoMtugJ8RivM94z5iWwfbDYBRfSdBEDc37OBna1xNq4mE01tZVnN6/nYshTvFOXS/8MFKaBw0a9Tgmy6OyUDQ2Qt71rD6+UiPKiypv3joeXFYzwpdljHJHRMbed9ZJMWUUEo4GmhP2IaaYi6bLeB98g1DGuSJUtMUVRT+DKP2TuJHYl4NzPA5huJ0rf2sW7HqMTNUzZRjOBiQgtw8Sv19MsKRbX/d8AF48BamaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQh/Hj8UE+mbyPAjS1WhqnvtIgTpbNDRLXwoP57KEnE=;
 b=M8KAnOIM5tpz7ErW7NMpiHQfxfKajp0f9VPkCKw09f0tjM1L16G5ih9Rb7KViWTA2rsOjZw5xoVNu0tq7kleFwbEXb4WZWFeukhn48rnX3Tg6/5YS9DxEmvHdiaPEDseBw0DoG0wCFu4cniMiZL6otZxO5R3nx8KiE4JkVpgd+Y9kSdm+qm12rp5fasS8ASGSk7v4esan0iFG2kSzeVYxEoZ41lSPLeC/EQcbUrrT87sBPOz2dh1kflvmv6yQ2yZAWaJrkZNf4Jd/e7H3AWNCZY3PyFG3GMz1oPcZLf6CW++XrEBbG2HwI82dPjgC/pTi3TiY7qUQOqzUiiYEMr0uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Mon, 24 Jul
 2023 16:25:23 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 16:25:23 +0000
Date: Mon, 24 Jul 2023 09:25:15 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZL6l63g2BhHwXaAO@nvishwa1-DESK>
References: <20230724155705.3700630-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230724155705.3700630-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::27) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DS0PR11MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c61f4b-092c-4b2a-1fef-08db8c62948b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0QiVV4cJsDbJNjd6Fbk7ZkIVkq0cDxblKNI4AJwyrHRaBVTZQRq6Bw67eY7CC3IxzmT6TidTwgwul9+2B3wdtO0+p/8gQ0mXEwyS0IwSyedCFaXeiTwJh5V1QGJAakU/grws87QzS3hnNsPLLGM9HMhxidh/+qavHbYBJUQGeoirPkwhq7ph74pVvuZtjutVdgCms/DbI2v1z6dq2E8yqw+gyQ36nJC6qVJ+cfyFkKgw1V+xarp4R19ypbajBZp7HBewgnoVkkRZN/UdrnIeG31ssGLLghR0QTQ+U7HQ4O/Df1IfZgdGOuCmScIV26rGbx6rlNLZGxjdSkNBAXmdp2PjR1g6gdOCaQfdci30+GQ2317hK4Ff+v66SjEZxOzasax2WNxVrI9Wd/gBJDBjeE2y/7PYCum7kD9heaBcRqqBZcsv2KOrFnpWWLJ63SN0l3+gT+bCMehLDadue4olvH+Zf5B/mBDlZ1rju0a6BxjW5OwQ2TzXlXYE1tc6qvbk6vYkuNXYNow27UppVqm67pyWINqJb3NOOtQhrr7+ENPm8h43Zw1QlX5eOzi4ujSY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199021)(6512007)(9686003)(6666004)(41300700001)(316002)(4326008)(26005)(6506007)(186003)(5660300002)(6486002)(66556008)(6862004)(8936002)(8676002)(66476007)(6636002)(66946007)(478600001)(44832011)(450100002)(83380400001)(2906002)(38100700002)(82960400001)(33716001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O6dRWVxeAtA2am2arphvOOUlJ6sd7oGt3ZXtR1latrQdUBJi6NnxW8m5gt9q?=
 =?us-ascii?Q?RrTmGc1hmBr6+iL1/us3bp3VhiDHxSLQNM6Bimovi9llApkTivcr9SGopGEl?=
 =?us-ascii?Q?ka4sr2aghpBNrH0Wf+NYgOk3IN7WeuDKsSq2dUxvEH4foivD9u7UUtxfrTJJ?=
 =?us-ascii?Q?+5z5J7Tr8XU/PFuLQcNjQqwBIgemNsntW2ZNBVP2FLTDaH1TsJEkfr7tEQI/?=
 =?us-ascii?Q?ihh1kB+e8O6CgVwmMf+mvwsbjrECnXUd63uoDrrjx+mOSv+CQX7kKxBej1xa?=
 =?us-ascii?Q?VkdmzwLSs2+OxeK7ZG3RcvjjrUD0KsL4MWPkZtRU4wTCGWkE5vlBV68/sTf/?=
 =?us-ascii?Q?tA7SbFl5uzn1BNkcJmcbZUcAAayUA5gtETwRBvsyRm56NPNHB1sWsBKwLBF6?=
 =?us-ascii?Q?A038Zbv9H7+rHbo3TVryxWeGWoimWnVxmRaHDY+3nAYF/768tajNBF9D3v6H?=
 =?us-ascii?Q?kvu8/XxIiuMiVfT0Q3FzdnC8wMgLu8/vXFVw5GbP5NrtSk6KWbuhdy6ypPPH?=
 =?us-ascii?Q?ghKn6N4lYq0ZhNa5oX5Pkm7+w2Xyecau+0aRpV2z26Pf52DhvcR6F1Fg/OBW?=
 =?us-ascii?Q?SvV51IOoCfiyZ+4O6Fw2gedJqSFyC1TC3KLVhYNgdznagPx0avKHxp3CFVh+?=
 =?us-ascii?Q?LawLMd5DsaP2KTP6Fr5l4d6On8yc5iqIFQbMCVpQ0X1wtUAeZkR4VPE3SClH?=
 =?us-ascii?Q?UZkq8OfWfmtY9mqI+nn/q09FQf0KuP6ukef+DABmsN5qk2I9cQ7qM/HVncVh?=
 =?us-ascii?Q?eV8hugMPzJBuS5nVA1PpwXdydDx4UMhpKMVvtTXq/s6WkWMo5MQRG2geLnd8?=
 =?us-ascii?Q?5//sGy8Sr2DkiDtLNjtebeyieyRImzxKU0usW2is6Qa0U3P77D7mDFFO9r+l?=
 =?us-ascii?Q?6JNLK6Vlb72Ojgi5kXvPQaTeS1XB4YwXcZydBzZqq06Nt6Sfnf21XtsvymhF?=
 =?us-ascii?Q?tq32Rxx2BoEQmxp8XZzn/l8s/j+JZL+lAcWyZqsCN6PSlyXzrYb9MAPmCMOH?=
 =?us-ascii?Q?j+7K2zVSE2NK/EYYX1LqZ8BjXZY7C+nLHrkJNTLxuHs+Al5gXCC0tE/Z7yco?=
 =?us-ascii?Q?NI6kVRp0ltrRWy26uZXqBL/gerBKN0esZPseBWS+obGIhTLxxrD7vFIO/WgM?=
 =?us-ascii?Q?tFZyRbnPrNnm4rJfAiQJb9p6zfy4F1xHWGKpxihencLfpGRWxUdGa6JeAfX6?=
 =?us-ascii?Q?dCLS2ZX6rqeqxZcW2qSHznq7bgOukW9b6qin8TSnv1t+L/a1yTFCbBgOgqmx?=
 =?us-ascii?Q?udLHk3LCuqnDECtGzAJt2/cqVHpLE7beni/wPDuUmlNB3MdgwGVCplUyThyw?=
 =?us-ascii?Q?XnQWVJ7QkXry7sAeQM6WdIiaS7pMObWlwN28xqEbehBgZHHeeyuYk5aWhVvO?=
 =?us-ascii?Q?zr/9KON15cRo5wmUldh648v1ZJNBUpe3A0A6iWM63q4QwD+GeFnsRvevfOXQ?=
 =?us-ascii?Q?Gi7JjelkhotKL1DC+upgKhdiABX9fpMXuXYw1IqQa1BiML+sy2Ke8mKt1sbb?=
 =?us-ascii?Q?qhW4LLt0Jk+N9KbCok6SLnzacgX3rXQwwoOpNqZpqm/vfeOd7aR1oOMQZtVc?=
 =?us-ascii?Q?b4HBVeOoF83ExgLoJCXnHy9JFASReMTw+3gIDAGh9jhqDnM6KN0/w5rWuqD3?=
 =?us-ascii?Q?EMirEE9jCufWnxrj3W21JM4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c61f4b-092c-4b2a-1fef-08db8c62948b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 16:25:23.2526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQgOPE94nnXgOteeWaokytigk5wi8PQ9LnE03EJgP/ahbZb93pa0defpXEftPnCo+yYPKETj+3G3szVYP6pEIGvJt/aBwlB+7PE9hx6mnWUvFO3D+bAR3P6NyAwZzyth
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH igt] tests/xe_create: Bump max time
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jul 24, 2023 at 08:57:05AM -0700, Lucas De Marchi wrote:
>For our kernel with debug and kasan enabled, 2 seconds is not enough to
>create 2048 engines. In CI we are seeing it failing sometimes for ADL-P:
>
>	CRITICAL: Creating 2048 engines tooks too long: 2 [limit: 2]
>
>And for ATS-M:
>
>	CRITICAL: Creating 2048 engines tooks too long: 3 [limit: 2]
>
>Let's bump it to 5 to cover all cases and give it some room for
>early-enabling platforms.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> tests/xe/xe_create.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
>index 2e29efc90..e39e89f7a 100644
>--- a/tests/xe/xe_create.c
>+++ b/tests/xe/xe_create.c
>@@ -120,7 +120,7 @@ static uint32_t __xe_engine_create(int fd, uint32_t vm,
> }
>
> #define MAXENGINES 2048
>-#define MAXTIME 2
>+#define MAXTIME 5
>

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

> /**
>  * SUBTEST: create-engines-%s
>-- 
>2.40.1
>
