Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C373CA5FD4
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 15:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFBC10F6DE;
	Thu,  1 Oct 2026 15:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="MUV+0lIl";
	dkim-atps=neutral
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com
 [74.125.225.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5C510F6D6
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 15:10:56 +0000 (UTC)
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e6c0fce17so36550845e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 01 Oct 2026 08:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1790867454; x=1791472254; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=uEqFwwmiLgxzbUfdtxr/SjfsZs2IKekOzMd4LW1gk/0=;
 b=MUV+0lIlNdxkoB2FyKUWg/gQ3Hide7XWZgVLxgr8XAD8ObY/w2Gg2ISGj+c7xNxeQZ
 d9OExxM1xx+C9o3lcMDpUrkohN06iC/rojDkCvOqAAK0mhD6JBGFn4NLvCWJLSbBUHEZ
 IYE4cC2UGDFyeSn51bk5qdOYDMVf98LppkNIfr5cpYv16WAkJvLnYKW9Q2AwdS9nf5U2
 JVgS4CbdusnzqiwYBTZdYQbYqVXNeVmfK6XHkJxHZGK9xXhQ5YjZKTWT51qViq06N/us
 S8ecKIG/4iPsUvC+4Ko5YmGTsD6g+gwhvPXqjlDADD7+2ATnRj1xFQPytR/ocvdrVjUX
 iQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790867454; x=1791472254;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uEqFwwmiLgxzbUfdtxr/SjfsZs2IKekOzMd4LW1gk/0=;
 b=BJcPwTXCcblIo0Vip2TnMss0oW7Y43HYfDsHIb10RWB0gvM+4oKeaIf8VgBTLcoFMV
 RkZkeDNOzTt680OA8DsZ/d/KjWo7vVdA9AT2lKiFrXLcbWkWZ0O5mLciOq7i/a0tbO8N
 WnFKNG9cv3ykG2L73iinj8U8N8/NgkbhFQeJVTdx3ny6BFGrNtreopwP6o8+LD7NMgDV
 CEgmp7oJfA7HS4J2frn1UZRReRxhf3VosrPf3MQu0Xd2hpE7ZyUaiMYypcDNHQwC6RMl
 y253GoXnzIpmUXzgAhIV7CHrcu7629ZfC4PLCapAQWhzRIxsvm+YaSspAFauo/qVzEJj
 BJUA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxSg1jDyNHJdUhMZ+Zys+APlTBeOmTPSn8YE1WTClgC567zYjnXnPVUKKKeGnvAJNuUr1akcLkqEQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mmTqJKtdWWCWucFvn7mUs8n8Ww1BmQ7ogu7ZTl3ATlZbJrJolH
 kpfBNs9zlUmyvifE0FpPsVJ4+6+cwdedQb5YHpsVj9LaTxB22/9xBtMOI/vaAUIPtUw=
X-Gm-Gg: AYBFou0m+0MtuHKpRDcxzv+SLFAPLSj78JsDzms3UbjFbqpkkzlsD3YvLIvEA3OrBJk
 g6tioDcub2fTnIeDvVriw2vPMIR3aszCjHSq46bn9WvFq+ITqkJnJksHqO9AebvFlZdao1EnY1G
 6CQJIZ0shWrmyPDWnTn4QwLi7xXPOmthK40kmuaf3z3e/tCltvHpj5dqXx1x2bUJIr6k0sZoE8o
 KOoS9IRhXkm55WRydhuL9au0J72m1hzntWdkoLpjZGkmnW5Dtl0K7QsWeRnO/Eg4/InmMOZizMP
 Pdygi7keTKpxNdNgfZuGj+ohAXoDacWpnW5YeURQpukLPKW0pmX24ogBxxjHtyPM7EZD0x2FGgi
 3tmgn6GyBsmcFnV2TFZSXrUKa/plEl9Ge8mgz/cffrAJayQnbUxnByK7crXqlw0k49F/6TAbbez
 Te04puK8u3uVi6okl4UnUSE7iFqv3qBhw4/AdHnM8/uLlxog/tG3AHqZS8U2VneBBtP5CaGgGKU
 nw2RrMD6G/9IpotH4l7P2XPx0is0kCfMoo=
X-Received: by 2002:a05:600d:8499:20b0:4a0:1e68:d27d with SMTP id
 5b1f17b1804b1-4a01e68d354mr47259215e9.9.1790867454233; 
 Thu, 01 Oct 2026 08:10:54 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53?
 ([2001:af0:8000:1409:193:86:92:181])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b06a2fc98sm6247090f8f.35.2026.10.01.08.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 08:10:51 -0700 (PDT)
Message-ID: <ca910292-5d3d-47b5-ae40-7ca1688f3c06@suse.com>
Date: Thu, 1 Oct 2026 17:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Remove the error-injection.h include from
 linux/module.h
To: petr.pavlu@suse.com
Cc: Jens Axboe <axboe@kernel.dk>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simon Horman <horms@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Francois Dugast
 <francois.dugast@intel.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, linux-block@vger.kernel.org,
 netdev@vger.kernel.org, linux-api@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260911-module-include-error_injection-v1-0-5da895d8c84d@suse.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260911-module-include-error_injection-v1-0-5da895d8c84d@suse.com>
Content-Type: text/plain; charset=UTF-8
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

On 9/11/26 5:04 PM, Petr Pavlu wrote:
> linux/module.h appears in roughly 15k #include directives across the
> kernel. This makes it a "hot" header, so it should avoid pulling in
> unnecessary definitions.
> 
> The header currently includes linux/error-injection.h to obtain the
> definition of `struct error_injection_entry`. However, this is unnecessary
> because the type is only referenced in the file as a pointer, for which an
> incomplete type is sufficient.
> 
> Add explicit includes of linux/error-injection.h to files that use the
> ALLOW_ERROR_INJECTION() macro and currently rely on it being provided
> indirectly via linux/module.h. Then remove the linux/error-injection.h
> include from linux/module.h.
> 
> The first five patches can go through their respective trees if preferred.
> The final patch depends on the preceding cleanups.

I've queued the series on modules-next for 7.4-rc1.

-- 
Thanks,
Petr
