Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DFAC77B78
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 17:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BE310E1C2;
	Wed, 19 Apr 2023 17:07:45 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9BC10E1C2
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 17:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681924063; x=1713460063;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bjQag+VrQDEyXc8TdNvqbup02iLAo/z24DbFOPYj3Y4=;
 b=A5l6ma5nvtXRH9M9AOiB71dK+xOipYYz1c9XyOpw9ZPyoevjOJqKl/AS
 lRUoHq0KAd3FpLQv1iVqVm38uC7je+IntUv6OyzSO6zRRgbfeqKILq3Ra
 pO6Q4YGBAkXiM1ND12EEsKSRzkFD3Eir72Y70oJNskExDSM7WavdkOITg
 vWiX3zNijnynKtszgxCGw3zIshKJjqEbjh7xiSz3axhDx6F0cWACIk/Zs
 e8NjbJxa+ohB66y5+u71ta3xP6JwwJYXXJ2VgjHvC3QGlI3pvc7N1rhXq
 3/bxZJeDS3nXGNlZHPeA7rB4G1rKOc0/8kh3KdtGzR05lVa56NBWI9f2V w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="344257701"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="344257701"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 10:07:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="724126697"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="724126697"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 19 Apr 2023 10:07:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:07:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 10:07:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 10:07:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4l7udz8Me2uc8gc9sogu+5xIQo9ExyTgczjkyODlZWQ56HjuuqmpFf1vSTezBwC30/OKGl7YoqDlsSxN5Yr1U4gWvMtS1f009SLEi4cBoFss6gN4dg90OKU4Ige+hncuFVCYUeyea0+7dnKwI6z3jPHXLiJYhPQb0i9RQdjdJJY4Y4DrBRz+vrlRrWz2xhW9O8K4KTzHclE23uknMMDjawKuaIYYHDI3Q9WBjkudirds06b8ekpaO2efLEvwlmSDr5SQ8gPZGbmS8RqjOyASu+YjiDEU2oaP68ygX6FgNOWZbIO5w0zmSAi0TvFPlkULvhpKiwG/ZZE3sdJDYpVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrHwD8bcQPdXBcChUGxLteCRHVXYar3kPQctXtMDfvU=;
 b=UGG4xh7hnyfeUzkuxUbA+V2FUJ1CUnX62OxzjQKrxGJs3k8SDJbK5y/HZKp5yRfNXt5WyrvQRIePAGfxDX+V324j2vnBvg+5eskWVAXTew5a3V/aesTzZVPyvPA/QvvFwukTzMry1uILfu7X9ZIQ5lOW2sTqkmusB8ugtwb6OP//N7vR5VWOp1Y9ckYvaylkKRTyWt3yUv7mbVyJWQ3P7kRf4etTfWbzJCIrmMPsRR4eFl50YX0dasQWIwXhEg6JlhubD+QTvxVizlzQjuFH9bi36DfxdPQD0YfOx6YCT37sF33ByhuueL571+gKgEQQ7dcnk4G3w1HaR+qbG1fSWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Wed, 19 Apr
 2023 17:07:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 17:07:02 +0000
Date: Wed, 19 Apr 2023 10:06:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <jok6b6khsik2kelbf3hj2rld4gsa422pzhu2yc2wdeivsbt6qs@fa2f5v74ur35>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-18-lucas.demarchi@intel.com>
 <875y9ryhh1.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <875y9ryhh1.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d0d6f0b-dba8-4f39-d39c-08db40f87e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IwA2XoK0Q6RkLnFS8UA0UeAK5Li4JIEjoeu00kAbLVLNgbMqhTGodLu+j38L/G29RWx4Astdahq2Tbqz6bnsG59QnGAe1w3aNvoDeoouzn2QUp2u0GPUvyOyaPT480Xqt92DI/NPLecL3LheTw/iO1D94lscN3FOFJsdNO6zvO31h0706AQizFZiI+aLZ3WGOfwwGwJN6869AEuYi8Id8zwCzEzBaBiKarGEYUjTErZ+wUF/l6PloNQ3jIxgj0pBdK2U7BUsdBo4Sis2JSRxP9MT0OnCvr7NHhc0T6fW1gJ3v0hcEOnkeS2uxKTVgx39v1cxXy/xniPH4E8OgqceIL5mVubyU6ZK/m22VhJWhMdQ3fnrcUhtDomaJTj2PHUHANIAlvXOlCnQtsj4NooyFQi3kLfFQRRzOk7cf+DQhzRN9BqTn97j0Wmw2HNHG3wxEagq7owD5XqJaFJbe9fk3n4MLcZjbDNBL6xx45NP6/6lxe1bElo1HY09DIC4MlYEvhZF2FpmI9pOCJiTKhjkysSTJeuYNHDBccmuV3aenO0yKIvkY+x3ZNwu4H/awkns
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(2906002)(6486002)(6666004)(478600001)(54906003)(8936002)(8676002)(5660300002)(38100700002)(186003)(66946007)(66556008)(66476007)(4326008)(6506007)(6512007)(6916009)(26005)(316002)(41300700001)(82960400001)(9686003)(86362001)(33716001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DcjrKzg8QxgEXgXucoXTYXK9mzm+iTIBoCrzT4GFHmKDczMaAMChg8fFJxsl?=
 =?us-ascii?Q?GCb8Gu5NlhWxe2g6xhGq3uf/SoGujRGeoLLAN74ckNGhw2CA1x3GusRQTEIy?=
 =?us-ascii?Q?B3oK7RXruhXLyYGPH4UGUsyS2zK6Iqil1XXgULUXuRGUhJyBdd9oxhZpP8o5?=
 =?us-ascii?Q?t5xqAi7S71Sz0li2fxbLKGvLRv9d34Zw7TiygpQSsfyEswVRWfafLIdaiYZd?=
 =?us-ascii?Q?uaTL9FgyjZ3qESGw9hR9m1IwS2WBCikQgANrdo86hfhx4AhLmgAST4q3doO/?=
 =?us-ascii?Q?E5rvHCXnJAD6br6MQgBrzReu8CjbW3y8GFnWnZFtqIXz5fQreMicBquK8Kuq?=
 =?us-ascii?Q?nepVWv/B0Zdth0WsIr3imukzPSVwQfdMu7n/OsCvJ0jxk/NMqHcDR1ZZ9j+c?=
 =?us-ascii?Q?UcaspwpGuSBpdQ4pHSNuRfP7J/Twp4eiNf/9Xxbib3DqcNj/B6uY9jeuIV8L?=
 =?us-ascii?Q?YHXGyu2gWZiFyhnv/KNejhxxqy1RUIoz94ASoHRvzxm6k4s442NjS25t6Bwg?=
 =?us-ascii?Q?xC1cMm8+k/0zbQgvD8v1BX2PqRW2OGsGyQTzlgnSHHycMEFncOfWxvgGP+GA?=
 =?us-ascii?Q?1exURtx3/c+IwNOg2e3k9wyLnCcfYkUsUnfvR62lGoCOwILN24EADAO33Fs3?=
 =?us-ascii?Q?pe5V9uJ+IblWsehXx6kr+1lvWmIHfKTSZXukD3vZXSHypDy6oghGTHXf6wOB?=
 =?us-ascii?Q?niLPZRbpHiVpCrTsbRC0Uu5T3mNJByT84KBIjhxfFyVGHLT8XR28WxGC7JxH?=
 =?us-ascii?Q?TBbVaAwUtpd6YA4NEFbjNskcpRvkxWXhbseRWnCTQ0m2aYnPaXuzyOoYXJu2?=
 =?us-ascii?Q?YupZ4tek1WrI8UkL82GVX+YjDJWYHruk6HCXXJEgnR5Rok5s9Xt9rmQOxmQj?=
 =?us-ascii?Q?6D1RdwY3s/+1X4vyFhXc+sPu6CutMU5y/jHhk7DUpNf44g9EDK0PBr8nmfQP?=
 =?us-ascii?Q?VosoeVSbb//PnxkbrgEQRCIOm+u8ztpXf0sMbnJUCpqQVm+/agTet/oLO7W5?=
 =?us-ascii?Q?VWRUf3tfpgP4jg8U6375HmbxUcq4L486GiA1WO5H+mGRfROC3aNo404j3qII?=
 =?us-ascii?Q?ENScm22AzdHoE1CW9/9Rtg6r9OITu3JnizbONkg0eFp0A4ANrCc3lp49gg5y?=
 =?us-ascii?Q?osLQMV9xuWuGdrG/oNYQs3wJ6ntsdMIsVGsFf8ZZ6e22+mgctaiDz/CyrNtN?=
 =?us-ascii?Q?G4mcB1Pz9JfosqeW/yXJkpfRXjqQ/6EH6pKDnRyITVY5TsJPvbxr7xWOyfh3?=
 =?us-ascii?Q?/wJrjAdHdoHN4QZDbRWKGY2ZbZETYVYPSyaYtkJArxRnDeNoRgC4piUHtACx?=
 =?us-ascii?Q?qo82srYKsdlAu1BoQJQOmfzQdSr4hmSY3JjuEl/QS5H/DrTgBUvcna0tlxcX?=
 =?us-ascii?Q?33HENo0Mziq0urf9/VjrusWifqWWHWvJM5PQl5FvQ3uS40vygKs+sZblHz5z?=
 =?us-ascii?Q?7A0/rKxQteYocB9fof2hkI2x05o1j6cjkRSFoKMiQbEbiFgAeD7H3YrFgsW9?=
 =?us-ascii?Q?QbY9dFdOGe8onMXHRZEO+qZSP4QT1Y4Mo+xtn7xQZmtpBXmBJ0NPsIbgmCQD?=
 =?us-ascii?Q?uRM6TcLw2elM9eUZhJkODfIQ0U+2IX2hbnWOw6oB/UEzLe8d/SkUrpjT/ajz?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0d6f0b-dba8-4f39-d39c-08db40f87e6e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 17:07:02.2612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTX1lfk6l+mI5Xpyo8PXdxjVmwjyeeXZ4VAqELboSXEt+zIxPvvgtPkfLgXHgWPRbcuNaDUSskuP0ETZh0EzWPrU1PAdRFwH5xBjwcZ8bjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7997
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 17/17] drm/xe: Move helper macros to separate
 header
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 07:17:14PM +0300, Jani Nikula wrote:
>On Wed, 19 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> The macros to handle the RTP tables are very scary, but shouldn't be
>> used outside of the header adding the infra. Move it to a separate
>> header and make sure it's only included when it can be.
>
>I've wondered if the macros are more trouble than they're worth...


The problem is that writting the tables would become very very verbose,
to the point of not being feasible (and error-prone). I think the
alternative would be to eventually move out of .c and just write it in a
format that generates the .c. It comes with its own downsides though.


>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile            |  2 +-
>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  2 +-
>>  drivers/gpu/drm/xe/xe_rtp.h            | 40 +++------------------
>>  drivers/gpu/drm/xe/xe_rtp_helpers.h    | 48 ++++++++++++++++++++++++++
>>  4 files changed, 55 insertions(+), 37 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_rtp_helpers.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index aceca651de57..f3c38815011e 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -225,7 +225,7 @@ endif
>>
>>  # header test
>>  always-$(CONFIG_DRM_XE_WERROR) += \
>> -	$(patsubst %.h,%.hdrtest, $(shell cd $(srctree)/$(src) && find * -name '*.h' $(skipdisplay)))
>> +	$(patsubst %.h,%.hdrtest, $(shell cd $(srctree)/$(src) && find * -name '*.h' -not -path xe_rtp_helpers.h $(skipdisplay)))
>>
>>  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>>        cmd_hdrtest = $(CC) -DHDRTEST $(filter-out $(CFLAGS_GCOV), $(c_flags)) $(cflags-display) -S -o /dev/null -x c /dev/null -include $<; touch $@
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> index ad917638d088..a5ec9ae22156 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> @@ -57,7 +57,7 @@ static const struct rtp_test_case cases[] = {
>>  		.entries = (const struct xe_rtp_entry[]) {
>>  			{ XE_RTP_NAME("basic-1"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>> -			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
>> +			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>
>Ah, this was changed earlier in the series.

yeah... I noticed the kunit regression just before submitting and ended up
squashing the fix in the wrong place.

thanks
Lucas De Marchi
