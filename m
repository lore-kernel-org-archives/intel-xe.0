Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A50C44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 12:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C165E10F028;
	Wed, 15 Jul 2026 12:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nfaemjg6";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8858410F028
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 12:42:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 19DCE40D7B;
 Wed, 15 Jul 2026 12:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07AB1F000E9;
 Wed, 15 Jul 2026 12:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1784119367;
 bh=cu6L77LE5KKihHgixtsouBZm1/r4ptLw2MR+eA4KN6w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=nfaemjg6sZ+w2lUl33YsBotOLUOmSM7V4p2/LB+Z+0pCkwXb0bjHUWCDT7Ij5OZzo
 o1ag9r9c1fAGG1/rCxXPFPSDWvM3IuZveu9T8trRmM7DXOmx/j1G4j1aSFgPVxWAI8
 rGa8eIr+81jAe+YkBk6NR+e1IE3Sq5IAo+/RA29l6LyuRzMjMRXNnydESDH2+hhUNB
 tQ91ECmEFZnU9Mdp3ZA45eORanLh0E941P9UtT44yrx/cCjwyIw9CQ9snnz9DlrKPe
 WeY+bUPd4+qds2h8R43kXWnsdowh5ccg26X6WsWvE0iC4rJOyOc61OTF0kEfG4VVv3
 Dz404dnK248Mg==
Received: from localhost ([::1]) by mail.kernel.org with esmtp (Exim 4.99.4)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1wjywm-00000005xHe-3LUQ; Wed, 15 Jul 2026 14:42:44 +0200
Date: Wed, 15 Jul 2026 14:42:43 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ryszard Knop <ryszard.knop@intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 Shuicheng Lin <shuicheng.lin@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] scripts/kernel-doc: Suggest possible names for
 excess descriptions
Message-ID: <20260715144243.60686000@localhost>
In-Reply-To: <20260715111726.394565-1-ryszard.knop@intel.com>
References: <20260714111208.323108-1-ryszard.knop@intel.com>
 <20260715111726.394565-1-ryszard.knop@intel.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 15 Jul 2026 13:17:26 +0200
Ryszard Knop <ryszard.knop@intel.com> wrote:

> Since check_sections() now warns if a documentation tag member name is
> the same as defined in the struct, we can suggest names the checker
> knows, so that it's more obvious how to deal with the warning.
> 
> v2 (rdunlap):
> - Strip whitespace from warnings, nicer when the hint is empty
> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index 2dedda215c22..a22c3e3182f0 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -558,6 +558,13 @@ class KernelDoc:
>                          self.push_parameter(ln, decl_type, param, dtype,
>                                              arg, declaration_name)
>  
> +    def get_suggestions_hint(self, decl_name, possible_names):
> +        suggestions = set(name for name in possible_names if decl_name in name)
> +        if not suggestions:
> +            return ""
> +
> +        return f"(did you mean one of: '{"', '".join(suggestions)}')"
> +

There is a better way to propose suggestions. See:
	Documentation/sphinx/kernel_include.py

E.g. use something like:

	from difflib import get_close_matches

	matches = get_close_matches(decl_name, possible_names)

See: https://docs.python.org/3/library/difflib.html#difflib.get_close_matches

If the problem is due to a typo, this will likely return the
right name.

Regards,
Mauro
