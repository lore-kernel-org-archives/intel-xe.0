Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CCEC77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 23:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FA510E787;
	Thu, 25 May 2023 23:13:36 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AD410E787
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 23:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685056415; x=1716592415;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ExcGyJUXWOpXEQve8obtcCf6y+SuHXMBha/Nr7/8fOU=;
 b=Xmib4gxZLp8cS0WPDNfbY34U3hqQwgLWAn8IdjGrzJmnyA7Aa5DV8JoU
 Vjb2bGqPrIIfvs11eXc6cIdRCzarICHPv8x6bc8ftW6JDlJ9x8xnCD5JK
 UU+j82M/o5BBOIgSDK03XKbHPekazXnWE+ZXOHbOW4RPkQdZoVhle5TsV
 h6k/L5dxVeO4daBkq0Fnz1H0oSShQKTeY8h8UGqdj2DgA3bul+prm5Fi+
 2xZ941+2BtAENRJ6Im132GpwzkM0tMDWWMpRoK4P3eSLSJ8bbvRBkcT2V
 LkskA+fUhlr2d+2/YziDaVPyC7xb4i1QsCsGeunVxHLrwmWW+zYMEAIsR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="354072547"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="354072547"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="770127677"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="770127677"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 25 May 2023 16:13:33 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:13:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 16:13:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 16:13:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJAU6ESPyMbfZtegTyQiH/0k9vnhvam/Fd0rX1WseyY6e+YJ9kDX/+LtxGhKdw/TzbFgCNP3bALC+WRwevTXQB7Q4sOKtk5l+Th07SUSff9NfRv69KgB5glu5VDTtbGXYvkWFHK9CTCimrIc4891OiEzAWUyOfVoNHcMQCfawUy4LqgSjvnpaFvOY7KdHNn1kzCjhw2cdeV0ftuVDFXtDjhouPsM5Q4JRQ3hy/UkDimeHEiq1d3Dot8jmNOdAu4GlALBj97Pe/Z6I/JSaPZibMQd0r/he/sDSrvHk2Osdskdd+5kB/c6XGZNcVqJk9HvmAPrihVBg7rmHhhuhUnVwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upewK6Z0gNo4uRJ/i8Uv6gODrjC1rDUl58nLwR/uDTw=;
 b=bfso+Qzt3gqGol3ia6JXRwZdcSgEH6+C7A/SrtZOcCaFDswHpf+WaVzIDTCtdgKELOE+AxVhYZUIOKYequPEaIW+2DEaj8OVX/MBfKUS8gnRaCK/IKhvId8LNW22VnlQh4Bv4oWK6Rq3Ztzq1rtIKK2wpStM6X28WvTrq8R/q2zJ2ii0uOGAXS21VT3U5bDkrjZLUASgcecGqQNgmQ+DKMIXXUNS4AYvuEz5pI3SwKe2JFAQfBIRPEgC+dRk/Pvh/fSogyFwwIM4h5PY5JIClwZYRMyMy7HAckWbqw0YTUw58Hm0VUCLLpbjWnhwAOCTIURSubgTZaBBVuBb1LGpXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16; Thu, 25 May 2023 23:13:31 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 23:13:31 +0000
Date: Thu, 25 May 2023 16:13:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525231327.GZ10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-13-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230525213407.3907094-13-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::22) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA0PR11MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d734c7-c98b-40c9-e984-08db5d75a751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qboO6zy4J3XJq4NIiaEteOb31JApkwI0n+M0mUj6dO1UnrG/Vib+Kv6Cq6jgVmAuByh+eDfRyltCqgAvTnaMU2MNtqdPgHFUuJ8FDGqLxlWm8qic0cnL32Wbx8jBtXcUytbvfYGHbuYTkXDMi69azYSkluTGbyp24WtvMadjG3JLzGLDLhNweOQXhkqlqQSpv8FptjTLhN1G+FbAWzLW7wUv4MDm04VLLOnU5qXiaBwiNDdW+Q4Zwu+mvFuWHTrbR1Qw3IVEHHzjPE95Sgpri4PCsLvTWGdg7VpHFbV1CXs3uU/ZH/P/1UgWdNPT3zgn+3wz+W+CEBRMV1aXSHoyzKBcsq1RTv9kDGvcR0A7r7XUuAJl1lWNAhM89P3PM6/QLcIC1PJnIpd33NWa7ZjbQbz/CZkQvQg23RL4lHxwQetxxpXHh8Lr5yqPllSb84dESBiZdJLUTykGQyHAwl2/8AS+TEhUgkkHElZbXSMFJgwcYekU8g62SlSWdMn20Y7kQtdxwMNxvWFYc3XdmAFLO7p0PnCcKCkOuxFbesGE2EKdYNLPuDZ8BSr4xBPfdMLD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(6666004)(6486002)(41300700001)(26005)(6506007)(6512007)(38100700002)(8676002)(6862004)(8936002)(83380400001)(1076003)(30864003)(2906002)(5660300002)(33656002)(86362001)(186003)(82960400001)(6636002)(66476007)(4326008)(66556008)(66946007)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PpuxxO/XX425iwfVOeBn0/XkfhutN7MU6cqKeXCABQzVm+4HZ7o1PMLKlJ?=
 =?iso-8859-1?Q?uzpBS2K3wRms+E1TAY4fECMttmGc79m6svra7uWG2d9xRY7D60+OsXUF+S?=
 =?iso-8859-1?Q?4KaJLncSP3yd9uvHemCYzuQYFbFDzGyJzEfZr3HBZ6a3dJF5XmiYDfb+MC?=
 =?iso-8859-1?Q?hlrIhc4ArVCGgyA5TJSswxpdFKLvGQY88rn9AsEFCOJKoEi/P03EkN4Uyn?=
 =?iso-8859-1?Q?pHn8f4EGhX1JKzJTqtE7a39ngTodFtAdDKQGf1TqqsAZVbDEeNslx9YZ9+?=
 =?iso-8859-1?Q?pSi2UaPM2g1SbrFcpKS8Ea5CHmNu4DQfqTIu6I77aFUvG7Yc5NUY+wvNEA?=
 =?iso-8859-1?Q?44QT+qVG7jpEV9u2jPw5IBc+PnQMsYNJHbdCkNKmgVQXdTyL6cGJWGPCBL?=
 =?iso-8859-1?Q?IhdfCH28cTobpE1WPzjLm2gdWVe7uD22ASmeR/tglvwhN4PuhOAffgMyUD?=
 =?iso-8859-1?Q?M+5XwVlV6yMphaAElkokG5/mNwrWhpqngO+HZ/2R7/gvfonVBJUhQIHRlv?=
 =?iso-8859-1?Q?CM0T9v9DQ9juM+wIH4RUCT0iHdrmpx6cUJ6d1GuyFePCa2dqIyuXZfH05r?=
 =?iso-8859-1?Q?RZ7qwRtNflBQen9u5jbBxNhBlpvuR13JfelHnsGpHwPfmGL7E+TsaYg1rU?=
 =?iso-8859-1?Q?QEw7DSYgViltqw9cgywxnRrAdrCYQmUa1imgiON/plvr7TLYqdekk6kiIp?=
 =?iso-8859-1?Q?RlvXyPP+LUuxlm1viFc18zS9mAeWce8UmamPy8m44zvzr7mQyKifAmOXEj?=
 =?iso-8859-1?Q?l0XQTFCDjOEoJukUuu6b+Dz5JcV9+AOg8nBA6fRkxpt6KQmPcl6VomHtqQ?=
 =?iso-8859-1?Q?iUPylCcuq6PItj/CUz7Jn88imIx7HJwdM6JZL/xlqWxduUwm40rM/J+l/b?=
 =?iso-8859-1?Q?0dQ1tyB3RYLkyKaUBDxr/7gPsuIeQyGuQvgvWtDfQ9VVV6HbofLyCinIoD?=
 =?iso-8859-1?Q?aEILP4KQDRlD2F/oja3Kv1miuMjbl0tes4wHXPD43WCO1ZFncCH14aACaa?=
 =?iso-8859-1?Q?LQbuoCx0eHoNIg5tnsLRRM4rTcgmWIfE7rQX7I7Q0ihg8de26QSt7xqjKJ?=
 =?iso-8859-1?Q?D0nhzTOJl2+jeRN880Zj0q3JwJtkBq5P9oIb4pGGI+AYNNGqkqHchkZ/VD?=
 =?iso-8859-1?Q?Gou9OOcHrbn+PNDWNPQBbJkmZHqV/7xmEginUKmW/xsA36wdqdZ7kbKgv6?=
 =?iso-8859-1?Q?Nf4to0KO7XiLLT15u7jmRupQKVI2xAWcZFmDesi2XpR7S9jtUnuqpoVbkh?=
 =?iso-8859-1?Q?8pn93m6n61CbXY5Yy5Li+XICxLOeJXqnHxGEBLt2+hhIp+o6h1H+ssARWo?=
 =?iso-8859-1?Q?AfZ2iLkCx9FwcMnp+hpXvk3tCl1VTn1ze6Hzp/ieihbTgjoqaITTc/jnFJ?=
 =?iso-8859-1?Q?dYsu4nDUXHanXExz5OU3eSNT4DL0afF24GTw/9hT3GH6INrBVNcWKPkpHr?=
 =?iso-8859-1?Q?eqEY9NehRkZC2uwXWnEZQXyJ0R83NPmCWXavMcyLHoaMabMLSBOE8y6bXR?=
 =?iso-8859-1?Q?y9ke1GrZGzA+K1gV1C69wKk3swpQulQCUXLr958sCsfcvPCx3xVPfjhniO?=
 =?iso-8859-1?Q?jaYl66wSIkElcZ0n4dO2+TqmHwbi/n0PMSIeZUpJebbWq0l0syQ+FcMG/P?=
 =?iso-8859-1?Q?xpwevJQczHfX8r+BFEuJn0m2rrSmdkcCKX1y16wBGqCv7LoRCY7i8k6w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d734c7-c98b-40c9-e984-08db5d75a751
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 23:13:30.6560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmA97TR515x0o6pUhtAkCWcceKIOyy+6PFNvbUKwoudEBQO+fvdDC09wte2lbEUlE2KCNxjSrQWhPMe/gGMyz+X/oX7C9NsaTKnEzNFXqUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 12/21] drm/xe: Add support for OOB
 workarounds
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

On Thu, May 25, 2023 at 02:33:58PM -0700, Lucas De Marchi wrote:
> There are WAs that, due to their nature, cannot be applied from a
> central place like xe_wa.c. Those are peppered around the rest of the
> code, as needed. Now they have a new name:  "out-of-band workarounds".
> 
> These workarounds have their names and rules still grouped in xe_wa.c,
> inside the xe_wa_oob array, which is generated at compile time by
> xe_wa_oob.rules and the hostprog xe_gen_wa_oob. The code generation
> guarantees that the header xe_wa_oob.h contains the IDs for the
> workarounds that match the index in the table. This way the runtime
> checks that are spread throughout the code are simple tests against the
> bitmap saved during initialization.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile        |  14 +++
>  drivers/gpu/drm/xe/xe_gen_wa_oob.c | 164 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.c         |   1 +
>  drivers/gpu/drm/xe/xe_gt_types.h   |   2 +
>  drivers/gpu/drm/xe/xe_wa.c         |  40 ++++++-
>  drivers/gpu/drm/xe/xe_wa.h         |   9 ++
>  drivers/gpu/drm/xe/xe_wa_oob.rules |   0
>  7 files changed, 226 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gen_wa_oob.c
>  create mode 100644 drivers/gpu/drm/xe/xe_wa_oob.rules
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e058b1dda6e6..738975faaa05 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -26,6 +26,20 @@ subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
>  
>  subdir-ccflags-y += -I$(obj) -I$(srctree)/$(src)
>  
> +# generated sources
> +hostprogs := xe_gen_wa_oob
> +
> +XE_WA_OOB := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
> +
> +quiet_cmd_wa_oob = GEN     xe_wa_oob.[ch]

I think we could use "$(notdir $(XE_WA_OOB))" here to avoid hardcoding
the names?

Anyway, the rest looks okay.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +      cmd_wa_oob = $^ $(XE_WA_OOB)
> +
> +$(XE_WA_OOB) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
> +	@mkdir -p $(@D)
> +	$(call cmd,wa_oob)
> +
> +%.o:  $(XE_WA_OOB)
> +
>  # Please keep these build lists sorted!
>  
>  # core driver code
> diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> new file mode 100644
> index 000000000000..930cdb7ccf52
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#define _GNU_SOURCE
> +#include <ctype.h>
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +
> +#define HEADER \
> +	"// SPDX-License-Identifier: MIT\n" \
> +	"\n" \
> +	"/*\n" \
> +	" * DO NOT MODIFY.\n" \
> +	" *\n" \
> +	" * This file was generated from rules: %s\n" \
> +	" */\n" \
> +	"#ifndef _GENERATED_XE_WA_OOB_\n" \
> +	"#define _GENERATED_XE_WA_OOB_\n" \
> +	"\n" \
> +	"enum {\n"
> +
> +#define FOOTER \
> +	"};\n" \
> +	"\n" \
> +	"#endif\n"
> +
> +static void print_usage(FILE *f)
> +{
> +	fprintf(f, "usage: %s <input-rule-file> <generated-c-source-file> <generated-c-header-file>\n",
> +		program_invocation_short_name);
> +}
> +
> +static void print_parse_error(const char *err_msg, const char *line,
> +			      unsigned int lineno)
> +{
> +	fprintf(stderr, "ERROR: %s\nERROR: %u: %.60s\n",
> +		err_msg, lineno, line);
> +}
> +
> +static char *strip(char *line, size_t linelen)
> +{
> +	while (isspace(*(line + linelen)))
> +		linelen--;
> +
> +	line[linelen - 1] = '\0';
> +
> +	return  line + strspn(line, " \f\n\r\t\v");
> +}
> +
> +#define MAX_LINE_LEN 4096
> +static int parse(FILE *input, FILE *csource, FILE *cheader)
> +{
> +	char line[MAX_LINE_LEN + 1];
> +	char *name, *prev_name = NULL, *rules;
> +	unsigned int lineno = 0, idx = 0;
> +
> +	while (fgets(line, sizeof(line), input)) {
> +		size_t linelen;
> +		bool is_continuation;
> +
> +		if (line[0] == '\0' || line[0] == '#' || line[0] == '\n') {
> +			lineno++;
> +			continue;
> +		}
> +
> +		linelen = strlen(line);
> +		if (linelen == MAX_LINE_LEN) {
> +			print_parse_error("line too long", line, lineno);
> +			return -EINVAL;
> +		}
> +
> +		is_continuation = isspace(line[0]);
> +		name = strip(line, linelen);
> +
> +		if (!is_continuation) {
> +			name = strtok(name, " \t");
> +			rules = strtok(NULL, "");
> +		} else {
> +			if (!prev_name) {
> +				print_parse_error("invalid rule continuation",
> +						  line, lineno);
> +				return -EINVAL;
> +			}
> +
> +			rules = name;
> +			name = NULL;
> +		}
> +
> +		if (rules[0] == '\0') {
> +			print_parse_error("invalid empty rule\n", line, lineno);
> +			return -EINVAL;
> +		}
> +
> +		if (name) {
> +			fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
> +			fprintf(csource, "{ XE_RTP_NAME(\"%s\"), XE_RTP_RULES(%s) },\n",
> +				name, rules);
> +		} else {
> +			fprintf(csource, "{ XE_RTP_NAME(NULL), XE_RTP_RULES(%s) },\n",
> +				rules);
> +		}
> +
> +		idx++;
> +		lineno++;
> +		prev_name = name;
> +	}
> +
> +	fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
> +
> +	return 0;
> +}
> +
> +int main(int argc, const char *argv[])
> +{
> +	enum {
> +		ARGS_INPUT,
> +		ARGS_CSOURCE,
> +		ARGS_CHEADER,
> +		_ARGS_COUNT
> +	};
> +	struct {
> +		const char *fn;
> +		const char *mode;
> +		FILE *f;
> +	} args[] = {
> +		[ARGS_INPUT] = { .fn = argv[1], .mode = "r" },
> +		[ARGS_CSOURCE] = { .fn = argv[2], .mode = "w" },
> +		[ARGS_CHEADER] = { .fn = argv[3], .mode = "w" },
> +	};
> +	int ret = 1;
> +
> +	if (argc < 3) {
> +		fprintf(stderr, "ERROR: wrong arguments\n");
> +		print_usage(stderr);
> +		return 1;
> +	}
> +
> +	for (int i = 0; i < _ARGS_COUNT; i++) {
> +		args[i].f = fopen(args[i].fn, args[i].mode);
> +		if (!args[i].f) {
> +			fprintf(stderr, "ERROR: Can't open %s: %m\n",
> +				args[i].fn);
> +			goto err;
> +		}
> +	}
> +
> +	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn);
> +	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
> +		    args[ARGS_CHEADER].f);
> +	if (!ret)
> +		fprintf(args[ARGS_CHEADER].f, FOOTER);
> +
> +err:
> +	for (int i = 0; i < _ARGS_COUNT; i++) {
> +		if (args[i].f)
> +			fclose(args[i].f);
> +	}
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d139554316d4..18eda5b1377f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -321,6 +321,7 @@ int xe_gt_init_early(struct xe_gt *gt)
>  		return err;
>  
>  	xe_wa_process_gt(gt);
> +	xe_wa_process_oob(gt);
>  	xe_tuning_process_gt(gt);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 017ab60f2498..b83c834e7ced 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -368,6 +368,8 @@ struct xe_gt {
>  		unsigned long *engine;
>  		/** @lrc: bitmap with active LRC workarounds */
>  		unsigned long *lrc;
> +		/** @oob: bitmap with active OOB workaroudns */
> +		unsigned long *oob;
>  	} wa_active;
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index b717e0025bd9..ded100245479 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -9,6 +9,7 @@
>  #include <kunit/visibility.h>
>  #include <linux/compiler_types.h>
>  
> +#include "generated/xe_wa_oob.h"
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
> @@ -73,8 +74,8 @@
>   *      engine registers are restored in a context restore sequence. This is
>   *      currently not used in the driver.
>   *
> - * - Other:  There are WAs that, due to their nature, cannot be applied from a
> - *   central place. Those are peppered around the rest of the code, as needed.
> + * - Other/OOB:  There are WAs that, due to their nature, cannot be applied from
> + *   a central place. Those are peppered around the rest of the code, as needed.
>   *   Workarounds related to the display IP are the main example.
>   *
>   * .. [1] Technically, some registers are powercontext saved & restored, so they
> @@ -579,8 +580,31 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	{}
>  };
>  
> +static __maybe_unused const struct xe_rtp_entry oob_was[] = {
> +#include <generated/xe_wa_oob.c>
> +	{}
> +};
> +
> +static_assert(ARRAY_SIZE(oob_was) - 1 == _XE_WA_OOB_COUNT);
> +
>  __diag_pop();
>  
> +/**
> + * xe_wa_process_oob - process OOB workaround table
> + * @gt: GT instance to process workarounds for
> + *
> + * Process OOB workaround table for this platform, marking in @gt the
> + * workarounds that are active.
> + */
> +void xe_wa_process_oob(struct xe_gt *gt)
> +{
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
> +
> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.oob,
> +						  ARRAY_SIZE(oob_was));
> +	xe_rtp_process(&ctx, oob_was);
> +}
> +
>  /**
>   * xe_wa_process_gt - process GT workaround table
>   * @gt: GT instance to process workarounds for
> @@ -641,13 +665,14 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>  int xe_wa_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	size_t n_lrc, n_engine, n_gt, total;
> +	size_t n_oob, n_lrc, n_engine, n_gt, total;
>  	unsigned long *p;
>  
>  	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
>  	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
>  	n_lrc = BITS_TO_LONGS(ARRAY_SIZE(lrc_was));
> -	total = n_gt + n_engine + n_lrc;
> +	n_oob = BITS_TO_LONGS(ARRAY_SIZE(oob_was));
> +	total = n_gt + n_engine + n_lrc + n_oob;
>  
>  	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
>  	if (!p)
> @@ -658,6 +683,8 @@ int xe_wa_init(struct xe_gt *gt)
>  	gt->wa_active.engine = p;
>  	p += n_engine;
>  	gt->wa_active.lrc = p;
> +	p += n_lrc;
> +	gt->wa_active.oob = p;
>  
>  	return 0;
>  }
> @@ -677,4 +704,9 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
>  	drm_printf(p, "\nLRC Workarounds\n");
>  	for_each_set_bit(idx, gt->wa_active.lrc, ARRAY_SIZE(lrc_was))
>  		drm_printf_indent(p, 1, "%s\n", lrc_was[idx].name);
> +
> +	drm_printf(p, "\nOOB Workarounds\n");
> +	for_each_set_bit(idx, gt->wa_active.oob, ARRAY_SIZE(oob_was))
> +		if (oob_was[idx].name)
> +			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index defefa5d9611..cfe685989524 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -11,6 +11,7 @@ struct xe_gt;
>  struct xe_hw_engine;
>  
>  int xe_wa_init(struct xe_gt *gt);
> +void xe_wa_process_oob(struct xe_gt *gt);
>  void xe_wa_process_gt(struct xe_gt *gt);
>  void xe_wa_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
> @@ -18,4 +19,12 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
>  
> +/**
> + * XE_WA - Out-of-band workarounds, that don't fit the lifecycle any
> + *         other more specific type
> + * @gt__: gt instance
> + * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
> + */
> +#define XE_WA(gt__, id__) test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> new file mode 100644
> index 000000000000..e69de29bb2d1
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
