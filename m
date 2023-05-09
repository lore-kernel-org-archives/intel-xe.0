Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AC4C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 13:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909BA10E12D;
	Tue,  9 May 2023 13:22:02 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D626310E12D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 13:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683638519; x=1715174519;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gjxeV9UklEhoe43iKuny31wBabIGz+ugzkQt5WqbHH8=;
 b=E/bGtgKPLiJ7aMrYw7DEgkQzBmXz1ZfIHDyFgDcpS+Y0nXoyYPt0Fenc
 vWn0pb87actPOOg1rFwU3WqbvKeFkN8ikag8Pw/7BoRH14prFqrrQQbaD
 97kunTBAxXqJgyg0XhEWlfhTb0A7WSRDnyDSV2nU/8RfBHB2rndRqnaSs
 VIMb6/GaCXN8oaudc0O/uOUOwz8M4rOjf6uhrakl5Z2D/e1O2ckt9PC53
 SF9EbsPR8TrXxY0Foj6p8rq4PMe2hXgv4wxfPBqpagAcSO9R1bMOt205x
 eFSywmy+6jlIzco+cVwxM6xJS+2xODipdbyUUtanQDl/AXmExzCeCbj+Q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="352986657"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="352986657"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 06:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="729507564"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="729507564"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 06:21:58 -0700
Message-ID: <f5c99897-c577-eb39-b6c0-d46e00832b40@linux.intel.com>
Date: Tue, 9 May 2023 15:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-14-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-14-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 13/31] maple_tree: split up MA_STATE()
 macro
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
Cc: Danilo Krummrich <dakr@redhat.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/2/23 02:17, Matthew Brost wrote:
> From: Danilo Krummrich <dakr@redhat.com>
>
> Split up the MA_STATE() macro such that components using the maple tree
> can easily inherit from struct ma_state and build custom tree walk
> macros to hide their internals from users.

I might misunderstand the patch, but isn't the real purpose to provide 
an MA_STATE initializer,and the way to achieve that is to split up the 
MA_STATE macro?

>
> Example:
>
> struct sample_iterator {
>          struct ma_state mas;
>          struct sample_mgr *mgr;
> };
>
> \#define SAMPLE_ITERATOR(name, __mgr, start)                    \
>          struct sample_iterator name = {                         \
>                  .mas = MA_STATE_INIT(&(__mgr)->mt, start, 0),   \
>                  .mgr = __mgr,                                   \
>          }
>
> \#define sample_iter_for_each_range(it__, entry__, end__) \
>          mas_for_each(&(it__).mas, entry__, end__)
>
> --
>
> struct sample *sample;
> SAMPLE_ITERATOR(si, min);
>
> sample_iter_for_each_range(&si, sample, max) {
>          frob(mgr, sample);
> }
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>   include/linux/maple_tree.h | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
> index 1fadb5f5978b..87d55334f1c2 100644
> --- a/include/linux/maple_tree.h
> +++ b/include/linux/maple_tree.h
> @@ -423,8 +423,8 @@ struct ma_wr_state {
>   #define MA_ERROR(err) \
>   		((struct maple_enode *)(((unsigned long)err << 2) | 2UL))
>   
> -#define MA_STATE(name, mt, first, end)					\
> -	struct ma_state name = {					\
> +#define MA_STATE_INIT(mt, first, end)					\
> +	{								\

Naming: following the convention in, for example, the mutex and ww mutex 
code this should've been called

__MA_STATE_INITIALIZER(),

whereas the decapitalized name ma_state_init() would've been a (possibly 
inline) init function if it existed.

But this all should ofc be run by the maple tree maintainer(s).

FWIW, with these things addressed the change LGTM.

/Thomas


>   		.tree = mt,						\
>   		.index = first,						\
>   		.last = end,						\
> @@ -435,6 +435,9 @@ struct ma_wr_state {
>   		.mas_flags = 0,						\
>   	}
>   
> +#define MA_STATE(name, mt, first, end)					\
> +	struct ma_state name = MA_STATE_INIT(mt, first, end)
> +
>   #define MA_WR_STATE(name, ma_state, wr_entry)				\
>   	struct ma_wr_state name = {					\
>   		.mas = ma_state,					\
