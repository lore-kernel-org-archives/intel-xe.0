Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDDEC4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 14:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3297F10E6EB;
	Thu,  1 Feb 2024 14:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IcFAN5Uf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F9710E6EB;
 Thu,  1 Feb 2024 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706798238; x=1738334238;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7QE1oSdEYs34fvweOABTlDXl5+mrZIe4v3w06g3MNDA=;
 b=IcFAN5Ufo6FAT//gAF+f6eaLLTOoMflAQMkmJurijvz88H3iLMHsxcc5
 4sgo588BxcFVJDGJpSle9Q5T2MgAsVyM0IGjHkPkTV3psVjYhNQXbfpwg
 jQ+X7qdIggK1AHFsZT7FFYy7U0MlogFTv39+cafkncGlH7u+v2k/CWN9E
 nA6BA33w62WWOoORzfzl3OFyHe/X+c56j9I5MVZfI4BwRy0y6yGhB9Rxe
 kEQJaaRAo5WDXBVPdgvlxcXCxjZW2H37rk0lWacyrCdg9TimoxGeJ7jPp
 OJhLXjYmQ0jS7UHCHcogNIgfEevDiUH3GajdubooPByK0AfwRnNYiLX70 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="401037700"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="401037700"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:37:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="30611349"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 06:37:16 -0800
Date: Thu, 1 Feb 2024 15:37:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 2/6] lib/kmode: Prepare open_parameters() helper
 for reuse by kunit
Message-ID: <20240201143713.2xea7wnwx352p2uu@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <20240131181156.80571-10-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240131181156.80571-10-janusz.krzysztofik@linux.intel.com>
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

Hi Janusz,
On 2024-01-31 at 19:03:49 +0100, Janusz Krzysztofik wrote:
> Move the open_parameters() helper code up in the source file, above the
> kunit related functions, so it is available to follow-up changes of the
> kunit code.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_kmod.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index ad69173151..d1091bdc79 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -803,6 +803,14 @@ void igt_kselftest_get_tests(struct kmod_module *kmod,
>  	kmod_module_info_free_list(pre);
>  }
>  
> +static int open_parameters(const char *module_name)
> +{
> +	char path[256];
> +
> +	snprintf(path, sizeof(path), "/sys/module/%s/parameters", module_name);
> +	return open(path, O_RDONLY);
> +}
> +
>  struct modprobe_data {
>  	struct kmod_module *kmod;
>  	const char *opts;
> @@ -1402,14 +1410,6 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
>  	igt_ktest_fini(&tst);
>  }
>  
> -static int open_parameters(const char *module_name)
> -{
> -	char path[256];
> -
> -	snprintf(path, sizeof(path), "/sys/module/%s/parameters", module_name);
> -	return open(path, O_RDONLY);
> -}
> -
>  int igt_ktest_init(struct igt_ktest *tst,
>  		   const char *module_name)
>  {
> -- 
> 2.43.0
> 
