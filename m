Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAD5C77B7E
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 15:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B65810E185;
	Thu, 25 May 2023 15:48:47 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2AE10E185
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 15:48:45 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-64d1e96c082so1815689b3a.1
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 08:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685029725; x=1687621725;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/LlpSIy0hgnU1qPXCyoN0Se1Tsp/1+zsow+VU1eBnsM=;
 b=M3shFMrs84+tYhDJ1ZoTRi2v+vlYJExfuIJ8DXeb1rJ2m8r6TJ3QyMKe6y27Xf26AS
 t5ZNH9xdtZLnPmVOdUfO+Z7rqmSIw80qkrGDBu4WgghLGnG6XaM0HRgE6CGMd6MeIt0/
 b48X5sh26wfDna9eygcoCDA1ZENt6mPUwf4Yrn6opgkvRg1Ogi1Hi4LZiOWNvR5m12si
 To79wXj4iCAKt49mi+sKMpd48vNb9p51EtTYcpvShZhIjDz8KWzs5LCWfOO9uf2jW6/4
 WHDR2sSNMq2eqnu4567BeS/gfYyh9vB7/RnhvbOpd8WTQOhMytk9A5UJbE9giYZzloUM
 GqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685029725; x=1687621725;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/LlpSIy0hgnU1qPXCyoN0Se1Tsp/1+zsow+VU1eBnsM=;
 b=DcNwnw0u6LtyqGdbmtzayrQm8GuHU+HbQ5qRyRbaF8zSkWXoNYVjNOMuU7PePqoSVs
 /Y3c0T3G5H8ItJ5Y2khK3MF75hgTAUtuQYxna9XkQ2accukM8mujgLlHXq/ZmU3KSPkp
 ysz0s3N72pneJVJkxBHllMzWMC4EspGfUa+Y671pH/Y96k5W90oLORlS1122U7pxv3DL
 mGNe8DLgvRCfeijJJjBoOPLRT5wgfm+n9uYe2ZbG+JsXB0ZeuWDJ9hjaw5SSsNyNSvXI
 sfcKUXiLKFFPq8e/yf1oXiFCvDIAd1Gmjr4RiRXGP3rdcud9GilFMZyjdGKwkpmGwXQE
 4r/g==
X-Gm-Message-State: AC+VfDyITXWJrh2bA8PeVEgbkzh0TRP7aMfMV95FXmpq7kYePJPHsQVC
 CMGjMnZrYlWQjFZtV9f2ImnR3lhDnH1OKzqe
X-Google-Smtp-Source: ACHHUZ6dN7j6fRrFblQZvqk9UhiJsXgfolDbw0d3T0C63t+htvuJLv51WP7rISxrJOrX9QGGPGiAug==
X-Received: by 2002:a05:6a21:790:b0:10c:ef18:7473 with SMTP id
 mg16-20020a056a21079000b0010cef187473mr7003233pzb.56.1685029724954; 
 Thu, 25 May 2023 08:48:44 -0700 (PDT)
Received: from mrgency ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 g5-20020aa78745000000b006348cb791f4sm1331866pfo.192.2023.05.25.08.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 08:48:44 -0700 (PDT)
Date: Thu, 25 May 2023 08:48:37 -0700
From: kode54@gmail.com
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-Id: <1918VR.US05UYXGP19H3@gmail.com>
In-Reply-To: <can3buqui3msmblc7bkxo7mb5nfwpdlmsg7abo4sit2hqgpc33@rukg2yblkk67>
References: <20230525015607.2192395-1-kode54@gmail.com>
 <44f4caa513b8b92e322ad7c725fd13b5053a6704.camel@intel.com>
 <can3buqui3msmblc7bkxo7mb5nfwpdlmsg7abo4sit2hqgpc33@rukg2yblkk67>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-pWQqSS4416KBKHVJBRzQ"
Subject: Re: [Intel-xe] [PATCH v2 0/2] Update Xe uAPI in a minimally
 invasive way
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
Cc: "Hazubski, Filip" <filip.hazubski@intel.com>, "Yu,
 Effie" <effie.yu@intel.com>, intel-xe@lists.freedesktop.org, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--=-pWQqSS4416KBKHVJBRzQ
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable



On Thu, May 25 2023 at 08:13:43 AM -07:00:00, Lucas De Marchi=20
<lucas.demarchi@intel.com> wrote:
> On Thu, May 25, 2023 at 01:24:55PM +0000, Jose Souza wrote:
>> Hi
>>=20
>> Planning to push this today,
>> Christopher already have sent the Mesa MR and IGT patch series.
>=20
> the whole point of this series is being able to fix it without having=20
> to
> synchronize with the mesa / media / igt / intel-compute updates. There
> are some reordering in the structs that would better be done before
> applying upstream and when that is done, then we need to sync all the
> UMDs. But not for this.

Unfortunately, all userspace software which is also built for multilib=20
must synchronize with this change, or else their 32-bit userspace will=20
simply fail. In my experience, apps consuming Mesa 32-bit without this=20
change will fail spectacularly, often crashing on startup.

I suppose only Mesa really matters, since most users won't be=20
installing proprietary software that consumes 32-bit OpenCL or VA-API,=20
but there may yet be cases for that. This is usually proprietary=20
software, often involving use of Wine, such as Steam's Proton=20
distribution.

>=20
> Lucas De Marchi
>=20
>> It should not break 64 bits ABI but would be good to update=20
>> intel-compute and media as well.
>>=20
>> On Wed, 2023-05-24 at 18:56 -0700, Christopher Snowhill wrote:
>>> This series takes off from mlankhorst's attempt to do the same,=20
>>> except
>>> instead, it tries to be as minimally invasive to the original uAPI=20
>>> as
>>> possible, by only inserting padding where appropriate to ensure all
>>> 32-bit members are 32-bit aligned, and all 64-bit members are 64-bit
>>> aligned. This should have zero effect on 64-bit hosts versus 64-bit
>>> userspace, so existing native software will operate the same with or
>>> without the update. The only real change is 32-bit compat support=20
>>> for
>>> multilib userspace, which was previously broken.
>>>=20
>>> Also introduces field validation against all of the padding and
>>> reserved fields, which must be zero, in a separate commit.
>>>=20
>>> v2:
>>>   Removed extensions checks where there were none originally.=20
>>> (Jos=E9)
>>>   Moved extraneous parentheses to the correct places. (Lucas)
>>>=20
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com=20
>>> <mailto:maarten.lankhorst@linux.intel.com>>
>>> Signed-off-by: Christopher Snowhill <kode54@gmail.com=20
>>> <mailto:kode54@gmail.com>>
>>>=20
>>> Christopher Snowhill (2):
>>>   drm/xe: Add explicit padding to uAPI definition
>>>   drm/xe: Validate uAPI padding and reserved fields
>>>=20
>>>  drivers/gpu/drm/xe/xe_bo.c              |  6 +++--
>>>  drivers/gpu/drm/xe/xe_engine.c          | 18 ++++++++++---
>>>  drivers/gpu/drm/xe/xe_exec.c            |  4 ++-
>>>  drivers/gpu/drm/xe/xe_mmio.c            |  3 ++-
>>>  drivers/gpu/drm/xe/xe_query.c           |  3 ++-
>>>  drivers/gpu/drm/xe/xe_sync.c            |  4 ++-
>>>  drivers/gpu/drm/xe/xe_vm.c              | 22 +++++++++++++---
>>>  drivers/gpu/drm/xe/xe_vm_madvise.c      |  4 ++-
>>>  drivers/gpu/drm/xe/xe_wait_user_fence.c |  3 ++-
>>>  include/uapi/drm/xe_drm.h               | 34=20
>>> ++++++++++++++++++++++++-
>>>  10 files changed, 85 insertions(+), 16 deletions(-)
>>>=20
>>=20


--=-pWQqSS4416KBKHVJBRzQ
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><br></div></div><div id=3D"geary-q=
uote" dir=3D"auto"><br>On Thu, May 25 2023 at 08:13:43 AM -07:00:00, Lucas =
De Marchi &lt;lucas.demarchi@intel.com&gt; wrote:<br><blockquote type=3D"ci=
te"><div class=3D"plaintext" style=3D"white-space: break-spaces;">On Thu, M=
ay 25, 2023 at 01:24:55PM +0000, Jose Souza wrote:
<blockquote>Hi

Planning to push this today,
Christopher already have sent the Mesa MR and IGT patch series.
</blockquote>
the whole point of this series is being able to fix it without having to
synchronize with the mesa / media / igt / intel-compute updates. There
are some reordering in the structs that would better be done before
applying upstream and when that is done, then we need to sync all the
UMDs. But not for this.</div></blockquote><span style=3D"white-space: break=
-spaces;"><div><span style=3D"white-space: break-spaces;"><br></span></div>=
<div><span style=3D"white-space: break-spaces;">Unfortunately, all userspac=
e software which is also built for multilib must synchronize with this chan=
ge, or else their 32-bit userspace will simply fail. In my experience, apps=
 consuming Mesa 32-bit without this change will fail spectacularly, often c=
rashing on startup.</span></div><div><span style=3D"white-space: break-spac=
es;"><br></span></div><div><span style=3D"white-space: break-spaces;">I sup=
pose only Mesa really matters, since most users won't be installing proprie=
tary software that consumes 32-bit OpenCL or VA-API, but there may yet be c=
ases for that. This is usually proprietary software, often involving use of=
 Wine, such as Steam's Proton distribution.</span></div><br></span><blockqu=
ote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spac=
es;">
Lucas De Marchi

<blockquote>It should not break 64 bits ABI but would be good to update int=
el-compute and media as well.

On Wed, 2023-05-24 at 18:56 -0700, Christopher Snowhill wrote:
<blockquote>This series takes off from mlankhorst's attempt to do the same,=
 except
instead, it tries to be as minimally invasive to the original uAPI as
possible, by only inserting padding where appropriate to ensure all
32-bit members are 32-bit aligned, and all 64-bit members are 64-bit
aligned. This should have zero effect on 64-bit hosts versus 64-bit
userspace, so existing native software will operate the same with or
without the update. The only real change is 32-bit compat support for
multilib userspace, which was previously broken.

Also introduces field validation against all of the padding and
reserved fields, which must be zero, in a separate commit.

v2:
  Removed extensions checks where there were none originally. (Jos=E9)
  Moved extraneous parentheses to the correct places. (Lucas)

Signed-off-by: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lankhorst@li=
nux.intel.com">maarten.lankhorst@linux.intel.com</a>&gt;
Signed-off-by: Christopher Snowhill &lt;<a href=3D"mailto:kode54@gmail.com"=
>kode54@gmail.com</a>&gt;

Christopher Snowhill (2):
  drm/xe: Add explicit padding to uAPI definition
  drm/xe: Validate uAPI padding and reserved fields

 drivers/gpu/drm/xe/xe_bo.c              |  6 +++--
 drivers/gpu/drm/xe/xe_engine.c          | 18 ++++++++++---
 drivers/gpu/drm/xe/xe_exec.c            |  4 ++-
 drivers/gpu/drm/xe/xe_mmio.c            |  3 ++-
 drivers/gpu/drm/xe/xe_query.c           |  3 ++-
 drivers/gpu/drm/xe/xe_sync.c            |  4 ++-
 drivers/gpu/drm/xe/xe_vm.c              | 22 +++++++++++++---
 drivers/gpu/drm/xe/xe_vm_madvise.c      |  4 ++-
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  3 ++-
 include/uapi/drm/xe_drm.h               | 34 ++++++++++++++++++++++++-
 10 files changed, 85 insertions(+), 16 deletions(-)

</blockquote>
</blockquote></div></blockquote></div>
--=-pWQqSS4416KBKHVJBRzQ--

