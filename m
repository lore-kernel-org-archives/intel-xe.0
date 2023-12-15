Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1D1C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 12:38:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548BE10E9FD;
	Fri, 15 Dec 2023 12:38:39 +0000 (UTC)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46EC10E9FD
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 12:38:37 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6d9e756cf32so547257a34.2
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 04:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702643917; x=1703248717; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TbjpTO7sQ0to+cvJJSpxr57uJYyPq3EmFLux1XjLqKM=;
 b=Y6jQjzNV9OWiizKsAF04106v1Tu0ssiap3gYwx4mPScT07whv0MvTW4tc+oCUnSG2a
 UhZMf4lUyFuPFpNEbngjaGY4sBIbxThDAL22EBERWljAKJGxrOyWpZaoDNAL1vRttiW5
 iUEqG1W4hkCKkOhQWxAaVYb3iQwwz2Tlx8W9/APsf9tyLouDMMm5JNQbs8IiCO7R+Njj
 pNU8NNLNfZi56tei0KVtiHy13W0M/dwva2FWEjl5LHMZ/mqrs02uD3p9pZDmBtEkzsDh
 MssZf6sa6wIDzNrU/Ji2s/5evVsIGfERLb6AeHy0BuoVb6hoQO0Qm4TJfn7DARJ6z2Q2
 xhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702643917; x=1703248717;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TbjpTO7sQ0to+cvJJSpxr57uJYyPq3EmFLux1XjLqKM=;
 b=taj7X9ppuM3aCj2urW15mPsj4/0oyZJrhzCR26/TpJMtvPvQb+Tfm6IrkXIjsWCmaa
 8BpOGFgzNH8kN+LF9PK0YmyPzSoG6fvYJauxzrjiJ8jCoEU5vRQRnVnA3rzUtnMrvbXO
 vBf+NW+yaClZ78mobP0JKtf5Rzm5707zX/eYMVCAf+NReNhUy5Xm1vKKudm19pRwKaBB
 1KBiShpLTQ1t5Y4CgSbEq8is48kbpU/wXaVXhwZRNvn27QcWdEH4BeeGI6nZk5A0Uf3R
 wxvmWTkuCggBv5Pr2yGZKyZnyA9MFPwPaKVCDDTlq35cB7tYf3+NusbsnTp5wFHsLugV
 /pbQ==
X-Gm-Message-State: AOJu0YyTIK/d/6NAbujMOwo9DMTz7/xMgLLyUWyr4TNucjfaqVIaJ33v
 KnwjJYsavuhQXv67FXnEafRBgLVTsbrNSVTE6vA=
X-Google-Smtp-Source: AGHT+IGOzTJGp4gd4O+PWlZv69O/PCY1ShG7X3CRHKGBidmn01EJ25hxy00cNCA3cTVzSveFLF2MtIZGCTFGACY+fAg=
X-Received: by 2002:a05:6830:914:b0:6d9:a4d6:a50e with SMTP id
 v20-20020a056830091400b006d9a4d6a50emr13080792ott.75.1702643916764; Fri, 15
 Dec 2023 04:38:36 -0800 (PST)
MIME-Version: 1.0
References: <20231215094329.7-1-francois.dugast@intel.com>
 <c35a24b1-dee6-4e73-9d1b-970e43e9a700@linux.intel.com>
In-Reply-To: <c35a24b1-dee6-4e73-9d1b-970e43e9a700@linux.intel.com>
From: Rodrigo Vivi <rodrigo.vivi@gmail.com>
Date: Fri, 15 Dec 2023 07:38:25 -0500
Message-ID: <CABVU7+v2nsj0b4FX8s1txfZTyX8pqXVj3SOL5fiq7UK_1vXzqg@mail.gmail.com>
Subject: Re: [PATCH] drm/xe/uapi: Remove reset uevent for now
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000d6918a060c8bad5e"
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--000000000000d6918a060c8bad5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 5:13=E2=80=AFAM Aravind Iddamsetty <
aravind.iddamsetty@linux.intel.com> wrote:

>
> On 12/15/23 15:13, Francois Dugast wrote:
> > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >
> > This kernel uevent is getting removed for now. It will come
> > back later with a better future proof name.
> >
> > v2: Rebase (Francois Dugast)
> as mentioned in IGT series we need to drop this commit as well
>
> 14a663d83da2 drm/xe: Introduce fault injection for gt reset.
>

No need for dropping that. We are going to restore the uevent soon. But
with the proper final name.
The problem is only with the uapi because we won=E2=80=99t be able to renam=
e or
change when we are in-tree.




> Thanks,
> Aravind.
>
> >
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c | 18 ------------------
> >  include/uapi/drm/xe_drm.h  | 11 -----------
> >  2 files changed, 29 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index f5d18e98f8b6..3af2adec1295 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -589,20 +589,6 @@ static int do_gt_restart(struct xe_gt *gt)
> >       return 0;
> >  }
> >
> > -static void xe_uevent_gt_reset_failure(struct pci_dev *pdev, u8
> tile_id, u8 gt_id)
> > -{
> > -     char *reset_event[4];
> > -
> > -     reset_event[0] =3D DRM_XE_RESET_FAILED_UEVENT "=3DNEEDS_RESET";
> > -     reset_event[1] =3D kasprintf(GFP_KERNEL, "TILE_ID=3D%d", tile_id)=
;
> > -     reset_event[2] =3D kasprintf(GFP_KERNEL, "GT_ID=3D%d", gt_id);
> > -     reset_event[3] =3D NULL;
> > -     kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, reset_event);
> > -
> > -     kfree(reset_event[1]);
> > -     kfree(reset_event[2]);
> > -}
> > -
> >  static int gt_reset(struct xe_gt *gt)
> >  {
> >       int err;
> > @@ -659,10 +645,6 @@ static int gt_reset(struct xe_gt *gt)
> >  err_fail:
> >       xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> >
> > -     /* Notify userspace about gt reset failure */
> > -     xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
> > -                                gt_to_tile(gt)->id, gt->info.id);
> > -
> >       gt_to_xe(gt)->needs_flr_on_fini =3D true;
> >
> >       return err;
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index b905ab16aa40..8c35ec43faef 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -20,7 +20,6 @@ extern "C" {
> >   *   2. Extension definition and helper structs
> >   *   3. IOCTL's Query structs in the order of the Query's entries.
> >   *   4. The rest of IOCTL structs in the order of IOCTL declaration.
> > - *   5. uEvents
> >   */
> >
> >  /**
> > @@ -1341,16 +1340,6 @@ struct drm_xe_wait_user_fence {
> >       __u64 reserved[2];
> >  };
> >
> > -/**
> > - * DOC: uevent generated by xe on it's pci node.
> > - *
> > - * DRM_XE_RESET_FAILED_UEVENT - Event is generated when attempt to
> reset gt
> > - * fails. The value supplied with the event is always "NEEDS_RESET".
> > - * Additional information supplied is tile id and gt id of the gt unit
> for
> > - * which reset has failed.
> > - */
> > -#define DRM_XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
> > -
> >  #if defined(__cplusplus)
> >  }
> >  #endif
>

--000000000000d6918a060c8bad5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br></div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Dec 15, 2023 at 5:13=E2=80=AFAM Aravi=
nd Iddamsetty &lt;<a href=3D"mailto:aravind.iddamsetty@linux.intel.com">ara=
vind.iddamsetty@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
On 12/15/23 15:13, Francois Dugast wrote:<br>
&gt; From: Rodrigo Vivi &lt;<a href=3D"mailto:rodrigo.vivi@intel.com" targe=
t=3D"_blank">rodrigo.vivi@intel.com</a>&gt;<br>
&gt;<br>
&gt; This kernel uevent is getting removed for now. It will come<br>
&gt; back later with a better future proof name.<br>
&gt;<br>
&gt; v2: Rebase (Francois Dugast)<br>
as mentioned in IGT series we need to drop this commit as well<br>
<br>
14a663d83da2 drm/xe: Introduce fault injection for gt reset.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">No need for drop=
ping that. We are going to restore the uevent soon. But with the proper fin=
al name.</div><div dir=3D"auto">The problem is only with the uapi because w=
e won=E2=80=99t be able to rename or change when we are in-tree.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><br>
Thanks,<br>
Aravind.<br>
<br>
&gt;<br>
&gt; Cc: Himal Prasad Ghimiray &lt;<a href=3D"mailto:himal.prasad.ghimiray@=
intel.com" target=3D"_blank">himal.prasad.ghimiray@intel.com</a>&gt;<br>
&gt; Cc: Lucas De Marchi &lt;<a href=3D"mailto:lucas.demarchi@intel.com" ta=
rget=3D"_blank">lucas.demarchi@intel.com</a>&gt;<br>
&gt; Cc: Francois Dugast &lt;<a href=3D"mailto:francois.dugast@intel.com" t=
arget=3D"_blank">francois.dugast@intel.com</a>&gt;<br>
&gt; Cc: Aravind Iddamsetty &lt;<a href=3D"mailto:aravind.iddamsetty@linux.=
intel.com" target=3D"_blank">aravind.iddamsetty@linux.intel.com</a>&gt;<br>
&gt; Signed-off-by: Rodrigo Vivi &lt;<a href=3D"mailto:rodrigo.vivi@intel.c=
om" target=3D"_blank">rodrigo.vivi@intel.com</a>&gt;<br>
&gt; Signed-off-by: Francois Dugast &lt;<a href=3D"mailto:francois.dugast@i=
ntel.com" target=3D"_blank">francois.dugast@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/xe/xe_gt.c | 18 ------------------<br>
&gt;=C2=A0 include/uapi/drm/xe_drm.h=C2=A0 | 11 -----------<br>
&gt;=C2=A0 2 files changed, 29 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c<b=
r>
&gt; index f5d18e98f8b6..3af2adec1295 100644<br>
&gt; --- a/drivers/gpu/drm/xe/xe_gt.c<br>
&gt; +++ b/drivers/gpu/drm/xe/xe_gt.c<br>
&gt; @@ -589,20 +589,6 @@ static int do_gt_restart(struct xe_gt *gt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void xe_uevent_gt_reset_failure(struct pci_dev *pdev, u8 tile_=
id, u8 gt_id)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char *reset_event[4];<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0reset_event[0] =3D DRM_XE_RESET_FAILED_UEVENT &qu=
ot;=3DNEEDS_RESET&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0reset_event[1] =3D kasprintf(GFP_KERNEL, &quot;TI=
LE_ID=3D%d&quot;, tile_id);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0reset_event[2] =3D kasprintf(GFP_KERNEL, &quot;GT=
_ID=3D%d&quot;, gt_id);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0reset_event[3] =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0kobject_uevent_env(&amp;pdev-&gt;dev.kobj, KOBJ_C=
HANGE, reset_event);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0kfree(reset_event[1]);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0kfree(reset_event[2]);<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 static int gt_reset(struct xe_gt *gt)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; @@ -659,10 +645,6 @@ static int gt_reset(struct xe_gt *gt)<br>
&gt;=C2=A0 err_fail:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xe_gt_err(gt, &quot;reset failed (%pe)\n&quo=
t;, ERR_PTR(err));<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* Notify userspace about gt reset failure */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt=
)-&gt;<a href=3D"http://drm.dev" rel=3D"noreferrer" target=3D"_blank">drm.d=
ev</a>),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gt_to_tile(gt)-&gt;id, gt-&gt;<a=
 href=3D"http://info.id" rel=3D"noreferrer" target=3D"_blank">info.id</a>);=
<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gt_to_xe(gt)-&gt;needs_flr_on_fini =3D true;=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h<br>
&gt; index b905ab16aa40..8c35ec43faef 100644<br>
&gt; --- a/include/uapi/drm/xe_drm.h<br>
&gt; +++ b/include/uapi/drm/xe_drm.h<br>
&gt; @@ -20,7 +20,6 @@ extern &quot;C&quot; {<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A02. Extension definition and helper structs<b=
r>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A03. IOCTL&#39;s Query structs in the order of=
 the Query&#39;s entries.<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A04. The rest of IOCTL structs in the order of=
 IOCTL declaration.<br>
&gt; - *=C2=A0 =C2=A05. uEvents<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /**<br>
&gt; @@ -1341,16 +1340,6 @@ struct drm_xe_wait_user_fence {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 reserved[2];<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; -/**<br>
&gt; - * DOC: uevent generated by xe on it&#39;s pci node.<br>
&gt; - *<br>
&gt; - * DRM_XE_RESET_FAILED_UEVENT - Event is generated when attempt to re=
set gt<br>
&gt; - * fails. The value supplied with the event is always &quot;NEEDS_RES=
ET&quot;.<br>
&gt; - * Additional information supplied is tile id and gt id of the gt uni=
t for<br>
&gt; - * which reset has failed.<br>
&gt; - */<br>
&gt; -#define DRM_XE_RESET_FAILED_UEVENT &quot;DEVICE_STATUS&quot;<br>
&gt; -<br>
&gt;=C2=A0 #if defined(__cplusplus)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 #endif<br>
</blockquote></div></div>

--000000000000d6918a060c8bad5e--
